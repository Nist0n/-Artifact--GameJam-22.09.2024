using System.Collections;
using System.Collections.Generic;
using Audio;
using Enemies;
using GameConfiguration;
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

        [SerializeField] private GameObject buffImage;

        [SerializeField] private AbilityTowerBuff abilityTowerBuff;

        public TowerCamera towerCameraComp;
        
        public CinemachineCamera towerCamera;

        protected GameObject CurrentTarget;

        private bool _canShoot = true;
        public bool piloted;

        public static float buffDuration = 10f;
        public bool isOnCooldown;
        
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
            if (GameConfig.Instance.hasLost || GameConfig.Instance.hasWon)
            {
                return;
            }
            
            enemiesInRange = new List<GameObject>();
            if (GameConfig.Instance.enemyList.Count == 0)
            {
                ResetVariables();
                return;
            }
            
            foreach (GameObject enemy in GameConfig.Instance.enemyList)
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
            
            if (enemiesInRange.Count > 0)
            {
                float minDistanceSqr = attackRange * attackRange;
                GameObject closestEnemy = enemiesInRange[0];
                foreach (var enemy in enemiesInRange)
                {
                    Vector3 enemyPos = enemy.transform.position;
                    float distanceSqr = Vector3.SqrMagnitude(transform.position - enemyPos);
                    
                    if (distanceSqr < minDistanceSqr)
                    {
                        minDistanceSqr = distanceSqr;
                        closestEnemy = enemy;
                    }
                }
                
                CurrentTarget = closestEnemy;
                
                if (_canShoot)
                {
                    if (!piloted)
                    {
                        SuppressTower();
                        StartCoroutine(Shoot(transform.position, CurrentTarget)); 
                    }
                }
            }

            if (!piloted)
            {
                return;
            }
            
            buffImage.SetActive(isBuffed);
            
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
                    AudioManager.instance.PlayLocalSound("Tower", audioSource);
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
            if (isOnCooldown || isBuffed)
            {
                return;
            }
            
            StartCoroutine(Buff());
        }

        private IEnumerator Buff()
        {
            isBuffed = true;
            initialFireRate = fireRate / (1 + abilityTowerBuff.AbilityFireRateBuff) * buffedFireRatePercent;
            initialDamage = Mathf.Round(damage * abilityTowerBuff.AbilityDamageBuff) * buffedDamagePercent;
            StartCoroutine(BuffCooldown());
            yield return new WaitForSeconds(buffDuration);
            
            isBuffed = false;
            ResetTowerStats();
        }

        private IEnumerator BuffCooldown()
        {
            isOnCooldown = true;
            yield return new WaitForSeconds(60f);
            isOnCooldown = false;
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
    }
}
