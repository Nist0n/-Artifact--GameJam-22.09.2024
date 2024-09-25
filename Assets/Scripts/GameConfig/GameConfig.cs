using System;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using Random = UnityEngine.Random;

public class GameConfig : MonoBehaviour
{
    [SerializeField] private List<GameObject> enemiesTypes;
    
    [SerializeField] private TextMeshProUGUI timerText;

    public float GameTime;

    private float _timeMinutes;
    
    private float _timeSeconds;

    public List<GameObject> EnemyList;

    [SerializeField] private List<Spawner> _spawners;

    private float _previousCount = 10;

    private float _percentAdvantage = 15;

    private float _waveTime = 15f;

    private float _countOfUnits;

    private bool IsWaveStarted = false;

    private bool IsBossSpawned = false;

    private void Start()
    {
        GetSpawners();
    }

    private void Update()
    {
        GameTime += Time.deltaTime;
        
        Timer();
        
        GameBrain();
    }

    private void GetSpawners()
    {
        var spawn = GetComponentsInChildren<Spawner>();
        foreach (var spawner in spawn)
        {
            Debug.Log(spawner);
            _spawners.Add(spawner);
        }
    }

    private void GameBrain()
    {
        if (GameTime > 900 && !IsBossSpawned)
        {
            StartCoroutine(_spawners[1].SpawnBoss());
            IsWaveStarted = true;
            IsBossSpawned = true;
        }
        
        if (GameTime > _waveTime && !IsWaveStarted)
        {
            _percentAdvantage = Mathf.Round(_percentAdvantage *= 1.15f);
            _countOfUnits = Random.Range(_previousCount, _percentAdvantage);
            GetSummoners(_countOfUnits);
            foreach (var spawner in _spawners)
            {
                StartCoroutine(spawner.StartSpawn());
            }

            _previousCount = _percentAdvantage;

            IsWaveStarted = true;

            if (_waveTime < 75) _waveTime = 75;
            else _waveTime += 75;

            IsWaveStarted = false;
        }
    }

    private void GetSummoners(float enemyCount)
    {
        for (int i = 0; i < enemyCount; i++)
        {
            var randSpawner = Random.Range(0, _spawners.Count);
            var randEnemy = Random.Range(0, enemiesTypes.Count);
            _spawners[randSpawner].SetEnemies(enemiesTypes[randEnemy]);
        }
    }

    private void Timer()
    {
        _timeMinutes = Mathf.Floor(GameTime / 60);
        if (_timeSeconds < 60) _timeSeconds += Time.deltaTime;
        else _timeSeconds = 0;
        timerText.text = $"Время: {_timeMinutes}:{_timeSeconds.ToString("00")}";
    }
}
