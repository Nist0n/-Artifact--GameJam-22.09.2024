using System;
using UnityEngine;

namespace Towers.Abilities.Passive
{
    public class RangeGiga : PassiveAbilities
    {
        [SerializeField] private float radius = 1;

        public static event Action OnRangeBuff;
        
        protected override void SetPassiveBonus()
        {
            connectedTower.gameObject.GetComponent<AbilityTowerBuff>().AbilityRangeBuff += radius;
            OnRangeBuff?.Invoke();
            isPassiveUsed = true;
            activeOnTheTower = true;
        }
    }
}
