using TMPro;
using Towers;
using UnityEngine;

namespace Abilities.Passive
{
    public class RangeGiga : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI countText;
        
        private Tower _tower;

        public float Cost;
        
        public int Count;

        public bool ActiveOnTheTower = false;

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
            _tower.attackRange *= radius;
            _isPassiveUsed = true;
            ActiveOnTheTower = true;
        }
    }
}
