using TMPro;
using UnityEngine;

namespace Towers.Abilities.Passive
{
    public class PassiveAbilities : MonoBehaviour
    {
        [SerializeField] protected Tower connectedTower;
        [SerializeField] protected GameObject activeAbility;
        [SerializeField] protected TextMeshProUGUI countText;
        [SerializeField] protected float cost;
        [SerializeField] protected int count = 1;
        [SerializeField] protected bool activeOnTheTower = false;
        [SerializeField] protected bool isPassiveUsed = false;
        [SerializeField] protected string passiveAbilityName;
        [SerializeField] protected string description;

        protected virtual void SetPassiveBonus()
        {
        }

        public virtual void SetTower(Tower tower)
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

            if (connectedTower && !isPassiveUsed)
            {
                SetPassiveBonus();
            }
        }

        public float Cost() => cost;

        public void Count(int addition) => count += addition;

        public void ClearCount() => count = 1;

        public void DisableAbility() => activeOnTheTower = true;

        public string Description() => description;

        public string Name() => passiveAbilityName;
        
        public void SetAbility(GameObject ability)
        {
            activeAbility = ability;
        }
    }
}
