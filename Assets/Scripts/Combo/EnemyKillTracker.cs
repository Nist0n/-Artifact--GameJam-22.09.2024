using System.Collections.Generic;
using UnityEngine;
using GameConfiguration.Directors.Elites;
using Enemies.StateMachine;
using Towers;

namespace Combo
{
    public class EnemyKillTracker : MonoBehaviour
    {
        public static EnemyKillTracker Instance { get; private set; }
        
        private Queue<GameObject> _recentlyKilledEnemies = new Queue<GameObject>();
        
        private const int MAX_RECENT_KILLS = 10;
        
        public static System.Action<GameObject, bool> OnEnemyKilled;
        
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
            StaticClasses.GameEvents.EnemyDeath += OnEnemyDeath;
        }
        
        private void OnDestroy()
        {
            StaticClasses.GameEvents.EnemyDeath -= OnEnemyDeath;
        }
        
        private void OnEnemyDeath(float goldReward, float expReward)
        {
            GameObject lastKilledEnemy = FindLastKilledEnemy();
            if (!lastKilledEnemy) return;
            
            if (!WasKilledByPlayerTower(lastKilledEnemy)) return;
            
            bool isElite = IsEnemyElite(lastKilledEnemy);
            
            _recentlyKilledEnemies.Enqueue(lastKilledEnemy);
            if (_recentlyKilledEnemies.Count > MAX_RECENT_KILLS)
            {
                _recentlyKilledEnemies.Dequeue();
            }
            
            OnEnemyKilled?.Invoke(lastKilledEnemy, isElite);
        }
        
        private GameObject FindLastKilledEnemy()
        {
            var activeEnemies = GameConfiguration.GameConfig.Instance.EnemyList;
            var activeEnemiesSet = new HashSet<GameObject>(activeEnemies);
            
            GameObject[] allEnemies = GameObject.FindGameObjectsWithTag("Enemy");
            
            foreach (var enemy in allEnemies)
            {
                if (enemy && !activeEnemiesSet.Contains(enemy))
                {
                    return enemy;
                }
            }
            
            return null;
        }
        
        private bool IsEnemyElite(GameObject enemy)
        {
            if (!enemy) return false;
            
            var core = enemy.GetComponentInChildren<Core>();
            if (!core) return false;
            
            var renderer = enemy.GetComponentInChildren<Renderer>();
            if (renderer && renderer.material)
            {
                Color materialColor = renderer.material.color;
                
                bool isNotStandardColor = materialColor != Color.white && 
                                        materialColor != Color.gray && 
                                        materialColor != new Color(1f, 1f, 1f, 1f);
                
                if (isNotStandardColor)
                {
                    return true;
                }
            }
            
            return false;
        }
        
        private bool WasKilledByPlayerTower(GameObject enemy)
        {
            if (!enemy) return false;
            
            var killTracker = enemy.GetComponent<EnemyKillTrackerComponent>();
            if (!killTracker) return false;
            
            if (!killTracker.WasKilledByPlayerTower()) return false;
            
            return true;
        }
    }
}
