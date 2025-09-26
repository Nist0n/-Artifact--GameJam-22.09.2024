using System.Collections;
using GameConfiguration.Directors.Elites;
using UnityEngine;

namespace Towers.Abilities.Active
{
    public class FireMeltDamage : MonoBehaviour
    {
        [SerializeField] private float meltRadius = 5f;
        [SerializeField] private float duration = 3f;
        [SerializeField] private GameObject fireEffectPrefab;
        [SerializeField] private string fireSfxName = "FireMelt";

        private void Start()
        {
            StartCoroutine(ExecuteFireMelt());
        }

        private IEnumerator ExecuteFireMelt()
        {
            if (!string.IsNullOrEmpty(fireSfxName) && Audio.AudioManager.instance)
            {
                Audio.AudioManager.instance.PlaySFX(fireSfxName);
            }
        
            if (fireEffectPrefab)
            {
                GameObject fireEffect = Instantiate(fireEffectPrefab, transform.position, Quaternion.identity);
                Destroy(fireEffect, duration);
            }
        
            MeltNearbyIceTrails();

            yield return new WaitForSeconds(duration);
        
            Destroy(gameObject);
        }

        private void MeltNearbyIceTrails()
        {
            IceTrailManager.Instance.MeltTrails(transform.position, meltRadius);
        }
    }
}
