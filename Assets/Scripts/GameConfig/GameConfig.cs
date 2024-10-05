using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using TMPro;
using Unity.Cinemachine;
using UnityEngine;
using Random = UnityEngine.Random;

public class GameConfig : MonoBehaviour
{
    public static GameConfig Instance;
    
    [SerializeField] private List<GameObject> enemiesTypes;
    
    [SerializeField] private TextMeshProUGUI timerText;

    [SerializeField] private CinemachineCamera loseCinemachineCamera;

    [SerializeField] private GameObject boss;

    public float GameTime;

    private float _timeMinutes;
    
    private float _timeSeconds;

    public List<GameObject> EnemyList;

    [SerializeField] private List<Spawner> _spawners;

    private float _previousCount = 10;

    private float _percentAdvantage = 15;

    private float _waveTime = 0f;

    public bool GameIsOverByLose = false;

    private float _countOfUnits;

    private bool IsWaveStarted = false;

    private bool IsBossSpawned = false;

    public bool HasWon;

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
        }
        else
        {
            Destroy(gameObject);
        }
    }

    private void Start()
    {
        GetSpawners();
    }

    private void Update()
    {
        if (GameIsOverByLose)
        {
            GameLost();
            return;
        }
        
        GameTime += Time.deltaTime;
        
        Timer();
        
        GameBrain();
    }

    private void GetSpawners()
    {   
        var spawn = GetComponentsInChildren<Spawner>();
        foreach (var spawner in spawn)
        {
            _spawners.Add(spawner);
        }
    }

    private void GameBrain()
    {
        if (GameTime > 750 && !IsBossSpawned)
        {
            StartCoroutine(_spawners[1].SpawnBoss(boss));
            IsWaveStarted = true;
            IsBossSpawned = true;
        }
        
        if (GameTime > _waveTime && !IsWaveStarted)
        {
            AudioManager.instance.PlaySFX("SpawnMobs");
            _percentAdvantage = Mathf.Round(_percentAdvantage *= 1.15f);
            _countOfUnits = Random.Range(_previousCount, _percentAdvantage);
            GetSummoners(_countOfUnits);
            foreach (var spawner in _spawners)
            {
                spawner.MaxTimeToSpawn *= 0.89f;
                spawner.MinTimeToSpawn *= 0.92f;
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

    private void GameLost()
    {
        loseCinemachineCamera.Priority = 2;
    }
}
