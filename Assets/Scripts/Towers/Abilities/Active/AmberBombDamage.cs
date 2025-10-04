using Enemies;
using UnityEngine;

namespace Towers.Abilities.Active
{
    public class AmberBombDamage : MonoBehaviour
    {
        [SerializeField] private float destroyTime;
        [SerializeField] private float damage;
        
        private float _lastAttackTime;

        private void Start()
        {
            Destroy(gameObject, destroyTime);
        }

        private void OnTriggerStay(Collider other)
        {
            if (other.CompareTag("Enemy"))
            {
                if (Time.time - _lastAttackTime < 1) return;
            
                other.GetComponent<Enemy>().ReceiveDamageActivate(damage);
            
                _lastAttackTime = Time.time;
            }
        }
    }
}
