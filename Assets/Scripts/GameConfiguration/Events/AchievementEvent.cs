using System.Collections.Generic;
using UnityEngine;

namespace GameConfiguration.Events
{
    [CreateAssetMenu(menuName = "Achievement Event")]
    public class AchievementEvent : ScriptableObject
    {
        private readonly List<AchievementEventListener> _listeners = new();
        
        public void TriggerEvent()
        {
            for (int i = _listeners.Count - 1; i >= 0; i--)
            {
                _listeners[i].OnEventTriggered();
            }
        }
        
        public void AddListener(AchievementEventListener listener)
        {
            _listeners.Add(listener);
        }
        
        public void RemoveListener(AchievementEventListener listener)
        {
            _listeners.Remove(listener);
        }
    }
}