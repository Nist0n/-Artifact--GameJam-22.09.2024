using System.Collections.Generic;
using UnityEngine;

namespace GameConfiguration.Events
{
    [CreateAssetMenu(menuName = "Achievement Event")]
    public class AchievementEvent : ScriptableObject
    {
        private List<AchievementEventListener> listeners = new();
        
        public void TriggerEvent()
        {
            for (int i = listeners.Count - 1; i >= 0; i--)
            {
                listeners[i].OnEventTriggered();
            }
        }
        
        public void AddListener(AchievementEventListener listener)
        {
            listeners.Add(listener);
        }
        
        public void RemoveListener(AchievementEventListener listener)
        {
            listeners.Remove(listener);
        }
    }
}