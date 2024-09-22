using UnityEngine;
using Enemies;
using UnityEngine.Serialization;

namespace Towers
{
    public class Tower : MonoBehaviour
    {
        [SerializeField] private int damage;
        [SerializeField] private float attackRange;
        [SerializeField] private float fireRate;
        [SerializeField] private GameObject projectilePrefab;
        [SerializeField] private float projectileSpeed;
        
        private AttackType _attackType;
        private GameObject _currentTarget;

        private void Update()
        {

        }

        private void OnCollisionEnter(Collision other)
        {
            // Maybe check for collider type
            Vector3 currentPos = transform.position;
            Vector3 enemyPos = other.transform.position;
            
            float distance = Vector3.Distance(currentPos, enemyPos);
            if (distance <= attackRange)
            {
                Enemy enemy = other.gameObject.GetComponent<Enemy>();
                
                Vector3 projectilePos =
                    new Vector3(currentPos.x, currentPos.y + 2, currentPos.z);
                var projectile = Instantiate(projectilePrefab, projectilePos, Quaternion.identity);
                Vector3 moveProjectile = 
                    Vector3.MoveTowards(projectilePos, enemyPos, projectileSpeed * Time.deltaTime);
                projectile.transform.position = moveProjectile;
                
                // Deal damage
            }
        }
    }

    enum AttackType
    {
        
    }
}
