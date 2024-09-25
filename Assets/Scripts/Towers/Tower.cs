using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Enemies;
using UnityEngine;
using UnityEngine.Serialization;

namespace Towers
{
    public class Tower : MonoBehaviour
    {
        [SerializeField] protected int damage;
        [SerializeField] private float fireRate; // Time between shots (in seconds)

        [SerializeField] private GameObject projectilePrefab;

        [SerializeField] private TowerCamera towerCameraComp;
        
        public Camera towerCamera;

        private AttackType _attackType;
        protected GameObject CurrentAutoTarget;

        private bool _canShoot = true;
        public bool piloted = false;

        [SerializeField] private List<Collider> collidersInRadius;

        public float attackRange;
        
        private void Update()
        {
            collidersInRadius = Physics.OverlapSphere(transform.position, attackRange).ToList();

            if (collidersInRadius.Count == 0)
            {
                ResetVariables();
                return;
            }

            List<GameObject> enemies = new List<GameObject>();
            foreach (var col in collidersInRadius)
            {
                if (col.gameObject.CompareTag("Enemy"))
                {
                    enemies.Add(col.gameObject);
                }
            }

            if (enemies.Count > 0)
            {
                float minDistance = attackRange;
                GameObject closestEnemy = enemies[0];
                foreach (var enemy in enemies)
                {
                    Vector3 enemyPos = enemy.transform.position;
                    float distance = Vector3.Distance(transform.position, enemyPos);
                    
                    if (distance < minDistance)
                    {
                        minDistance = distance;
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
                            CurrentAutoTarget.GetComponent<Enemy>())); 
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
                    
                    StartCoroutine(Shoot(position, enemyPos,
                        towerCameraComp.currentTarget.GetComponent<Enemy>()));
                }
            }
        }

        private void ResetVariables()
        {
            CurrentAutoTarget = null;
            _canShoot = true;
            StopAllCoroutines();
        }

        private IEnumerator Shoot(Vector3 currentPos, Vector3 enemyPos, Enemy enemy)
        {
            _canShoot = false;
            
            Vector3 projectilePos =
                new Vector3(currentPos.x, currentPos.y + 4, currentPos.z);
            Projectile projectile = Instantiate(projectilePrefab, projectilePos, Quaternion.identity).GetComponent<Projectile>();
            projectile.damage = damage;
            
            if (CurrentAutoTarget is not null)
            {
                projectile.CurrentAutoTarget = CurrentAutoTarget;
            }

            yield return new WaitForSeconds(fireRate);
            _canShoot = true;
        }

        private void OnDrawGizmos()
        {
            Gizmos.color = Color.cyan;
            Gizmos.DrawWireSphere(transform.position, attackRange);
        }
    }
    
    enum AttackType
    {
        
    }
}
