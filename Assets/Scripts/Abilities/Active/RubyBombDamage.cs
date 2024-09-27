using System.Collections.Generic;
using Enemies;
using UnityEngine;

public class RubyBombDamage : MonoBehaviour
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
            enemy.GetComponent<Enemy>().ReceiveDamageActivate(damage * (100 + enemy.GetComponent<Enemy>().navMeshAgent.speed * 25) / 100);
        }

        Destroy(gameObject);
    }
}
