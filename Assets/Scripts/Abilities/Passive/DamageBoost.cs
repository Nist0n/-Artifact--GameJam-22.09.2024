using TMPro;
using Towers;
using UnityEngine;

namespace Abilities.Passive
{
    public class DamageBoost : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI countText;
        
        private Tower _tower;

        public float Cost;
        
        public int Count;
        
        public bool ActiveOnTheTower = false;

        [SerializeField] private float damage = 0.4f;

        private bool _isPassiveUsed = false;
        private PassiveAbilities _passiveAbilities;

        public string Name { private set; get; } = "Силовые поршни";
        
        public string Description { private set; get; } = "Увеличивает урон башни на 40%";
    
        private void Start()
        {
            _passiveAbilities = GetComponent<PassiveAbilities>();
        }

        private void Update()
        {
            if (ActiveOnTheTower)
            {
                if (Count == 1)
                {
                    countText.text = "";
                    return;
                }
                countText.text = $"{Count}x";
                return;
            }
            
            if (_passiveAbilities.tower)
            {
                _tower = _passiveAbilities.tower;
            }

            if (_tower && !_isPassiveUsed)
            {
                SetPassiveBonus();
            }
        }

        private void SetPassiveBonus()
        {
            _tower.gameObject.GetComponent<AbilityTowerBuff>().AbilityDamageBuff += damage;
            _isPassiveUsed = true;
            ActiveOnTheTower = true;
        }
    }
}
