using System;

namespace Abilities.Passive
{
    public class DamageBoost : PassiveAbilities
    {
        private const float DAMAGE = 0.4f;

        private void Start()
        {
            description = $"Увеличивает урон башни на {DAMAGE * 100}%\n(+{DAMAGE * 100}% за штуку)";
        }

        protected override void SetPassiveBonus()
        {
            connectedTower.gameObject.GetComponent<AbilityTowerBuff>().AbilityDamageBuff += DAMAGE;
            isPassiveUsed = true;
            activeOnTheTower = true;
        }
    }
}
