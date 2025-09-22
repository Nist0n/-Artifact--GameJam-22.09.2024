using System;
using System.Collections.Generic;
using Audio;
using GameConfiguration.Spawners;
using StaticClasses;
using TMPro;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.Serialization;
using Random = UnityEngine.Random;

namespace GameConfiguration
{
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

        [SerializeField] private List<Spawner> spawners;

        private float _previousCount = 10;

        private float _percentAdvantage = 15;

        private float _waveTime;

        public bool HasLost; // still seems suspicious

        private float _countOfUnits;

        private bool _isWaveStarted;

        private bool _isBossSpawned;

        public bool HasWon;

        public bool IsInTower;

        public bool ShopIsOpened;
        
        [SerializeField] private float waveTime;
        
        [SerializeField] private List<GameObject> objectsToHide;
        [SerializeField] private GameObject loseUI;
        [SerializeField] private GameObject victoryUI;

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

        private void OnEnable()
        {
            GameEvents.CheatGameWin += GameWon;
            GameEvents.GameLost += GameLost;
        }

        private void OnDisable()
        {
            GameEvents.CheatGameWin -= GameWon;
            GameEvents.GameLost -= GameLost;
        }

        private void Start()
        {
            GameEvents.CheatGameWin += GameWon;
            AudioManager.instance.StartMusicShuffle();
            GetSpawners();
        }

        private void Update()
        {
            ControlCursor();
            
            // if (hasLost)
            // {
            //     if (!loseUI.activeSelf)
            //     {
            //         GameLost();
            //     }
            //     
            //     return;
            // }

            if (EnemyList.Count <= 0 && GameTime > waveTime)
            {
                HasWon = true;
                GameWon();
                return;
            }
        
            GameTime += Time.deltaTime;
        
            Timer();
        
            GameBrain();
        }

        private void ControlCursor()
        {
            if (!IsInTower || HasLost || HasWon || Time.timeScale == 0 || ShopIsOpened)
            {
                Cursor.visible = true;
                Cursor.lockState = CursorLockMode.None;
            }
            else
            {
                Cursor.visible = false;
                Cursor.lockState = CursorLockMode.Locked;
            }
        }

        private void GetSpawners()
        {   
            var spawn = GetComponentsInChildren<Spawner>();
            foreach (var spawner in spawn)
            {
                spawners.Add(spawner);
            }
        }

        private void GameBrain()
        {
            if (GameTime > waveTime && !_isBossSpawned)
            {
                StartCoroutine(spawners[1].SpawnBoss(boss));
                _isWaveStarted = true;
                _isBossSpawned = true;
            }
        
            if (GameTime > _waveTime && !_isWaveStarted)
            {
                AudioManager.instance.PlaySFX("SpawnMobs");
                _percentAdvantage = Mathf.Round(_percentAdvantage *= 1.15f);
                _countOfUnits = Random.Range(_previousCount, _percentAdvantage);
                GetSummoners(_countOfUnits);
                foreach (var spawner in spawners)
                {
                    spawner.MaxTimeToSpawn *= 0.89f;
                    spawner.MinTimeToSpawn *= 0.92f;
                    StartCoroutine(spawner.StartSpawn());
                }

                _previousCount = _percentAdvantage;

                _isWaveStarted = true;

                if (_waveTime < 75) _waveTime = 75;
                else _waveTime += 75;

                _isWaveStarted = false;
            }
        }

        private void GetSummoners(float enemyCount)
        {
            for (int i = 0; i < enemyCount; i++)
            {
                var randSpawner = Random.Range(0, spawners.Count);
                var randEnemy = Random.Range(0, enemiesTypes.Count);
                spawners[randSpawner].SetEnemies(enemiesTypes[randEnemy]);
            }
        }

        private void Timer()
        {
            _timeMinutes = Mathf.Floor(GameTime / 60);
            if (_timeSeconds < 59) _timeSeconds += Time.deltaTime;
            else _timeSeconds = 0;
            timerText.text = $"Время: {_timeMinutes}:{_timeSeconds:00}";
        }

        private void GameLost()
        {
            HasLost = true;
            AudioManager.instance.StopMusicSourceLoop();
            AudioManager.instance.PlayMusic("Defeat");
            loseCinemachineCamera.Priority = 2;
            loseUI.SetActive(true);
            foreach (var gameObj in objectsToHide)
            {
                gameObj.SetActive(false);
            }
        }

        private void GameWon()
        {
            HasWon = true;
            victoryUI.SetActive(true);
            foreach (var obj in objectsToHide)
            {
                obj.SetActive(false);
            }
        }
    }
}
