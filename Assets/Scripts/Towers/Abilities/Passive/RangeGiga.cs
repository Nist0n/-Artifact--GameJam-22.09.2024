using Abilities.Passive;
using UnityEngine;

namespace Towers.Abilities.Passive
{
    public class RangeGiga : PassiveAbilities
    {
        [SerializeField] private float radius = 1;
        
        protected override void SetPassiveBonus()
        {
            connectedTower.gameObject.GetComponent<AbilityTowerBuff>().AbilityRangeBuff += radius;
            isPassiveUsed = true;
            activeOnTheTower = true;
        }
    }
}
