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
        
        public Tower FiringTower { get; set; }
        
        private bool _isInitialized = false;

        private void Start()
        {
            InitializeProjectile();
        }
        
        private void OnEnable()
        {
            _hitStatus = false;
            _isInitialized = false;
        }
        
        private void InitializeProjectile()
        {
            if (_isInitialized || !CurrentTarget) return;
            
            _enemyTarget = CurrentTarget.GetComponentInChildren<EnemyTarget>();
            _enemy = CurrentTarget.GetComponent<Enemy>();
            _isInitialized = true;
        }

        private void Update()
        {
            if (!_isInitialized)
            {
                InitializeProjectile();
                if (!_isInitialized) return;
            }
            
            if (!CurrentTarget || _enemy.Health <= 0) // If object doesn't exist anymore or enemy's death animation is playing
            {
                ReturnToPool();
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
            
            if (_hitStatus)
            {
                return;
            }

            _enemy.ReceiveDamageActivate(damage);
            
            var killTracker = _enemy.GetComponent<Combo.EnemyKillTrackerComponent>();
            if (killTracker)
            {
                killTracker.SetLastHittingTower(FiringTower);
            }
            
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
            ReturnToPool();
        }
        
        private void ReturnToPool()
        {
            if (ProjectilePool.Instance)
            {
                ProjectilePool.Instance.ReturnProjectile(this);
            }
            else
            {
                Destroy(gameObject);
            }
        }
        
        public void ResetProjectile()
        {
            _hitStatus = false;
            _isInitialized = false;
            CurrentTarget = null;
            FiringTower = null;
            _enemy = null;
            _enemyTarget = null;
            
            if (hit)
            {
                hit.SetActive(false);
            }
        }
    }
}