using System;
using System.Collections;
using GameConfiguration;
using UnityEngine;
using StaticClasses;
using GameConfiguration.Directors.Elites;
using Towers;

namespace Combo
{
    public class ComboManager : MonoBehaviour
    {
        [Header("Combo Settings")]
        [SerializeField] private float comboDecayTime = 15f;
        [SerializeField] private float towerStayDecayTime = 45f;
        [SerializeField] private float towerSwitchBonusTime = 6f;
        
        [Header("Combo Values")]
        [SerializeField] private int regularMobComboValue = 1;
        [SerializeField] private int eliteMobComboValue = 5;
        [SerializeField] private int towerSwitchBonusValue = 2;
        
        [Header("Resource Multiplier")]
        [SerializeField] private float comboMultiplierBase = 50f; // База для расчета множителя (1 + combo/50)
        
        public static event Action<int> OnComboChanged;
        public static event Action<float> OnComboMultiplierChanged;
        
        public static ComboManager Instance { get; private set; }
        
        private int _currentCombo = 0;
        private float _comboDecayTimer = 0f;
        private float _towerStayTimer = 0f;
        private float _towerSwitchTimer = 0f;
        private bool _isInTower = false;
        private Tower _currentTower = null;
        
        public int CurrentCombo => _currentCombo;
        public float ResourceMultiplier => 1f + (_currentCombo / comboMultiplierBase);
        public bool IsTowerSwitchBonusActive => _towerSwitchTimer > 0f;
        
        private void Awake()
        {
            if (!Instance)
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
            EnemyKillTracker.OnEnemyKilled += OnEnemyKilled;
            GameConfig.Instance.OnTowerChanged += OnTowerChanged;
            
            if (!FindAnyObjectByType<EnemyKillTrackerInitializer>())
            {
                var initializer = new GameObject("EnemyKillTrackerInitializer");
                initializer.AddComponent<EnemyKillTrackerInitializer>();
            }
            
            UpdateComboUI();
        }
        
        private void OnDestroy()
        {
            EnemyKillTracker.OnEnemyKilled -= OnEnemyKilled;
            if (GameConfig.Instance)
            {
                GameConfig.Instance.OnTowerChanged -= OnTowerChanged;
            }
        }
        
        private void Update()
        {
            if (_currentCombo > 0 || _isInTower || _towerSwitchTimer > 0f)
            {
                UpdateTimers();
            }
        }
        
        private void UpdateTimers()
        {
            if (_currentCombo > 0)
            {
                _comboDecayTimer += Time.deltaTime;
                if (_comboDecayTimer >= comboDecayTime)
                {
                    ResetCombo();
                }
            }
            
            if (_isInTower)
            {
                _towerStayTimer += Time.deltaTime;
                if (_towerStayTimer >= towerStayDecayTime)
                {
                    ResetCombo();
                }
            }
            
            if (_towerSwitchTimer > 0f)
            {
                _towerSwitchTimer -= Time.deltaTime;
            }
        }
        
        private void OnEnemyKilled(GameObject enemy, bool isElite)
        {
            if (!enemy) return;
            
            int comboPoints;
            
            if (isElite) comboPoints = eliteMobComboValue;
            else comboPoints = regularMobComboValue;
            
            if (IsTowerSwitchBonusActive)
            {
                comboPoints += towerSwitchBonusValue;
            }
            
            AddCombo(comboPoints);
        }
        
        private void OnTowerChanged(Tower newTower)
        {
            if (newTower != _currentTower)
            {
                _currentTower = newTower;
                _towerStayTimer = 0f;
                _towerSwitchTimer = towerSwitchBonusTime;
            }
            
            _isInTower = GameConfig.Instance.IsInTower;
        }
        
        private void AddCombo(int points)
        {
            _currentCombo += points;
            _comboDecayTimer = 0f;
            
            OnComboChanged?.Invoke(_currentCombo);
            OnComboMultiplierChanged?.Invoke(ResourceMultiplier);
            
            UpdateComboUI();
        }
        
        private void ResetCombo()
        {
            if (_currentCombo == 0) return;
            
            _currentCombo = 0;
            _comboDecayTimer = 0f;
            _towerStayTimer = 0f;
            
            OnComboChanged?.Invoke(_currentCombo);
            OnComboMultiplierChanged?.Invoke(ResourceMultiplier);
            
            UpdateComboUI();
        }
        
        
        private void UpdateComboUI()
        {
            ComboUI.Instance?.UpdateComboDisplay(_currentCombo, ResourceMultiplier);
        }
        
        public void ForceResetCombo()
        {
            ResetCombo();
        }
        
        public float GetResourceMultiplier()
        {
            return ResourceMultiplier;
        }
    }
}
