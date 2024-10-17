using System;
using Abilities.Active;
using Abilities.Passive;
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
            _tooltip.SetActive(true);
            float cost = 0;
            string description = "";
            string name = "";
            if (gameObject.TryGetComponent(out PassiveAbilities passive))
            {
                name = passive.Name(gameObject.name);
                cost = passive.Cost(gameObject.name);
                description = passive.Description(gameObject.name);
            }
            else if (gameObject.TryGetComponent(out ActiveAbility active))
            {
                name = active.Name(gameObject.name);
                cost = active.Cost(gameObject.name);
                description = active.Description(gameObject.name);
            }
            else
            {
                Debug.Log("Couldn't find script");
            }
            
            _tooltip.GetComponent<Tooltip>().textComponent.text = $"{name}\nСтоимость: {cost}\n{description}";
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