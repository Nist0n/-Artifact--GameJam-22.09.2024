using System;
using Enemies;
using UnityEngine;

public class AmberBombDamage : MonoBehaviour
{
    private float _lastAttackTime;

    private float _damage = 3;

    private void Start()
    {
        Destroy(gameObject, 7);
    }

    private void OnTriggerStay(Collider other)
    {
        if (other.CompareTag("Enemy"))
        {
            if (Time.time - _lastAttackTime < 1) return;
            
            other.GetComponent<Enemy>().ReceiveDamageActivate(_damage);
            
            _lastAttackTime = Time.time;
        }
    }
}
