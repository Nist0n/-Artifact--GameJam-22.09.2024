using UnityEngine;
using GameConfiguration.Directors.Functions;

namespace Combo
{
    /// <summary>
    /// Инициализатор для добавления EnemyKillTrackerComponent к мобам при их создании
    /// </summary>
    public class EnemyKillTrackerInitializer : MonoBehaviour
    {
        private void Start()
        {
            // Подписываемся на событие создания мобов
            // Это будет вызываться при создании нового моба
            InvokeRepeating(nameof(CheckForNewEnemies), 0f, 0.1f);
        }
        
        private void CheckForNewEnemies()
        {
            // Проверяем всех мобов в списке
            foreach (var enemy in GameConfiguration.GameConfig.Instance.EnemyList)
            {
                if (enemy && !enemy.GetComponent<EnemyKillTrackerComponent>())
                {
                    // Добавляем компонент отслеживания убийств
                    enemy.AddComponent<EnemyKillTrackerComponent>();
                }
            }
        }
        
        private void OnDestroy()
        {
            CancelInvoke(nameof(CheckForNewEnemies));
        }
    }
}
