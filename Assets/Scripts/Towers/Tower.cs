using System;
using System.Collections;
using System.Collections.Generic;
using Enemies;
using GameConfiguration;
using GameConfiguration.Settings.Audio;
using Optimization;
using Towers.Abilities.Passive;
using Unity.Cinemachine;
using UnityEngine;

namespace Towers
{
    public class Tower : MonoBehaviour
    {
        [SerializeField] protected bool slowness;
        [SerializeField] private GameObject projectilePrefab;
        [SerializeField] private AbilityTowerBuff abilityTowerBuff;
        [SerializeField] private RechargeAbility rechargeAbility;
        [SerializeField] private bool isBuffed;

        protected GameObject CurrentTarget;

        public static float BuffDuration = 10f;
        private static float _cdDuration = 60f;

        private float _buffTimer;
        private float _cdTimer;
        private float _initialDamage;
        private float _initialFireRate;
        private float _initialAttackRange;
        private float _slowMultiplier = 1f; 
        private float _slowDuration = 3f;
        private float _slowCount;
        private float _lastEnemyCheckTime;
        private const float EnemyCheckInterval = 0.1f;
        private float _attackRangeSqr;
        private bool _canShoot = true;
        private float _experience = 0;
        private int _level = 1;
        private Action _onLevelUp;
        
        public bool IsOnCooldown;
        public List<GameObject> EnemiesInRange;
        public float BuffedFireRatePercent;
        public float BuffedDamagePercent;
        public TowerCamera TowerCameraComp;
        public CinemachineCamera TowerCamera;
        public AudioSource audioSource;
        public bool Piloted;
        public float damage;
        public float fireRate; // Time between shots (in seconds)
        public float attackRange;

        private void OnEnable()
        {
            RangeGiga.OnRangeBuff += ResetTowerStats;
            StaticClasses.GameEvents.EnemyDeath += GetExp;
            _onLevelUp += UpdateDamagePerLevel;
        }

        private void OnDisable()
        {
            RangeGiga.OnRangeBuff -= ResetTowerStats;
            StaticClasses.GameEvents.EnemyDeath -= GetExp;
            _onLevelUp -= UpdateDamagePerLevel;
        }

        private void Start()
        {
            _initialDamage = damage;
            _initialFireRate = fireRate;
            _initialAttackRange = attackRange;
            _attackRangeSqr = attackRange * attackRange;
            
            if (EnemiesInRange == null)
            {
                EnemiesInRange = new List<GameObject>();
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

            if (EnemiesInRange.Count == 0)
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
            EnemiesInRange.Clear();
            
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
                    EnemiesInRange.Add(enemy);
                }
            }
        }
        
        private void UpdateCurrentTarget()
        {
            if (EnemiesInRange.Count == 0)
            {
                CurrentTarget = null;
                return;
            }
            
            float smallestSqrDist = float.MaxValue;
            GameObject closestEnemyToMainBuilding = EnemiesInRange[0];
            
            foreach (var enemy in EnemiesInRange)
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
                if (!TowerCameraComp?.CurrentTarget) return;
                
                var enemyPos = TowerCameraComp.CurrentTarget.transform.position;
                var position = transform.position;
                
                float sqrDistance = Vector3.SqrMagnitude(position - enemyPos);
                if (sqrDistance > _attackRangeSqr) return;

                ResetTowerStats();
                StartCoroutine(Shoot(position, TowerCameraComp.CurrentTarget));
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
							projectile.damage = _initialDamage;
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
							fallbackProjectile.damage = _initialDamage;
							fallbackProjectile.slowness = slowness;
							fallbackProjectile.SlowMultiplier = _slowMultiplier;
							fallbackProjectile.SlowDuration = _slowDuration;
                        fallbackProjectile.CurrentTarget = target;
                        fallbackProjectile.FiringTower = this;
                        AudioManager.Instance.PlayLocalSound("Tower", audioSource);
                    }
                }
            }

            yield return new WaitForSeconds(_initialFireRate);
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
            _initialFireRate = fireRate / (1 + abilityTowerBuff.AbilityFireRateBuff) * BuffedFireRatePercent;
            _initialDamage = Mathf.Round(damage * abilityTowerBuff.AbilityDamageBuff) * BuffedDamagePercent;
        }

        private void ResetTowerStats()
        {
            if (isBuffed)
            {
                _initialDamage = Mathf.Round(damage * abilityTowerBuff.AbilityDamageBuff) * BuffedDamagePercent;
                _initialFireRate = fireRate / (1 + abilityTowerBuff.AbilityFireRateBuff) * BuffedFireRatePercent;
                return;
            }
            
            _initialDamage = Mathf.Round(damage * abilityTowerBuff.AbilityDamageBuff);
            _initialFireRate = fireRate / (1 + abilityTowerBuff.AbilityFireRateBuff);
            attackRange = _initialAttackRange + (1.4f * abilityTowerBuff.AbilityRangeBuff / (0.1f * abilityTowerBuff.AbilityRangeBuff + 0.3f));
            
            _attackRangeSqr = attackRange * attackRange;
        }

        private void SuppressTower()
        {
            _initialDamage = Mathf.Round(damage * abilityTowerBuff.AbilityDamageBuff) / 2;
            _initialFireRate = fireRate / (1 + abilityTowerBuff.AbilityFireRateBuff) * 2;
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
        
        private void GetExp(float money, float souls)
        {
            _experience += money;
            UpdateLevel();
        }

        private void UpdateLevel()
        {
            int newLevel = Mathf.FloorToInt(Mathf.Log(1 + 0.0275f * _experience, 1.55f) + 1);
            
            if (newLevel != _level)
            {
                _level = newLevel;
                Debug.Log($"Level: {_level}");
                
                _onLevelUp?.Invoke();
            }
        }

        private void UpdateDamagePerLevel()
        {
            damage += 0.4f;
        }
    }
}
