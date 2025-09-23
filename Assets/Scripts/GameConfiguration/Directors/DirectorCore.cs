using System;
using GameConfiguration.Cards;
using GameConfiguration.Directors.Functions;
using UnityEngine;

namespace GameConfiguration.Directors
{
    public class DirectorCore : MonoBehaviour
    {
        public static DirectorCore instance { get; private set; }

        private void OnEnable()
        {
            if (!instance) instance = this;
        }

        private void OnDisable()
        {
            if (!(instance == this)) return;
            instance = null;
        }
        
        public void TrySpawnObjectWithEffect(DirectorSpawnRequest directorSpawnRequest, Transform spawnTarget, MonoBehaviour coroutineRunner, Action<SpawnCard.SpawnResult> onComplete = null)
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
                float b = spawnCard.DirectorCreditCost;
                component3.spawnValue = (int) Mathf.Max(1f, b);
                if (b > Mathf.Epsilon)
                {
                    component3.expReward = Mathf.Max(1f, b * 2 * GameConfig.Instance.GameDifficulty);
                    component3.goldReward = Mathf.Max(1f, b * GameConfig.Instance.GameDifficulty);
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
