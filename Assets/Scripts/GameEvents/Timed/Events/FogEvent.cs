using System.Collections;
using System.Threading.Tasks;
using UnityEngine;
using GameEvents.Timed.Events;

namespace GameEvents.Timed.Events
{
    [CreateAssetMenu(fileName = "FogEvent", menuName = "Timed Events/Timed/Fog Event")]
    public class FogEvent : TimedEvent
    {
        [Header("Fog Settings")]
        [SerializeField] private Material fogMaterial;
        [SerializeField] private float maxDensity = 2.0f;
        [SerializeField] private float minDensity = 0.0f;
        
        [Header("Fade Settings")]
        [SerializeField] private float fadeInDuration = 3.0f;
        [SerializeField] private float fadeOutDuration = 5.0f;
        [SerializeField] private AnimationCurve fadeInCurve = AnimationCurve.EaseInOut(0, 0, 1, 1);
        [SerializeField] private AnimationCurve fadeOutCurve = AnimationCurve.EaseInOut(0, 1, 1, 0);
        
        [Header("Fog Duration")]
        [SerializeField] private float fogHoldDuration = 10.0f;

        public override IEnumerator Execute(TimedEventRuntime context)
        {
            if (!fogMaterial)
            {
                yield break;
            }
            
            yield return FadeInFogCoroutine();
            yield return new WaitForSeconds(fogHoldDuration);
            yield return FadeOutFogCoroutine();
            yield return null;
        }

        private IEnumerator FadeInFogCoroutine()
        {
            float startDensity = fogMaterial.GetFloat("_Density");
            float elapsed = 0f;
            
            while (elapsed < fadeInDuration)
            {
                elapsed += Time.deltaTime;
                float t = elapsed / fadeInDuration;
                float curveValue = fadeInCurve.Evaluate(t);
                
                float currentDensity = Mathf.Lerp(startDensity, maxDensity, curveValue);
                fogMaterial.SetFloat("_Density", currentDensity);
                
                yield return null;
            }
            
            fogMaterial.SetFloat("_Density", maxDensity);
        }

        private IEnumerator FadeOutFogCoroutine()
        {
            float elapsed = 0f;
            
            while (elapsed < fadeOutDuration)
            {
                elapsed += Time.deltaTime;
                float t = elapsed / fadeOutDuration;
                float curveValue = fadeOutCurve.Evaluate(t);
                
                float currentDensity = 5 - Mathf.Lerp(maxDensity, minDensity, curveValue);
                fogMaterial.SetFloat("_Density", currentDensity);
                
                yield return null;
            }

            fogMaterial.SetFloat("_Density", minDensity);
        }
        
        private void OnValidate()
        {
            DefaultDuration = fadeInDuration + fogHoldDuration + fadeOutDuration;
        }
    }
}
