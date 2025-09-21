using System;

namespace Abilities.Passive
{
    public class FireBoost : PassiveAbilities
    {
        private const float TPS = 0.25f;

        private void Start()
        {
            description = $"Увеличивает скорострельность башни на {TPS * 100}%\n(+{TPS * 100}% за штуку)";
        }

        protected override void SetPassiveBonus()
        {
            connectedTower.gameObject.GetComponent<AbilityTowerBuff>().AbilityFireRateBuff += TPS;
            isPassiveUsed = true;
            activeOnTheTower = true;
        }
    }
}
