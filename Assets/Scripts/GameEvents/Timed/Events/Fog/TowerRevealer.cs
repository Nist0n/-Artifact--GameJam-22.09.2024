using Towers;
using UnityEngine;

namespace GameEvents.Timed.Events.Fog
{
    public class TowerRevealer : MonoBehaviour
    {
        [Tooltip("Reveal radius in world units. If 0, will use tower's attack range")]
        public float Radius = 0f;
        
        [Tooltip("Multiplier for tower's attack range when calculating reveal radius")]
        [Range(0.5f, 2f)]
        public float RangeMultiplier = 1.0f;
        
        [Tooltip("Minimum reveal radius regardless of tower range")]
        public float MinRadius = 5f;
        
        [Tooltip("Maximum reveal radius regardless of tower range")]
        public float MaxRadius = 50f;

        private Tower _tower;
        private float _effectiveRadius;

        private void Start()
        {
            _tower = GetComponent<Tower>();
            UpdateEffectiveRadius();
        }

        private void Update()
        {
            if (_tower)
            {
                UpdateEffectiveRadius();
            }
        }

        private void UpdateEffectiveRadius()
        {
            if (_tower && Radius <= 0)
            {
                _effectiveRadius = _tower.attackRange * RangeMultiplier;
            }
            else
            {
                _effectiveRadius = Radius;
            }
            
            _effectiveRadius = Mathf.Clamp(_effectiveRadius, MinRadius, MaxRadius);
        }

        public float GetEffectiveRadius()
        {
            return _effectiveRadius;
        }

        private void OnEnable()
        {
            FogRevealerManager.Register(this);
        }

        private void OnDisable()
        {
            FogRevealerManager.Unregister(this);
        }
        
        private void OnDrawGizmosSelected()
        {
            Gizmos.color = new Color(0.2f, 0.8f, 0.2f, 0.3f);
            Gizmos.DrawWireSphere(transform.position, GetEffectiveRadius());
            
            Gizmos.color = new Color(0.3f, 1f, 0.3f, 0.1f);
            Gizmos.DrawSphere(transform.position, GetEffectiveRadius());
            
            if (_tower)
            {
                Gizmos.color = new Color(1f, 0.5f, 0f, 0.2f);
                Gizmos.DrawWireSphere(transform.position, _tower.attackRange);
            }
        }
    }
}