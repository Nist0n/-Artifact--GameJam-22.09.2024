using GameConfiguration.Cards;
using GameConfiguration.Directors.Functions;
using UnityEngine;

namespace GameConfiguration.Directors
{
    public class DirectorCore : MonoBehaviour
    {
        public static DirectorCore instance { get; private set; }
    
        private const float ExpRewardCoefficient = 0.2f;
        private const float GoldRewardCoefficient = 1f;

        private void OnEnable()
        {
            if (!instance) instance = this;
        }

        private void OnDisable()
        {
            if (!(instance == this)) return;
            instance = null;
        }

        public GameObject TrySpawnObject(DirectorSpawnRequest directorSpawnRequest, Transform spawnTarget)
        {
            SpawnCard spawnCard = directorSpawnRequest.SpawnCardObject;
      
            GameObject spawnCardObject = null;
      
            Quaternion quaternion = Quaternion.Euler(0f, 0f, 0f);
      
            SpawnCard.SpawnResult result = spawnCard.DoSpawn(spawnTarget, quaternion, directorSpawnRequest);

            spawnCardObject = result.SpawnedInstance;

            if (spawnCardObject)
            {
                OnCardSpawned(result, spawnCard);
            }
          
            return spawnCardObject;
        }

        // Delayed spawn path: mirrors TrySpawnObject but completes after effect+delay
        public void TrySpawnObjectWithEffect(DirectorSpawnRequest directorSpawnRequest, Transform spawnTarget, MonoBehaviour coroutineRunner, System.Action<SpawnCard.SpawnResult> onComplete = null)
        {
            SpawnCard spawnCard = directorSpawnRequest.SpawnCardObject;
            Quaternion quaternion = Quaternion.Euler(0f, 0f, 0f);

            spawnCard.DoSpawnWithEffect(coroutineRunner, spawnTarget, quaternion, directorSpawnRequest, result =>
            {
                if (result.SpawnedInstance)
                {
                    OnCardSpawned(result, spawnCard);
                }
                onComplete?.Invoke(result);
            });
        }
    
        private void OnCardSpawned(SpawnCard.SpawnResult result, SpawnCard spawn)
        {
            SpawnCard spawnCard = spawn;
            GameObject bodyObject = result.SpawnedInstance;
            DeathRewards component3 = bodyObject.GetComponentInChildren<DeathRewards>();
            if (component3)
            {
                float b = spawnCard.DirectorCreditCost * ExpRewardCoefficient;
                component3.spawnValue = (int) Mathf.Max(1f, b);
                if (b > Mathf.Epsilon)
                {
                    component3.expReward = Mathf.Max(1f, b * GameConfig.Instance.GameDifficulty);
                    component3.goldReward = Mathf.Max(1f, b * GoldRewardCoefficient * 2.0f * GameConfig.Instance.GameDifficulty);
                }
                else
                {
                    component3.expReward = 0;
                    component3.goldReward = 0;
                }
            }
        }
    }
}
