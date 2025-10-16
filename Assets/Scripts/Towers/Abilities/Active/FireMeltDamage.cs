using System.Collections;
using GameConfiguration.Directors.Elites;
using GameConfiguration.Settings.Audio;
using UnityEngine;

namespace Towers.Abilities.Active
{
    public class FireMeltDamage : MonoBehaviour
    {
        [SerializeField] private float meltRadius = 5f;
        [SerializeField] private float duration = 3f;
        [SerializeField] private float burnDuration = 4f;
        [SerializeField] private float burnDamagePerSecond = 5f;
        [SerializeField] private int overlapBufferSize = 64;
        [SerializeField] private GameObject fireEffectPrefab;
        // [SerializeField] private string fireSfxName = "FireMelt";
        
        private Collider[] _overlapResults;

        private void Start()
        {
            if (overlapBufferSize < 1)
            {
                overlapBufferSize = 16;
            }
            _overlapResults = new Collider[overlapBufferSize];
            StartCoroutine(ExecuteFireMelt());
        }

        private IEnumerator ExecuteFireMelt()
        {
            // if (!string.IsNullOrEmpty(fireSfxName) && AudioManager.Instance)
            // {
            //     AudioManager.Instance.PlaySFX(fireSfxName);
            // }
        
            if (fireEffectPrefab)
            {
                GameObject fireEffect = Instantiate(fireEffectPrefab, transform.position, Quaternion.identity);
                Destroy(fireEffect, duration);
            }
        
            yield return new WaitForSeconds(duration);
            
            MeltNearbyIceTrails();
            ApplyBurnToEnemies();
        
            Destroy(gameObject);
        }

        private void MeltNearbyIceTrails()
        {
            IceTrailManager.Instance.MeltTrails(transform.position, meltRadius);
        }

        private void ApplyBurnToEnemies()
        {
            int count = Physics.OverlapSphereNonAlloc(transform.position, meltRadius, _overlapResults);
            for (int i = 0; i < count; i++)
            {
                Collider col = _overlapResults[i];
                if (!col)
                {
                    continue;
                }
                var core = col.GetComponentInParent<Enemies.StateMachine.Core>();
                if (core)
                {
                    if (burnDuration > 0f)
                    {
                        core.ActivateBurn(burnDuration, burnDamagePerSecond);
                    }
                    else core.ActivateBurn(duration, burnDamagePerSecond);
                }
            }
        }
    }
}
