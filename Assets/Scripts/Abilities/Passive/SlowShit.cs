using Towers;
using UnityEngine;

namespace Abilities.Passive
{
    public class SlowShit : MonoBehaviour
    {
        private Tower _tower;

        public float Cost;

        private bool _isPassiveUsed = false;
        private PassiveAbilities _passiveAbilities;

        public string Description { private set; get; } = "Башня при попадании замедляет врага на 25%";
    
        private void Start()
        {
            _passiveAbilities = GetComponent<PassiveAbilities>();
        }

        private void Update()
        {
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
        }
    }
}
