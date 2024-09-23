using System;
using Enemies;
using UnityEngine;

namespace Towers
{
    public class Projectile : Tower
    {
        public float projectileSpeed;

        private void Update()
        {
            if (!CurrentTarget)
            {
                Destroy(gameObject);
                return;
            }

            var position = CurrentTarget.transform.position;
            Vector3 adjustedTarget = new Vector3(position.x, position.y + 1, position.z);
            Vector3 moveProjectile = 
                Vector3.MoveTowards(transform.position, position, projectileSpeed * Time.deltaTime);
            transform.position = moveProjectile;
        }

        private void OnTriggerEnter(Collider other)
        {
            Enemy enemy = CurrentTarget.GetComponent<Enemy>();
            enemy.ReceiveDamageActivate();
            Destroy(gameObject);
        }
    }
}