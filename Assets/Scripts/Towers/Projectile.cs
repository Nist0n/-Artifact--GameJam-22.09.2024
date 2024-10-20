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
        private EnemyTarget _enemyTarget;

        private void Start()
        {
            _enemyTarget = CurrentTarget.GetComponentInChildren<EnemyTarget>();
            _enemy = CurrentTarget.GetComponent<Enemy>();
        }

        private void Update()
        {
            if (!CurrentTarget || _enemy.Health <= 0) // If object doesn't exist anymore or enemy's death animation is playing
            {
                Destroy(gameObject);
                return;
            }

            var position = _enemyTarget.transform.position;
            Vector3 moveProjectile = 
                Vector3.MoveTowards(transform.position, position, projectileSpeed * Time.deltaTime);
            transform.position = moveProjectile;
            
            float sqrDistance = (position - moveProjectile).sqrMagnitude;

            if (sqrDistance > float.Epsilon * float.Epsilon) // Not close enough
            {
                return;
            }
            
            if (_hitStatus) // Already hit in this frame
            {
                return;
            }

            _enemy.ReceiveDamageActivate(damage);
            
            if (slowness)
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