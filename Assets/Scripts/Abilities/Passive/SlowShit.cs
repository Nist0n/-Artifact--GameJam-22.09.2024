using TMPro;
using Towers;
using UnityEngine;

namespace Abilities.Passive
{
    public class SlowShit : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI countText;
        
        private Tower _tower;

        public float Cost;
        
        public int Count;
        
        public bool ActiveOnTheTower = false;

        private bool _isPassiveUsed = false;
        
        private PassiveAbilities _passiveAbilities;

        public string Name { private set; get; } = "Замедляющий бульбулятор";
        
        public string Description { private set; get; } = "Башня при попадании замедляет врага на 25%";
    
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
            _tower.SetSlowness();
            _isPassiveUsed = true;
            ActiveOnTheTower = true;
        }
    }
}
