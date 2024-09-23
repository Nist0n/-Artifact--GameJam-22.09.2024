using System;
using Enemies;
using UnityEngine;

namespace Towers
{
    public class Projectile : Tower
    {
        [SerializeField] private float projectileSpeed;

        private void Update()
        {
            Vector3 moveProjectile = 
                Vector3.MoveTowards(transform.position, CurrentTarget.transform.position, projectileSpeed * Time.deltaTime);
            transform.position = moveProjectile;
            if (CurrentTarget is null)
            {
                Destroy(gameObject);
            }
        }

        private void OnTriggerEnter(Collider other)
        {
            Enemy enemy = CurrentTarget.GetComponent<Enemy>();
            //enemy.ReceiveDamage(damage);
            Destroy(gameObject);
        }
    }
}