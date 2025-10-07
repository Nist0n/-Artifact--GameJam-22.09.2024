namespace Towers.Abilities.Passive
{
    public class SlowShit : PassiveAbilities
    {
        protected override void SetPassiveBonus()
        {
            // Compute stacking slow: stronger with more purchases but never fully stops
            // Design: base multiplier 0.9 per stack with diminishing floor 0.2 after ~10+ stacks
            // multiplier = max(0.2, 0.9^count)
            float multiplier = UnityEngine.Mathf.Max(0.2f, UnityEngine.Mathf.Pow(0.9f, count));

            // Slow duration scales mildly with stacks, e.g., 2.5s + 0.2s per stack, cap at 6s
            float duration = UnityEngine.Mathf.Min(6f, 2.5f + 0.2f * count);

            connectedTower.SetSlowness(multiplier, duration);
            isPassiveUsed = true;
            activeOnTheTower = true;
        }
    }
}
