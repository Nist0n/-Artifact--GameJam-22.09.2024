using UnityEngine;
using UnityEngine.Events;

namespace GameConfiguration.Events
{
    public class AchievementEventListener : MonoBehaviour
    {
        public AchievementEvent gameEvent;
        public UnityEvent onEventTriggered;

        private void OnEnable()
        {
            gameEvent.AddListener(this);
        }

        private void OnDisable()
        {
            gameEvent.RemoveListener(this);
        }

        public void OnEventTriggered()
        {
            onEventTriggered.Invoke();
        }
    }
}
