using System;
using GameConfiguration.Cards;
using GameConfiguration.Directors.Functions;
using UnityEngine;
using GameConfiguration.Directors.Elites;

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
                    OnCardSpawned(result, spawnCard, directorSpawnRequest);
                }
                onComplete?.Invoke(result);
            });
        }
    
        private void OnCardSpawned(SpawnCard.SpawnResult result, SpawnCard spawn, DirectorSpawnRequest request)
        {
            SpawnCard spawnCard = spawn;
            GameObject bodyObject = result.SpawnedInstance;
            DeathRewards component3 = bodyObject.GetComponentInChildren<DeathRewards>();
            if (component3)
            {
                float valueMultiplier = Mathf.Max(1f, request.EliteValueMultiplier);
                float b = spawnCard.DirectorCreditCost * valueMultiplier;
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
            
            if (request.Elite)
            {
                var enemyCore = bodyObject.GetComponentInChildren<Enemies.StateMachine.Core>();
                if (enemyCore)
                {
                    enemyCore.MaxHealth *= request.Elite.HealthBoostCoefficient;
                    enemyCore.Health = Mathf.Min(enemyCore.Health * request.Elite.HealthBoostCoefficient, enemyCore.MaxHealth);
                    enemyCore.Damage *= request.Elite.DamageBoostCoefficient;
                }
                var renderer = bodyObject.GetComponentInChildren<Renderer>();
                if (renderer)
                {
                    if (request.Elite.OverrideMaterial)
                    {
                        renderer.material = request.Elite.OverrideMaterial;
                    }
                    else
                    {
                        if (renderer.material && renderer.material.HasProperty("_Color"))
                        {
                            var c = request.Elite.TintColor;
                            renderer.material.color = c;
                        }
                    }
                }

                if (request.Elite.Modifiers != null)
                {
                    foreach (var modifier in request.Elite.Modifiers)
                    {
                        if (modifier)
                        {
                            modifier.OnApply(bodyObject);
                        }
                    }
                }
            }
        }
    }
}
