using UnityEngine;

namespace GameEvents.Timed.Events
{
    public class TowerRevealer : MonoBehaviour
    {
        [Tooltip("Reveal radius in world units")] public float Radius = 19f;

        private void OnEnable()
        {
            FogRevealerManager.Register(this);
        }

        private void OnDisable()
        {
            FogRevealerManager.Unregister(this);
        }
    }
}