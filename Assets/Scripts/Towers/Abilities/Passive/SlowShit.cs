using UnityEngine;

namespace Towers.Abilities.Passive
{
    public class SlowShit : PassiveAbilities
    {
        protected override void SetPassiveBonus()
        {
            connectedTower.SetSlowness();
            activeOnTheTower = true;
            isPassiveUsed = true;
        }
    }
}
