using System;
using System.Collections;
using Enemies;
using UnityEngine;

namespace Towers
{
    public class Projectile : Tower
    {
        public float projectileSpeed;
        private bool _hitStatus;
        [SerializeField] private GameObject hit;
        private Enemy _enemy;

        private void Start()
        {
            _enemy = CurrentAutoTarget.GetComponent<Enemy>();
        }

        private void Update()
        {
            if (!CurrentAutoTarget)
            {
                Destroy(gameObject);
                return;
            }

            var position = CurrentAutoTarget.GetComponentInChildren<EnemyTarget>().transform.position;
            Vector3 moveProjectile = 
                Vector3.MoveTowards(transform.position, position, projectileSpeed * Time.deltaTime);
            transform.position = moveProjectile;
            
            float sqrDistance = (position - moveProjectile).sqrMagnitude;

            if (sqrDistance > float.Epsilon * float.Epsilon)
            {
                return;
            }
            
            if (_hitStatus)
            {
                return;
            }

            _enemy.ReceiveDamageActivate(damage);
            
            if (Slowness)
            {
                _enemy.SetSlowness();
            }
            
            _hitStatus = true;
            StartCoroutine(ActivateHit());
        }

        private IEnumerator ActivateHit()
        {
            hit.SetActive(true);
            yield return new WaitForSeconds(0.27f);
            Destroy(gameObject);
        }
    }
}