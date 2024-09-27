using System;
using System.Collections;
using Enemies;
using UnityEngine;

namespace Towers
{
    public class Projectile : Tower
    {
        public float projectileSpeed;
        [SerializeField] private GameObject hit;

        private void Update()
        {
            if (!CurrentAutoTarget)
            {
                Destroy(gameObject);
                return;
            }

            var position = CurrentAutoTarget.GetComponentInChildren<EnemyTarget>().transform.position;
            Vector3 moveProjectile = 
                Vector3.MoveTowards(transform.position, position, projectileSpeed * Time.deltaTime);
            transform.position = moveProjectile;
        }

        private void OnTriggerEnter(Collider other)
        {
            Enemy enemy = CurrentAutoTarget.GetComponent<Enemy>();
            enemy.ReceiveDamageActivate(damage);
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