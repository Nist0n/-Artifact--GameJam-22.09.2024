using GameConfiguration;
using UnityEngine;
using GameConfiguration.Directors.Functions;

namespace Combo
{
    public class EnemyKillTrackerInitializer : MonoBehaviour
    {
        private void Start()
        {
            GameConfig.Instance.OnEnemyAdded += OnEnemyAdded;
        }
        
        private void OnEnemyAdded(GameObject enemy)
        {
            if (enemy && !enemy.GetComponent<EnemyKillTrackerComponent>())
            {
                enemy.AddComponent<EnemyKillTrackerComponent>();
            }
        }
        
        private void OnDestroy()
        {
            if (GameConfig.Instance)
            {
                GameConfig.Instance.OnEnemyAdded -= OnEnemyAdded;
            }
        }
    }
}
