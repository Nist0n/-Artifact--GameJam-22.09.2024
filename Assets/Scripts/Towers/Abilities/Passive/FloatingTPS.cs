using System;

namespace Towers.Abilities.Passive
{
    public class FloatingTPS : PassiveAbilities
    {
        private const float TPS = 0.6f;

        private const float DAMAGE_BUFF = 1.25f;

        private void Start()
        {
            description = $"Увеличивает скорострельность башни на {(1 - TPS) * 100}% и урон башни на {(DAMAGE_BUFF - 1) * 100}% в течение первых {Tower.BuffDuration} секунд";
        }

        protected override void SetPassiveBonus()
        {
            connectedTower.buffedFireRatePercent *= TPS;
            connectedTower.buffedDamagePercent *= DAMAGE_BUFF;
            isPassiveUsed = true;
            activeOnTheTower = true;
        }
    }
}
