using System.Collections;
using System.Collections.Generic;
using Enemies;
using GameConfiguration;
using GameConfiguration.Settings.Audio;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.Serialization;

namespace Towers
{
    public class Tower : MonoBehaviour
    {
        public float damage;
        public float fireRate; // Time between shots (in seconds)
        public float attackRange;

        [SerializeField] protected bool slowness;

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

        [FormerlySerializedAs("_audioSource")] public AudioSource audioSource;

        [SerializeField] private bool isBuffed;
        
        private void Start()
        {
            initialDamage = damage;
            initialFireRate = fireRate;
            _initialAttackRange = attackRange;
        }
        
        private void Update()
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
            
            if (GameConfig.Instance.HasLost || GameConfig.Instance.HasWon || GameConfig.Instance.ShopIsOpened)
            {
                return;
            }
            
            enemiesInRange = new List<GameObject>();
            if (GameConfig.Instance.EnemyList.Count == 0)
            {
                ResetVariables();
                return;
            }
            
            foreach (GameObject enemy in GameConfig.Instance.EnemyList)
            {
                if (enemy)
                {
                    if (Vector3.SqrMagnitude(enemy.transform.position - transform.position) < attackRange * attackRange)
                    {
                        if (!enemiesInRange.Contains(enemy))
                        {
                            enemiesInRange.Add(enemy);
                        }
                    } 
                }
                else
                {
                    if (enemiesInRange.Contains(enemy))
                    {
                        enemiesInRange.Remove(enemy);
                    }
                }
            }

            if (enemiesInRange.Count == 0)
            {
                return;
            }
            
            float smallestSqrDist = float.MaxValue;
            GameObject closestEnemyToMainBuilding = enemiesInRange[0];
            foreach (var t in enemiesInRange)
            {
                Enemy enemy = t.GetComponent<Enemy>();
                float sqrDistance = 0;
                var corners = enemy.navMeshAgent.path.corners;
                for (int j = 0; j < corners.Length - 1; ++j)
                {
                    sqrDistance += (corners[j] - corners[j + 1]).sqrMagnitude;
                }

                if (sqrDistance < smallestSqrDist)
                {
                    smallestSqrDist = sqrDistance;
                    closestEnemyToMainBuilding = t;
                }
            }
            
            CurrentTarget = closestEnemyToMainBuilding;
                
            if (_canShoot)
            {
                if (!Piloted)
                {
                    SuppressTower();
                    StartCoroutine(Shoot(transform.position, CurrentTarget)); 
                }
            }

            if (!Piloted)
            {
                return;
            }
            
            if (Input.GetMouseButton(0)) // Player shooting
            {
                if (!towerCameraComp.currentTarget)
                {
                    return;
                }
                
                if (_canShoot)
                {
                    var enemyPos = towerCameraComp.currentTarget.transform.position;
                    var position = transform.position;
                    
                    float sqrDistance = Vector3.SqrMagnitude(position - enemyPos);
                    if (sqrDistance > attackRange * attackRange)
                    {
                        return;
                    }

                    ResetTowerStats();
                    
                    StartCoroutine(Shoot(position, towerCameraComp.currentTarget));
                }
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
                Enemy enemy = target.GetComponent<Enemy>();
                if (enemy.Health > 0)
                {
                    Vector3 projectilePos =
                        new Vector3(currentPos.x, currentPos.y + 12.7f, currentPos.z);
                    Projectile projectile = Instantiate(projectilePrefab, projectilePos, Quaternion.identity).GetComponent<Projectile>();
                    projectile.damage = initialDamage;
                    projectile.slowness = slowness;
                    projectile.CurrentTarget = target;
                    projectile.FiringTower = this; // Устанавливаем ссылку на башню
                    AudioManager.Instance.PlayLocalSound("Tower", audioSource);
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
        }

        private void SuppressTower()
        {
            initialDamage = Mathf.Round(damage * abilityTowerBuff.AbilityDamageBuff) / 2;
            initialFireRate = fireRate / (1 + abilityTowerBuff.AbilityFireRateBuff) * 2;
        }

        public void SetSlowness()
        {
            slowness = true;
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
