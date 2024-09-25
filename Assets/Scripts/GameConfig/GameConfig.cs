using System;
using System.Collections.Generic;
using UnityEngine;
using Random = UnityEngine.Random;

public class GameConfig : MonoBehaviour
{
    [SerializeField] private List<GameObject> enemiesTypes;

    public float GameTime;

    public List<GameObject> EnemyList;

    [SerializeField] private List<Spawner> _spawners;

    private int _countOfUnits;

    private bool IsFirstWaveStarted = false;

    private void Start()
    {
        GetSpawners();
    }

    private void Update()
    {
        GameTime += Time.deltaTime;
        GameBrain();
    }

    private void GetSpawners()
    {
        var spawn = GetComponentsInChildren<Spawner>();
        Debug.Log(spawn.Length);
        foreach (var spawner in spawn)
        {
            Debug.Log(spawner);
            _spawners.Add(spawner);
        }
    }

    private void GameBrain()
    {
        if (GameTime > 3f && !IsFirstWaveStarted)
        {
            _countOfUnits = Random.Range(10, 15);
            GetSummoners(_countOfUnits);
            foreach (var spawner in _spawners)
            {
                StartCoroutine(spawner.StartSpawn());
            }

            IsFirstWaveStarted = true;
        }
    }

    private void GetSummoners(int enemyCount)
    {
        for (int i = 0; i < enemyCount; i++)
        {
            var randSpawner = Random.Range(0, _spawners.Count);
            var randEnemy = Random.Range(0, enemiesTypes.Count);
            _spawners[randSpawner].SetEnemies(enemiesTypes[randEnemy]);
        }
    }
}
