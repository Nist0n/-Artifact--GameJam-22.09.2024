using System.Collections;
using UnityEngine;
using GameConfiguration;
using GameConfiguration.Directors;
using GameConfiguration.Directors.Functions;
using UI.InGame;

namespace GameEvents.Timed
{
    public class BossChoiceManager : MonoBehaviour
    {
        [Header("Boss Configuration")]
        [SerializeField] private DirectorCard bossCard;
        [SerializeField] private int centerSpawnerIndex = 1; // Индекс центральной точки спавна (вторая точка)
        [SerializeField] private float bossSpawnDelay = 2f;
        
        [Header("References")]
        [SerializeField] private BossChoiceUI choiceUI;
        [SerializeField] private TimedEventManager eventManager;
        
        private bool _isWaitingForChoice = false;
        private bool _hasBossBeenSummoned = false;
        
        public System.Action OnBossSpawned;
        public System.Action OnEventsContinued;
        
        private void Start()
        {
            ValidateCenterSpawnerIndex();
        }
        
        private void OnEnable()
        {
            BossChoiceUI.OnBossSummoned += HandleBossSummoned;
            BossChoiceUI.OnEventsContinued += HandleEventsContinued;
        }
        
        private void OnDisable()
        {
            BossChoiceUI.OnBossSummoned -= HandleBossSummoned;
            BossChoiceUI.OnEventsContinued -= HandleEventsContinued;
        }
        
        public void ShowBossChoice()
        {
            if (_isWaitingForChoice || _hasBossBeenSummoned) return;
            
            _isWaitingForChoice = true;
            choiceUI.ShowChoice();
        }
        
        private void HandleBossSummoned()
        {
            if (!_isWaitingForChoice) return;
            
            _isWaitingForChoice = false;
            _hasBossBeenSummoned = true;
            
            Time.timeScale = 1f;

            if (GameConfig.Instance.IsInTower)
            {
                Cursor.visible = false;
                Cursor.lockState = CursorLockMode.Locked;
            }
            
            StartCoroutine(SpawnBossSequence());
        }
        
        private void HandleEventsContinued()
        {
            if (!_isWaitingForChoice) return;
            
            _isWaitingForChoice = false;
            
            Time.timeScale = 1f;
            
            if (GameConfig.Instance.IsInTower)
            {
                Cursor.visible = false;
                Cursor.lockState = CursorLockMode.Locked;
            }
            
            OnEventsContinued?.Invoke();
        }
        
        private IEnumerator SpawnBossSequence()
        {
            ClearAllMonsters();
            
            GameConfig.Instance.DisableAllDirectors();
            
            yield return new WaitForSeconds(bossSpawnDelay);
            
            SpawnBossAtCenter();
            
            OnBossSpawned?.Invoke();
        }
        
        private void ClearAllMonsters()
        {
            var gameConfig = GameConfig.Instance;
            if (!gameConfig) return;
            
            var enemiesToRemove = new System.Collections.Generic.List<GameObject>(gameConfig.EnemyList);
            
            foreach (var enemy in enemiesToRemove)
            {
                if (enemy)
                {
                    var enemyComponent = enemy.GetComponent<Enemies.Enemy>();
                    if (enemyComponent)
                    {
                        var deathMethod = enemyComponent.GetType().GetMethod("Die");
                        if (deathMethod != null)
                        {
                            deathMethod.Invoke(enemyComponent, null);
                        }
                        else
                        {
                            Destroy(enemy);
                        }
                    }
                    else
                    {
                        Destroy(enemy);
                    }
                }
            }
            
            gameConfig.EnemyList.Clear();
            
            Debug.Log($"[BossChoiceManager] Cleared {enemiesToRemove.Count} monsters from the map");
        }
        
        private void SpawnBossAtCenter()
        {
            if (!bossCard)
            {
                Debug.LogError("[BossChoiceManager] Boss card not set!");
                return;
            }
            
            var gameConfig = GameConfig.Instance;
            if (!gameConfig || gameConfig.Spawners == null || gameConfig.Spawners.Count == 0)
            {
                Debug.LogError("[BossChoiceManager] No spawners found in GameConfig!");
                return;
            }
            
            if (centerSpawnerIndex < 0 || centerSpawnerIndex >= gameConfig.Spawners.Count)
            {
                Debug.LogError($"[BossChoiceManager] Invalid spawner index {centerSpawnerIndex}. Available spawners: {gameConfig.Spawners.Count}");
                return;
            }
            
            Transform centerSpawnPoint = gameConfig.Spawners[centerSpawnerIndex].transform;
            if (!centerSpawnPoint)
            {
                Debug.LogError($"[BossChoiceManager] Spawner at index {centerSpawnerIndex} is null!");
                return;
            }
            
            var spawnRequest = new DirectorSpawnRequest(bossCard.spawnCard, null, 1f);
            
            DirectorCore.instance.TrySpawnObjectWithEffect(spawnRequest, centerSpawnPoint, this, result =>
            {
                if (result.Success && result.SpawnedInstance)
                {
                    Debug.Log($"[BossChoiceManager] Boss spawned successfully at spawner {centerSpawnerIndex}: {result.SpawnedInstance.name}");
                }
                else
                {
                    Debug.LogError("[BossChoiceManager] Failed to spawn boss!");
                }
            });
        }
        
        private void ValidateCenterSpawnerIndex()
        {
            var gameConfig = GameConfig.Instance;
            if (!gameConfig || gameConfig.Spawners == null)
            {
                Debug.LogWarning("[BossChoiceManager] GameConfig or Spawners not available during validation");
                return;
            }
            
            if (gameConfig.Spawners.Count == 0)
            {
                Debug.LogWarning("[BossChoiceManager] No spawners found in GameConfig");
                return;
            }
            
            if (centerSpawnerIndex < 0 || centerSpawnerIndex >= gameConfig.Spawners.Count)
            {
                Debug.LogWarning($"[BossChoiceManager] Invalid spawner index {centerSpawnerIndex}. Available spawners: {gameConfig.Spawners.Count}. Using index 0 instead.");
                centerSpawnerIndex = 0;
            }
            
            Debug.Log($"[BossChoiceManager] Using spawner index {centerSpawnerIndex} for boss spawn. Spawner: {gameConfig.Spawners[centerSpawnerIndex].name}");
        }
    }
}
