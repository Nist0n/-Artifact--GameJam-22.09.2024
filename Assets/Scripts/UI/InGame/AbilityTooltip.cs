using Abilities.Passive;
using Audio;
using Towers.Abilities.Active;
using UnityEngine;

namespace UI.InGame
{
    public class AbilityTooltip : MonoBehaviour
    {
        [SerializeField] private GameObject tooltipPrefab;
        [SerializeField] private Transform tooltipTransform;

        private GameObject _tooltip;
        
        private void Start()
        {
            if (!tooltipTransform)
            {
                tooltipTransform = transform.parent.parent.parent.Find("TooltipPosition");
                _tooltip = Instantiate(tooltipPrefab, tooltipTransform);
            }
        }

        public void SetAndShowTooltip()
        {
            AudioManager.instance.PlaySFX("Aimed");
            _tooltip.SetActive(true);
            float cost = 0;
            string description = "";
            string abilityName = "";
            if (gameObject.TryGetComponent(out PassiveAbilities passive))
            {
                abilityName = passive.Name(gameObject.name);
                cost = passive.Cost(gameObject.name);
                description = passive.Description(gameObject.name);
            }
            else if (gameObject.TryGetComponent(out ActiveAbility active))
            {
                abilityName = active.Name();
                cost = active.Cost();
                description = active.Description();
            }
            else
            {
                Debug.Log("Couldn't find script");
            }
            
            _tooltip.GetComponent<Tooltip>().textComponent.text = $"{abilityName}\nСтоимость: {cost}\n{description}";
        }
        
        public void HideTooltip()
        {
            _tooltip.SetActive(false);
            _tooltip.GetComponent<Tooltip>().textComponent.text = string.Empty;
        }

        private void OnDestroy()
        {
            Destroy(_tooltip);
        }
    }
}