using System.Collections;
using System.Collections.Generic;
using Unity.Cinemachine;
using UnityEngine;

namespace Towers
{
    public class Tower : MonoBehaviour
    {
        public float damage;
        public float fireRate; // Time between shots (in seconds)
        public float attackRange;

        protected bool slowness = false;

        [SerializeField] private GameObject projectilePrefab;

        [SerializeField] private GameObject buffImage;

        public TowerCamera towerCameraComp;
        
        public CinemachineCamera towerCamera;

        private AttackType _attackType;
        protected GameObject CurrentAutoTarget;

        private bool _canShoot = true;
        public bool piloted;

        public float buffDuration;
        public bool isPowered;
        
        public List<GameObject> enemiesInRange;

        public float buffedFireRate;
        
        public float _initialDamage;
        public float _initialFireRate;
        private float _initialAttackRange;
        
        private void Start()
        {
            _initialDamage = damage;
            _initialFireRate = fireRate;
            _initialAttackRange = attackRange;
            buffedFireRate = fireRate * 0.7f;
        }
        
        private void Update()
        {
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

            if (Input.GetMouseButton(0)) // Player shooting
            {
                if (!towerCameraComp.currentTarget)
                {
                    return;
                }
                
                if (_canShoot && piloted)
                {
                    var enemyPos = towerCameraComp.currentTarget.transform.position;
                    var position = transform.position;
                    
                    float sqrDistance = Vector3.SqrMagnitude(position - enemyPos);
                    if (sqrDistance > attackRange * attackRange)
                    {
                        return;
                    }
                    
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
            if (isPowered)
            {
                return;
            }
            
            StartCoroutine(Buff());
        }

        private IEnumerator Buff()
        {
            float prev = fireRate;
            fireRate = buffedFireRate;
            buffImage.SetActive(true);
            yield return new WaitForSeconds(buffDuration);
            StartCoroutine(BuffCooldown());
            buffImage.SetActive(false);
            fireRate = prev;
        }

        private IEnumerator BuffCooldown()
        {
            isPowered = true;
            yield return new WaitForSeconds(60f);
            isPowered = false;
        }

        public void ResetTowerStats()
        {
            damage = _initialDamage;
            fireRate = _initialFireRate;
        }

        public void SuppressTower()
        {
            damage = _initialDamage / 2;
            fireRate = _initialFireRate * 2;
        }

        public void SetSlowness()
        {
            this.slowness = true;
        }
    }

    enum AttackType
    {
        
    }
}
