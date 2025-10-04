using UnityEngine;

namespace Optimization
{
    /// <summary>
    /// Система очистки кэша для предотвращения утечек памяти
    /// Автоматически очищает кэш от уничтоженных объектов
    /// </summary>
    public class CacheCleanup : MonoBehaviour
    {
        [SerializeField] private float cleanupInterval = 5f; // Очищаем каждые 5 секунд
        
        private void Start()
        {
            // Запускаем периодическую очистку кэша
            InvokeRepeating(nameof(CleanupCache), cleanupInterval, cleanupInterval);
        }
        
        private void CleanupCache()
        {
            ComponentCache.CleanupDestroyedObjects();
        }
        
        private void OnDestroy()
        {
            CancelInvoke(nameof(CleanupCache));
        }
        
        private void OnApplicationPause(bool pauseStatus)
        {
            if (pauseStatus)
            {
                // Очищаем кэш при паузе приложения
                ComponentCache.ClearAllCache();
            }
        }
    }
}
