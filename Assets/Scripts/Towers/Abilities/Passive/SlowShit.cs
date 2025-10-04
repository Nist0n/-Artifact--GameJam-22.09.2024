namespace Towers.Abilities.Passive
{
    public class SlowShit : PassiveAbilities
    {
        protected override void SetPassiveBonus()
        {
            connectedTower.SetSlowness();
            isPassiveUsed = true;
            activeOnTheTower = true;
        }
    }
}
