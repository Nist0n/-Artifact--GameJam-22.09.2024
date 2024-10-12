using Abilities.Active;
using TMPro;
using Towers;
using UnityEngine;

namespace Abilities.Passive
{
    public class SpeedBoom : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI countText;
        
        public float Cost;
        
        public int Count;
        
        private bool _activeOnTheTower = false;

        private bool _isCountSeted = false;

        [SerializeField] private GameObject abil;
    
        [SerializeField] private float percent = 0.6f;

        private bool _isPassiveUsed = false;
        
        private Tower _tower;
        
        private PassiveAbilities _passiveAbilities;

        public string Description { private set; get; } = "Уменьшает перезарядку активных способностей на 40%";
    
        private void Start()
        {
            _passiveAbilities = GetComponent<PassiveAbilities>();
        }

        private void Update()
        {
            if (_activeOnTheTower)
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

            if (_tower && !_isCountSeted)
            {
                _isCountSeted = true;
                _activeOnTheTower = true;
            }
            
            if (_passiveAbilities.ActiveAbil && !_isPassiveUsed)
            {
                SetPassiveBonus();
            }
        }

        private void SetPassiveBonus()
        {
            _passiveAbilities.ActiveAbil.GetComponent<ActiveAbility>()
                .ChangeAbilityCooldown(_passiveAbilities.ActiveAbil.name, percent, _passiveAbilities.ActiveAbil);
            _isPassiveUsed = true;
        }
    }
}
