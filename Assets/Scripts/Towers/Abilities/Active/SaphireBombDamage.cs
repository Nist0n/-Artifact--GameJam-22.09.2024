using System.Collections.Generic;
using Enemies;
using UnityEngine;

public class SaphireBombDamage : MonoBehaviour
{
    [SerializeField] private List<GameObject> enemies;

    [SerializeField] private float damage;

    private void Start()
    {
        Invoke("ActivateBomb", 1f);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Enemy"))
        {
            enemies.Add(other.gameObject);
        }
    }

    private void ActivateBomb()
    {
        foreach (var enemy in enemies)
        {
            enemy.GetComponent<Enemy>().ReceiveDamageActivate(damage);
        }

        Destroy(gameObject);
    }
}
