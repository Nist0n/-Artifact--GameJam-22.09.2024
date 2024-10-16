using System.Collections.Generic;
using Audio;
using GameConfiguration.Spawners;
using TMPro;
using UI.InGame;
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

        [SerializeField] private List<Spawner> _spawners;

        private float _previousCount = 10;

        private float _percentAdvantage = 15;

        private float _waveTime = 0f;

        public bool HasLost = false;

        private float _countOfUnits;

        private bool IsWaveStarted = false;

        private bool IsBossSpawned = false;

        public bool HasWon;

        public bool isInTower;
        
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

        private void Start()
        {
            AudioManager.instance.StartMusicShuffle();
            GetSpawners();
        }

        private void Update()
        {
            if (HasLost)
            {
                GameLost();
                return;
            }

            if (EnemyList.Count <= 0 && GameTime > waveTime)
            {
                HasWon = true;
                GameWon();
                return;
            }
        
            GameTime += Time.deltaTime;
        
            Timer();
        
            GameBrain();

            ControlCursor();
        }

        private void ControlCursor()
        {
            if (!isInTower || HasLost || HasWon || Time.timeScale == 0)
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
                _spawners.Add(spawner);
            }
        }

        private void GameBrain()
        {
            if (GameTime > waveTime && !IsBossSpawned)
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
            if (_timeSeconds < 59) _timeSeconds += Time.deltaTime;
            else _timeSeconds = 0;
            timerText.text = $"Время: {_timeMinutes}:{_timeSeconds:00}";
        }

        private void GameLost()
        {
            loseCinemachineCamera.Priority = 2;
            loseUI.SetActive(true);
            foreach (var gameObj in objectsToHide)
            {
                gameObj.SetActive(false);
            }
        }

        private void GameWon()
        {
            victoryUI.SetActive(true);
            foreach (var obj in objectsToHide)
            {
                obj.SetActive(false);
            }
        }
    }
}
