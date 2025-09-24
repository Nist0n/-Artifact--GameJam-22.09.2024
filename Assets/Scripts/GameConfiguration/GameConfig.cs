using System.Collections.Generic;
using Audio;
using GameConfiguration.Directors;
using StaticClasses;
using TMPro;
using Unity.Cinemachine;
using UnityEngine;

namespace GameConfiguration
{
    public class GameConfig : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI timerText;
        [SerializeField] private CinemachineCamera loseCinemachineCamera;
        [SerializeField] private float waveTime;
        [SerializeField] private List<GameObject> objectsToHide;
        [SerializeField] private GameObject loseUI;
        [SerializeField] private GameObject victoryUI;
        [SerializeField] private List<CombatDirector> combatDirectors;

        public static GameConfig Instance;
        public float GameTime;
        public List<GameObject> EnemyList;
        public List<GameObject> Spawners;
        public bool HasLost; // still seems suspicious
        public bool HasWon;
        public bool IsInTower;
        public bool ShopIsOpened;
        public float GameDifficulty;
        public int EnemyLevel;
        
        private float _timeMinutes;
        private readonly float _timeFactor = 0.2506f;
        private float _timeSeconds;
        private float _timerUpgrade;

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
            GetSpawners();
            GameEvents.CheatGameWin += GameWon;
            AudioManager.instance.StartMusicShuffle();
            foreach (var combatDirector in combatDirectors)
            {
                combatDirector.enabled = true;
            }
        }

        private void Update()
        {
            ControlCursor();
            
            if (EnemyList.Count <= 0 && GameTime > waveTime)
            {
                HasWon = true;
                GameWon();
                return;
            }
        
            GameTime += Time.deltaTime;
        
            Timer();
            
            UpdateTimeScale();
            
            IncreaseDifficulty();
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
            foreach (var spawner in GameObject.FindGameObjectsWithTag("Spawner"))
            {
                Spawners.Add(spawner);
            }
        }

        private void Timer()
        {
            _timeMinutes = Mathf.Floor(GameTime / 60);
            if (_timeSeconds < 59) _timeSeconds += Time.deltaTime;
            else _timeSeconds = 0;
            timerText.text = $"Время: {_timeMinutes}:{_timeSeconds:00}";
        }
        
        private void UpdateTimeScale()
        {
            GameDifficulty = (1 + _timeMinutes * _timeFactor) * 1.15f;
        }
        
        private void IncreaseDifficulty()
        {
            switch (GameTime)
            {
                case > 120 and < 121:
                case > 240 and < 241:
                case > 320 and < 321:
                case > 400 and < 401:
                case > 440 and < 441:
                    EnemyLevel = Mathf.FloorToInt(1 + (GameDifficulty - 1) / 0.33f);
                    break;
                case > 441:
                    _timerUpgrade += Time.deltaTime;
                    if (_timerUpgrade > 20)
                    {
                        EnemyLevel = Mathf.FloorToInt(1 + (GameDifficulty - 1) / 0.33f);
                        _timerUpgrade -= 20;
                    }
                    break;
            }
        }

        private void GameLost()
        {
            HasLost = true;
            foreach (var combatDirector in combatDirectors)
            {
                combatDirector.enabled = false;
            }
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
            foreach (var combatDirector in combatDirectors)
            {
                combatDirector.enabled = false;
            }
            victoryUI.SetActive(true);
            foreach (var obj in objectsToHide)
            {
                obj.SetActive(false);
            }
        }
    }
}
