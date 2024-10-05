using System.Collections;
using System.Collections.Generic;
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

        protected bool Slowness;

        [SerializeField] private GameObject projectilePrefab;

        [SerializeField] private GameObject buffImage;

        public TowerCamera towerCameraComp;
        
        public CinemachineCamera towerCamera;

        protected GameObject CurrentAutoTarget;

        private bool _canShoot = true;
        public bool piloted;

        public static float buffDuration = 10f;
        public bool isOnCooldown;
        
        public List<GameObject> enemiesInRange;

        public float buffedFireRate;
        public float buffedDamage;
        
        public float _initialDamage;
        public float _initialFireRate;
        private float _initialAttackRange;

        public AudioSource _audioSource;

        private bool _isBuffed;
        
        private void Start()
        {
            _initialDamage = damage;
            _initialFireRate = fireRate;
            _initialAttackRange = attackRange;
            buffedFireRate = fireRate * 0.6f;
            buffedDamage = damage;
        }
        
        private void Update()
        {
            if (GameConfig.Instance.GameIsOverByLose || GameConfig.Instance.HasWon)
            {
                return;
            }
            
            enemiesInRange = new List<GameObject>();
            if (GameConfig.Instance.EnemyList.Count == 0)
            {
                ResetVariables();
                return;
            }
            
            foreach (var enem in GameConfig.Instance.EnemyList)
            {
                if (enem)
                {
                    if (Vector3.SqrMagnitude(enem.transform.position - transform.position) < attackRange * attackRange)
                    {
                        if (!enemiesInRange.Contains(enem))
                        {
                            enemiesInRange.Add(enem);
                        }
                    } 
                }
                else
                {
                    if (enemiesInRange.Contains(enem))
                    {
                        enemiesInRange.Remove(enem);
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
                
                CurrentAutoTarget = closestEnemy;
                
                if (_canShoot)
                {
                    if (!piloted)
                    {
                        SuppressTower();
                        StartCoroutine(Shoot(transform.position, CurrentAutoTarget.transform.position,
                            CurrentAutoTarget)); 
                    }
                }
            }

            if (!piloted)
            {
                return;
            }
            
            buffImage.SetActive(_isBuffed);
            
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

                    // Potentially check if !isBuffed, although it introduces new challenges as already seen
                    ResetTowerStats();
                    
                    StartCoroutine(Shoot(position, enemyPos, towerCameraComp.currentTarget));
                }
            }
        }

        private void ResetVariables()
        {
            CurrentAutoTarget = null;
            _canShoot = true;
            StopAllCoroutines();
        }

        private IEnumerator Shoot(Vector3 currentPos, Vector3 enemyPos, GameObject target)
        {
            _canShoot = false;
            AudioManager.instance.PlayLocalSound("Tower", _audioSource);

            Vector3 projectilePos =
                new Vector3(currentPos.x, currentPos.y + 12.7f, currentPos.z);
            Projectile projectile = Instantiate(projectilePrefab, projectilePos, Quaternion.identity).GetComponent<Projectile>();
            projectile.damage = damage;
            
            if (target is not null)
            {
                projectile.CurrentAutoTarget = target;
            }

            yield return new WaitForSeconds(fireRate);
            _canShoot = true;
        }

        private void OnDrawGizmos()
        {
            Gizmos.color = Color.cyan;
            Gizmos.DrawWireSphere(transform.position, attackRange);
        }

        public void EmpowerTower()
        {
            if (isOnCooldown || _isBuffed)
            {
                return;
            }
            
            StartCoroutine(Buff());
        }

        private IEnumerator Buff()
        {
            _isBuffed = true;
            fireRate = buffedFireRate;
            damage = buffedDamage;
            StartCoroutine(BuffCooldown());
            yield return new WaitForSeconds(buffDuration);
            
            _isBuffed = false;
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
            if (_isBuffed)
            {
                damage = buffedDamage;
                fireRate = buffedFireRate;
                return;
            }
            
            damage = _initialDamage;
            fireRate = _initialFireRate;
        }

        private void SuppressTower()
        {
            damage = _initialDamage / 2;
            fireRate = _initialFireRate * 2;
        }

        public void SetSlowness()
        {
            Slowness = true;
        }
    }
}
