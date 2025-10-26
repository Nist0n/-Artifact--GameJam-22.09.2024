using System.Collections.Generic;
using UnityEngine;

namespace Optimization
{
    public static class ComponentCache
    {
        private static readonly Dictionary<GameObject, Dictionary<System.Type, Component>> _cache = 
            new Dictionary<GameObject, Dictionary<System.Type, Component>>();
        
        public static T GetCachedComponent<T>(GameObject obj) where T : Component
        {
            if (!obj) return null;
            
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
        
        public static void ClearCache(GameObject obj)
        {
            if (_cache.ContainsKey(obj))
            {
                _cache.Remove(obj);
            }
        }
        
        public static void ClearAllCache()
        {
            _cache.Clear();
        }
        
        public static void CleanupDestroyedObjects()
        {
            var keysToRemove = new List<GameObject>();
            
            foreach (var kvp in _cache)
            {
                if (!kvp.Key)
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
