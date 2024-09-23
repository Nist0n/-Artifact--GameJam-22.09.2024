using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Enemies;
using UnityEngine;

namespace Towers
{
    public class Tower : MonoBehaviour
    {
        [SerializeField] protected int damage;
        [SerializeField] private float attackRange;
        [SerializeField] private float fireRate; // Time between shots (in seconds)

        [SerializeField] private GameObject projectilePrefab;

        public Camera towerCamera;

        private AttackType _attackType;
        protected GameObject CurrentTarget;

        private bool _canShoot = true;

        [SerializeField] private List<Collider> collidersInRadius;

        private void Update()
        {
            collidersInRadius = Physics.OverlapSphere(transform.position, attackRange).ToList();

            if (collidersInRadius.Count == 0)
            {
                ResetVariables();
                return;
            }

            int enemyCount = 0;
            foreach (var col in collidersInRadius)
            {
                if (col.gameObject.CompareTag("Enemy"))
                {
                    enemyCount++;
                }
            }

            if (enemyCount == 0)
            {
                ResetVariables();
                return;
            }

            float minDistance = attackRange;
            foreach (var colliderInRadius in collidersInRadius)
            {
                if (colliderInRadius.gameObject.CompareTag("Enemy"))
                {
                    var enemy = colliderInRadius.gameObject;
                    var towerPos = transform.position;
                    var enemyPos = enemy.transform.position;
                    var distance = Vector3.Distance(towerPos, enemyPos);

                    var closestEnemy = enemy;
                    if (distance < minDistance)
                    {
                        minDistance = distance;
                        closestEnemy = enemy;
                    }
                    
                    Debug.Log(closestEnemy);
                    Debug.Log(minDistance);
                    CurrentTarget = closestEnemy;
                }
            }
            
            if (_canShoot)
            {
                StartCoroutine(Shoot(transform.position, CurrentTarget.transform.position,
                    CurrentTarget.GetComponent<Enemy>()));
            }

            if (Input.GetMouseButtonDown(0)) // Player shooting
            {

            }
        }

        private void ResetVariables()
        {
            CurrentTarget = null;
            _canShoot = true;
            StopAllCoroutines();
        }

        // private void OnTriggerEnter(Collider other)
                    // {
                    //     CurrentTarget = other.gameObject;
                    // }
                    //
                    // private void OnTriggerStay(Collider other)
                    // {
                    //     // Maybe check for collider type
                    //     Vector3 currentPos = transform.position;
                    //     Vector3 enemyPos = other.transform.position;
                    //     
                    //     float distance = Vector3.Distance(currentPos, enemyPos);
                    //     if (distance <= attackRange)
                    //     {
                    //         Enemy enemy = CurrentTarget.GetComponent<Enemy>();
                    //         if (_canShoot)
                    //         {
                    //             StartCoroutine(Shoot(currentPos, enemyPos, enemy));
                    //         }
                    //     }
                    // }
                    //
                    // private void OnTriggerExit(Collider other)
                    // {
                    //     CurrentTarget = null;
                    //     _canShoot = true;
                    //     StopAllCoroutines();
                    // }

        private IEnumerator Shoot(Vector3 currentPos, Vector3 enemyPos, Enemy enemy)
        {
            _canShoot = false;
            
            Vector3 projectilePos =
                new Vector3(currentPos.x, currentPos.y + 4, currentPos.z);
            Projectile projectile = Instantiate(projectilePrefab, projectilePos, Quaternion.identity).GetComponent<Projectile>();
            projectile.damage = damage;
            
            if (CurrentTarget is not null)
            {
                projectile.CurrentTarget = CurrentTarget;
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
