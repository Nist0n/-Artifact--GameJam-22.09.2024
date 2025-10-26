using System;
using System.Collections;
using UnityEngine;

namespace GameEvents.Timed.Events
{
    [CreateAssetMenu(menuName = "Timed Events/Tower Abilities Disable Event", fileName = "TowerAbilitiesDisableEvent")]
    public class TowerAbilitiesDisableEvent : TimedEvent
    {
        public static event Action<bool> HandleAbilityUse;

        public override IEnumerator Execute(TimedEventRuntime context)
        {
            HandleAbilityUse?.Invoke(false);
            
            float t = 0f;
            while (t < DefaultDuration)
            {
                t += Time.deltaTime;
                yield return null;
            }
        }

        public override void Revert(TimedEventRuntime context)
        {
            HandleAbilityUse?.Invoke(true);
        }
    }
}
