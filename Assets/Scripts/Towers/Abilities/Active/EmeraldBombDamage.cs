using System;
using System.Collections;
using System.Collections.Generic;
using Enemies;
using GameConfiguration.Spawners;
using UnityEngine;

public class EmeraldBombDamage : MonoBehaviour
{
    [SerializeField] private List<GameObject> enemies;
    
    private Vector3 _spanwerPos;

    private void Start()
    {
        StartCoroutine(ActivateTeleport());
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Enemy"))
        {
            enemies.Add(other.gameObject);
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Enemy"))
        {
            enemies.Remove(other.gameObject);
        }
    }

    private IEnumerator ActivateTeleport()
    {
        yield return new WaitForSeconds(3.5f);
        foreach (var enemy in enemies)
        {
            enemy.transform.position = enemy.GetComponentInParent<Spawner>().gameObject.transform.position;
            enemy.GetComponent<Enemy>().HealHP(enemy.GetComponent<Enemy>().Health * 0.4f);
        }
        
        Destroy(gameObject);
    }
}
