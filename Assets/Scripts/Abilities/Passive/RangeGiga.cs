using Towers;
using UnityEngine;

namespace Abilities.Passive
{
    public class RangeGiga : MonoBehaviour
    {
        private Tower _tower;

        public float Cost;

        [SerializeField] private float radius = 1.25f;

        private bool _isPassiveUsed = false;
        private PassiveAbilities _passiveAbilities;

        public string Description { private set; get; }  = $"Увеличивает дальность атаки башни на 25%";
    
        private void Start()
        {
            Description = $"Увеличивает дальность атаки башни на {(radius - 1) * 100}%";
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
            _tower.attackRange *= radius;
            Debug.Log(_tower.attackRange);
            _isPassiveUsed = true;
        }
    }
}
