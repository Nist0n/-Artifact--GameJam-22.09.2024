using UnityEngine;

namespace Optimization
{
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
                ComponentCache.ClearAllCache();
            }
        }
    }
}
