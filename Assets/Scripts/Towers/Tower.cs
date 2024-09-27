using System.Collections;
using System.Collections.Generic;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.Serialization;

namespace Towers
{
    public class Tower : MonoBehaviour
    {
        [SerializeField] protected int damage;
        [SerializeField] private float fireRate; // Time between shots (in seconds)
        public float attackRange;

        [SerializeField] private GameObject projectilePrefab;

        public TowerCamera towerCameraComp;
        
        public CinemachineCamera towerCamera;

        private AttackType _attackType;
        protected GameObject CurrentAutoTarget;

        private bool _canShoot = true;
        public bool piloted;

        [SerializeField] private float buffDuration;
        public bool isPowered;
        
        public List<GameObject> enemiesInRange;
        
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
                        // Another coroutine to boost tower stats for a short period of time
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
                    
                    float distance = Vector3.Distance(position, enemyPos);
                    if (distance > attackRange)
                    {
                        return;
                    }
                    
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
                new Vector3(currentPos.x, currentPos.y + 4, currentPos.z);
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
            StartCoroutine(PowerCooldown());
        }

        private IEnumerator Buff()
        {
            float prev = fireRate;
            fireRate *= 0.7f;
            yield return new WaitForSeconds(buffDuration);
            fireRate = prev;
        }

        private IEnumerator PowerCooldown()
        {
            isPowered = true;
            yield return new WaitForSeconds(60f);
            isPowered = false;
        }
    }

    enum AttackType
    {
        
    }
}
