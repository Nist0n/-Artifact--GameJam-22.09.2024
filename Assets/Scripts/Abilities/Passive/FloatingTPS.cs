using TMPro;
using Towers;
using UnityEngine;

namespace Abilities.Passive
{
    public class FloatingTPS : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI countText;
        
        private Tower _tower;

        public float Cost;
        
        public int Count;
        
        public bool ActiveOnTheTower = false;

        public static float tps = 0.6f;
        
        public static float damageBuff = 1.25f;
        
        private bool _isPassiveUsed = false;
        
        private PassiveAbilities _passiveAbilities;

        public string Description { private set; get; } = $"Увеличивает скорострельность башни на {(1 - tps) * 100}% и урон башни на {(damageBuff - 1) * 100}% в течение первых {Tower.buffDuration} секунд";
    
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
            _tower.buffedFireRate *= tps;
            _tower.buffedDamage *= damageBuff;
            _isPassiveUsed = true;
            ActiveOnTheTower = true;
        }
    }
}
