using System;
using System.Collections;
using System.Collections.Generic;
using Enemies;
using GameConfiguration;
using GameConfiguration.Settings.Audio;
using GameEvents.Timed.Events;
using Optimization;
using Towers.Abilities.Passive;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.Serialization;
using UnityEngine.UI;

namespace Towers
{
    public class Tower : MonoBehaviour
    {
        public float damage;
        public float fireRate; // Time between shots (in seconds)
        public float attackRange;

        [SerializeField] protected bool slowness;
        
		private float _slowMultiplier = 1f; 
		private float _slowDuration = 3f;
        private float _slowCount;

        [SerializeField] private GameObject projectilePrefab;

        [SerializeField] private AbilityTowerBuff abilityTowerBuff;

        [SerializeField] private RechargeAbility rechargeAbility;

        public TowerCamera towerCameraComp;
        
        public CinemachineCamera towerCamera;

        protected GameObject CurrentTarget;

        private bool _canShoot = true;
        public bool Piloted;

        public static float BuffDuration = 10f;
        private static float _cdDuration = 60f;

        private float _buffTimer;
        private float _cdTimer;
        
        public bool IsOnCooldown;
        
        public List<GameObject> enemiesInRange;

        public float buffedFireRatePercent;
        public float buffedDamagePercent;
        
        public float initialDamage;
        public float initialFireRate;
        private float _initialAttackRange;

        public AudioSource audioSource;

        [SerializeField] private bool isBuffed;
        
        private float _lastEnemyCheckTime;
        private const float EnemyCheckInterval = 0.1f;
        private float _attackRangeSqr;

        private void OnEnable()
        {
            RangeGiga.OnRangeBuff += ResetTowerStats;
        }

        private void OnDisable()
        {
            RangeGiga.OnRangeBuff -= ResetTowerStats;
        }

        private void Start()
        {
            initialDamage = damage;
            initialFireRate = fireRate;
            _initialAttackRange = attackRange;
            _attackRangeSqr = attackRange * attackRange;
            
            if (enemiesInRange == null)
            {
                enemiesInRange = new List<GameObject>();
            }
        }
        
        private void Update()
        {
            UpdateBuffsAndCooldowns();
            
            if (GameConfig.Instance.HasLost || GameConfig.Instance.HasWon || GameConfig.Instance.ShopIsOpened)
            {
                return;
            }
            
            if (Time.time - _lastEnemyCheckTime >= EnemyCheckInterval)
            {
                UpdateEnemiesInRange();
                _lastEnemyCheckTime = Time.time;
            }

            if (enemiesInRange.Count == 0)
            {
                return;
            }
            
            UpdateCurrentTarget();
            
            HandleShooting();
        }
        
        private void UpdateBuffsAndCooldowns()
        {
            if (isBuffed)
            {
                _buffTimer += Time.deltaTime;
                if (_buffTimer >= BuffDuration)
                {
                    isBuffed = false;
                    IsOnCooldown = true;
                    _buffTimer = 0;
                    ResetTowerStats();
                }
            }

            if (IsOnCooldown)
            {
                _cdTimer += Time.deltaTime;
                if (_cdTimer >= _cdDuration)
                {
                    IsOnCooldown = false;
                    _cdTimer = 0;
                }
            }
        }
        
        private void UpdateEnemiesInRange()
        {
            enemiesInRange.Clear();
            
            if (GameConfig.Instance.EnemyList.Count == 0)
            {
                ResetVariables();
                return;
            }
            
            Vector3 towerPos = transform.position;
            
            foreach (GameObject enemy in GameConfig.Instance.EnemyList)
            {
                if (!enemy) continue;
                
                if (Vector3.SqrMagnitude(enemy.transform.position - towerPos) < _attackRangeSqr)
                {
                    enemiesInRange.Add(enemy);
                }
            }
        }
        
        private void UpdateCurrentTarget()
        {
            if (enemiesInRange.Count == 0)
            {
                CurrentTarget = null;
                return;
            }
            
            float smallestSqrDist = float.MaxValue;
            GameObject closestEnemyToMainBuilding = enemiesInRange[0];
            
            foreach (var enemy in enemiesInRange)
            {
                if (!enemy) continue;
                
                Enemy enemyComponent = ComponentCache.GetCachedComponent<Enemy>(enemy);
                
                if (enemyComponent?.navMeshAgent?.path?.corners == null) continue;
                
                float sqrDistance = 0;
                var corners = enemyComponent.navMeshAgent.path.corners;
                
                for (int j = 0; j < corners.Length - 1; ++j)
                {
                    sqrDistance += (corners[j] - corners[j + 1]).sqrMagnitude;
                }

                if (sqrDistance < smallestSqrDist)
                {
                    smallestSqrDist = sqrDistance;
                    closestEnemyToMainBuilding = enemy;
                }
            }
            
            CurrentTarget = closestEnemyToMainBuilding;
        }
        
        private void HandleShooting()
        {
            if (!_canShoot) return;
            
            if (!Piloted)
            {
                SuppressTower();
                StartCoroutine(Shoot(transform.position, CurrentTarget)); 
                return;
            }
            
            if (Input.GetMouseButton(0))
            {
                if (!towerCameraComp?.CurrentTarget) return;
                
                var enemyPos = towerCameraComp.CurrentTarget.transform.position;
                var position = transform.position;
                
                float sqrDistance = Vector3.SqrMagnitude(position - enemyPos);
                if (sqrDistance > _attackRangeSqr) return;

                ResetTowerStats();
                StartCoroutine(Shoot(position, towerCameraComp.CurrentTarget));
            }
        }

        private void ResetVariables()
        {
            CurrentTarget = null;
            _canShoot = true;
            StopCoroutine(nameof(Shoot));
        }

		private IEnumerator Shoot(Vector3 currentPos, GameObject target)
        {
            _canShoot = false;
            
            if (target is not null)
            {
                Enemy enemy = ComponentCache.GetCachedComponent<Enemy>(target);
                if (enemy && enemy.Health > 0)
                {
                    Projectile projectile = ProjectilePool.Instance?.GetProjectile();
                    if (projectile)
                    {
                        Vector3 projectilePos =
                            new Vector3(currentPos.x, currentPos.y + 12.7f, currentPos.z);
                        projectile.transform.position = projectilePos;
							projectile.damage = initialDamage;
							projectile.slowness = slowness;
							projectile.SlowMultiplier = _slowMultiplier;
							projectile.SlowDuration = _slowDuration;
                        projectile.CurrentTarget = target;
                        projectile.FiringTower = this;
                        AudioManager.Instance.PlayLocalSound("Tower", audioSource);
                    }
                    else
                    {
                        Vector3 projectilePos =
                            new Vector3(currentPos.x, currentPos.y + 12.7f, currentPos.z);
                        Projectile fallbackProjectile = Instantiate(projectilePrefab, projectilePos, Quaternion.identity).GetComponent<Projectile>();
							fallbackProjectile.damage = initialDamage;
							fallbackProjectile.slowness = slowness;
							fallbackProjectile.SlowMultiplier = _slowMultiplier;
							fallbackProjectile.SlowDuration = _slowDuration;
                        fallbackProjectile.CurrentTarget = target;
                        fallbackProjectile.FiringTower = this;
                        AudioManager.Instance.PlayLocalSound("Tower", audioSource);
                    }
                }
            }

            yield return new WaitForSeconds(initialFireRate);
            _canShoot = true;
        }

        private void OnDrawGizmos()
        {
            Gizmos.color = Color.cyan;
            Gizmos.DrawWireSphere(transform.position, attackRange);
        }

        public void EmpowerTower()
        {
            if (IsOnCooldown || isBuffed)
            {
                return;
            }
            
            Buff();
        }

        private void Buff()
        {
            isBuffed = true;
            initialFireRate = fireRate / (1 + abilityTowerBuff.AbilityFireRateBuff) * buffedFireRatePercent;
            initialDamage = Mathf.Round(damage * abilityTowerBuff.AbilityDamageBuff) * buffedDamagePercent;
        }

        private void ResetTowerStats()
        {
            if (isBuffed)
            {
                initialDamage = Mathf.Round(damage * abilityTowerBuff.AbilityDamageBuff) * buffedDamagePercent;
                initialFireRate = fireRate / (1 + abilityTowerBuff.AbilityFireRateBuff) * buffedFireRatePercent;
                return;
            }
            
            initialDamage = Mathf.Round(damage * abilityTowerBuff.AbilityDamageBuff);
            initialFireRate = fireRate / (1 + abilityTowerBuff.AbilityFireRateBuff);
            attackRange = _initialAttackRange + (1.4f * abilityTowerBuff.AbilityRangeBuff / (0.1f * abilityTowerBuff.AbilityRangeBuff + 0.3f));
            
            _attackRangeSqr = attackRange * attackRange;
        }

        private void SuppressTower()
        {
            initialDamage = Mathf.Round(damage * abilityTowerBuff.AbilityDamageBuff) / 2;
            initialFireRate = fireRate / (1 + abilityTowerBuff.AbilityFireRateBuff) * 2;
        }

		public void SetSlowness()
        {
            _slowCount++;
            
            float multiplier = Mathf.Max(0.2f, Mathf.Pow(0.9f, _slowCount));
            
            float duration = Mathf.Min(6f, 2.5f + 0.2f * _slowCount);
            
			slowness = true;
            
			_slowMultiplier = Mathf.Clamp(multiplier, 0.1f, 1f);
            
			_slowDuration = Mathf.Max(0.1f, duration);
		}

        public void DisplayCd()
        {
            if (isBuffed)
            {
                rechargeAbility.AbilityImage.enabled = true;
                rechargeAbility.GetProperties(_buffTimer, BuffDuration);
            }
            else
            {
                rechargeAbility.AbilityImage.enabled = false;
                rechargeAbility.GetProperties(_cdTimer, _cdDuration);
            }
        }
    }
}
