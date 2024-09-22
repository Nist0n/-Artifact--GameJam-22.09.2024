using System;
using UnityEngine;

namespace Tower
{
    public class Tower : MonoBehaviour
    {
        private float _damage;
        private float _attackRange;
        private float _fireRate;
        private AttackType _attackType;
        private GameObject _currentTarget;

        private void Update()
        {

        }

        private void OnCollisionEnter(Collision other)
        {
            // Maybe check for collider type
            float distance = Vector3.Distance(transform.position, other.transform.position);
            
        }
    }

    enum AttackType
    {
        
    }
}
