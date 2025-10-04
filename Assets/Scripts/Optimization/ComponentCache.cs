using System.Collections.Generic;
using UnityEngine;

namespace Optimization
{
    /// <summary>
    /// Система кэширования компонентов для избежания дорогих GetComponent вызовов
    /// Значительно улучшает производительность при частом обращении к компонентам
    /// </summary>
    public static class ComponentCache
    {
        private static readonly Dictionary<GameObject, Dictionary<System.Type, Component>> _cache = 
            new Dictionary<GameObject, Dictionary<System.Type, Component>>();
        
        /// <summary>
        /// Получает компонент из кэша или добавляет его в кэш
        /// </summary>
        public static T GetCachedComponent<T>(GameObject obj) where T : Component
        {
            if (obj == null) return null;
            
            if (!_cache.ContainsKey(obj))
            {
                _cache[obj] = new Dictionary<System.Type, Component>();
            }
            
            var objCache = _cache[obj];
            var type = typeof(T);
            
            if (!objCache.ContainsKey(type))
            {
                objCache[type] = obj.GetComponent<T>();
            }
            
            return objCache[type] as T;
        }
        
        /// <summary>
        /// Очищает кэш для конкретного объекта
        /// </summary>
        public static void ClearCache(GameObject obj)
        {
            if (_cache.ContainsKey(obj))
            {
                _cache.Remove(obj);
            }
        }
        
        /// <summary>
        /// Очищает весь кэш
        /// </summary>
        public static void ClearAllCache()
        {
            _cache.Clear();
        }
        
        /// <summary>
        /// Очищает кэш для уничтоженных объектов
        /// </summary>
        public static void CleanupDestroyedObjects()
        {
            var keysToRemove = new List<GameObject>();
            
            foreach (var kvp in _cache)
            {
                if (kvp.Key == null)
                {
                    keysToRemove.Add(kvp.Key);
                }
            }
            
            foreach (var key in keysToRemove)
            {
                _cache.Remove(key);
            }
        }
    }
}
