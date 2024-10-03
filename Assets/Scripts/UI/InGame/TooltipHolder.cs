using Abilities.Active;
using Abilities.Passive;
using UnityEngine;

namespace UI.InGame
{
    public class TooltipHolder : MonoBehaviour
    {
        [SerializeField] private GameObject tooltipPrefab;

        private GameObject _tooltip;
        
        private void Start()
        {
            _tooltip = Instantiate(tooltipPrefab, transform);
        }

        public void SetAndShowTooltip()
        {
            _tooltip.SetActive(true);
            float cost = 0;
            string description = "";
            if (gameObject.TryGetComponent(out PassiveAbilities passive))
            {
                cost = passive.Cost(gameObject.name);
                description = passive.Description(gameObject.name);
            }
            else if (gameObject.TryGetComponent(out ActiveAbility active))
            {
                cost = active.Cost(gameObject.name);
                description = active.Description(gameObject.name);
            }
            else
            {
                Debug.Log("Couldn't find script");
            }
            
            _tooltip.GetComponent<Tooltip>().textComponent.text = $"Стоимость: {cost}\n{description}";
        }
        
        public void HideTooltip()
        {
            _tooltip.SetActive(false);
            _tooltip.GetComponent<Tooltip>().textComponent.text = string.Empty;
        }
    }
}