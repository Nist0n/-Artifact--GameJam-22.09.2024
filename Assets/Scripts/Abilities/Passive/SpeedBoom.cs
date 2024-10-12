using Abilities.Active;
using UnityEngine;

namespace Abilities.Passive
{
    public class SpeedBoom : MonoBehaviour
    {
        public float Cost;

        [SerializeField] private GameObject abil;
    
        [SerializeField] private float percent = 0.6f;

        private bool _isPassiveUsed = false;
        private PassiveAbilities _passiveAbilities;

        public string Description { private set; get; } = "Уменьшает перезарядку активных способностей на 40%";
    
        private void Start()
        {
            _passiveAbilities = GetComponent<PassiveAbilities>();
        }

        private void Update()
        {
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
            gameObject.GetComponent<SpeedBoom>().enabled = false;
        }
    }
}
