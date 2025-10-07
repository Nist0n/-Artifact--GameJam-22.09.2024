using Towers.Abilities.Active;

namespace Towers.Abilities.Passive
{
    public class SpeedBoom : PassiveAbilities
    {
        private bool _isCountSet;

        private const float PERCENT = 0.6f;

        public override void SetTower(Tower tower)
        {
            connectedTower = tower;
            if (activeOnTheTower)
            {
                if (count == 1)
                {
                    countText.text = "";
                    return;
                }
                countText.text = $"{count}x";
                return;
            }

            if (connectedTower && !_isCountSet)
            {
                _isCountSet = true;
                activeOnTheTower = true;
            }
            
            if (activeAbility && !isPassiveUsed)
            {
                SetPassiveBonus();
            }
        }

        protected override void SetPassiveBonus()
        {
            activeAbility.GetComponent<ActiveAbility>()
                .ChangeAbilityCooldown(PERCENT);
            isPassiveUsed = true;
            activeOnTheTower = true;
        }
    }
}
