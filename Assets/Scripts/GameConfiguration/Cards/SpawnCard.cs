using System;
using System.Collections;
using Audio;
using GameConfiguration.Directors.Functions;
using UnityEngine;

namespace GameConfiguration.Cards
{
    [CreateAssetMenu]
    public class SpawnCard : ScriptableObject
    {
        public int DirectorCreditCost;
        public GameObject Prefab;
        public bool UseSpawnEffect;
        public GameObject SpawnEffectPrefab;
        public Vector3 SpawnEffectOffset = new Vector3(0f, 1f, 0f);
        public float DelayBeforeSpawnSeconds = 3.75f;
        public string SpawnSfxName = "SpawnMobs";

        private void Spawn(Transform transform, Quaternion rotation, DirectorSpawnRequest spawnRequest, ref SpawnResult spawnResult)
        {
            GameObject gameObject = Instantiate(Prefab, transform.position, rotation, transform);
            gameObject.name = Prefab.name;
            spawnResult.SpawnedInstance = gameObject;
            spawnResult.Success = true;
            GameConfig.Instance.EnemyList.Add(spawnResult.SpawnedInstance);
        }
        
        public SpawnResult DoSpawn(Transform transform, Quaternion rotation, DirectorSpawnRequest spawnRequest)
        {
            SpawnResult spawnResult = new SpawnResult()
            {
                SpawnRequest = spawnRequest,
                CardTransform = transform,
                Rotation = rotation
            };
            Spawn(transform, rotation, spawnRequest, ref spawnResult);
            return spawnResult;
        }
        
        public void DoSpawnWithEffect(MonoBehaviour coroutineRunner, Transform transform, Quaternion rotation, DirectorSpawnRequest spawnRequest, Action<SpawnResult> onComplete = null)
        {
            if (!coroutineRunner)
            {
                var immediate = DoSpawn(transform, rotation, spawnRequest);
                onComplete?.Invoke(immediate);
                return;
            }
            coroutineRunner.StartCoroutine(SpawnWithEffectRoutine(transform, rotation, spawnRequest, onComplete));
        }

        private IEnumerator SpawnWithEffectRoutine(Transform transform, Quaternion rotation, DirectorSpawnRequest spawnRequest, Action<SpawnResult> onComplete)
        {
            if (!string.IsNullOrEmpty(SpawnSfxName) && AudioManager.instance)
            {
                AudioManager.instance.PlaySFX(SpawnSfxName);
            }
            
            if (UseSpawnEffect && SpawnEffectPrefab)
            {
                Vector3 effectPosition = transform.position + SpawnEffectOffset;
                Instantiate(SpawnEffectPrefab, effectPosition, Quaternion.identity, transform);
            }
            
            if (DelayBeforeSpawnSeconds > 0f)
            {
                yield return new WaitForSeconds(DelayBeforeSpawnSeconds);
            }

            var result = new SpawnResult()
            {
                SpawnRequest = spawnRequest,
                CardTransform = transform,
                Rotation = rotation,
                Success = false,
                SpawnedInstance = null
            };

            Spawn(transform, rotation, spawnRequest, ref result);
            onComplete?.Invoke(result);
        }
        
        public struct SpawnResult
        {
            public GameObject SpawnedInstance;
            public DirectorSpawnRequest SpawnRequest;
            public Transform CardTransform;
            public Quaternion Rotation;
            public bool Success;
        }
    }
}
