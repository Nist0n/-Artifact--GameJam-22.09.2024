using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Enemies;
using UnityEngine.Serialization;

namespace Towers
{
    public class Tower : MonoBehaviour
    {
        [SerializeField] protected int damage;
        [SerializeField] private float attackRange;
        [SerializeField] private float fireRate; // Time between shots
        [SerializeField] private GameObject projectilePrefab;
        
        private AttackType _attackType;
        protected GameObject CurrentTarget;

        private bool _canShoot = true;

        private void OnTriggerEnter(Collider other)
        {
            CurrentTarget = other.gameObject;
        }

        private void OnTriggerStay(Collider other)
        {
            // Maybe check for collider type
            Vector3 currentPos = transform.position;
            Vector3 enemyPos = other.transform.position;
            
            float distance = Vector3.Distance(currentPos, enemyPos);
            if (distance <= attackRange)
            {
                Enemy enemy = CurrentTarget.GetComponent<Enemy>();
                if (_canShoot)
                {
                    StartCoroutine(Shoot(currentPos, enemyPos, enemy));
                }
            }
        }

        private void OnTriggerExit(Collider other)
        {
            CurrentTarget = null;
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
            if (CurrentTarget is not null)
            {
                projectile.CurrentTarget = CurrentTarget;
            }
            
            yield return new WaitForSeconds(fireRate);
            _canShoot = true;
        }
    }

    enum AttackType
    {
        
    }
}
