using System;
using Enemies;
using UnityEngine;

public class AmberBombDamage : MonoBehaviour
{
    [SerializeField] private float destroyTime;
    
    private float _lastAttackTime;

    [SerializeField] private float damage;

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
