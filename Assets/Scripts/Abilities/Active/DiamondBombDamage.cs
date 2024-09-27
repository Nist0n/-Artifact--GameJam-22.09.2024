using System.Collections;
using System.Collections.Generic;
using Enemies;
using UnityEngine;

public class DiamondBombDamage : MonoBehaviour
{
    [SerializeField] private List<GameObject> enemies;

    [SerializeField] private float freezeTime;

    private void Start()
    {
        Invoke("ActivateFreeze", 1f);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Enemy"))
        {
            enemies.Add(other.gameObject);
        }
    }

    private void ActivateFreeze()
    {
        foreach (var enemy in enemies)
        {
            enemy.GetComponent<Enemy>().FreezeEnemyActivate(freezeTime);
        }

        Destroy(gameObject);
    }
}
