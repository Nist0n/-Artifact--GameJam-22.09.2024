using System.Collections.Generic;
using UnityEngine;

namespace Towers
{
    public class ProjectilePool : MonoBehaviour
    {
        [SerializeField] private GameObject projectilePrefab;
        [SerializeField] private int poolSize = 50;
        
        private Queue<Projectile> _projectilePool = new Queue<Projectile>();
        private List<Projectile> _activeProjectiles = new List<Projectile>();
        
        public static ProjectilePool Instance { get; private set; }
        
        private void Awake()
        {
            if (!Instance)
            {
                Instance = this;
                InitializePool();
            }
            else
            {
                Destroy(gameObject);
            }
        }
        
        private void InitializePool()
        {
            for (int i = 0; i < poolSize; i++)
            {
                GameObject projectileObj = Instantiate(projectilePrefab, transform);
                Projectile projectile = projectileObj.GetComponent<Projectile>();
                projectileObj.SetActive(false);
                _projectilePool.Enqueue(projectile);
            }
        }
        
        public Projectile GetProjectile()
        {
            Projectile projectile;
            
            if (_projectilePool.Count > 0)
            {
                projectile = _projectilePool.Dequeue();
            }
            else
            {
                GameObject projectileObj = Instantiate(projectilePrefab, transform);
                projectile = projectileObj.GetComponent<Projectile>();
            }
            
            _activeProjectiles.Add(projectile);
            projectile.gameObject.SetActive(true);
            return projectile;
        }
        
        public void ReturnProjectile(Projectile projectile)
        {
            if (!projectile) return;
            
            _activeProjectiles.Remove(projectile);
            projectile.gameObject.SetActive(false);
            projectile.ResetProjectile();
            _projectilePool.Enqueue(projectile);
        }
    }
}
