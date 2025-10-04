using GameConfiguration.Settings.Audio;
using Towers.Abilities.Active;
using Towers.Abilities.Passive;
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
            AudioManager.Instance.PlaySFX("Aimed");
            _tooltip.SetActive(true);
            float cost = 0;
            string description = "";
            string abilityName = "";
            if (gameObject.TryGetComponent(out PassiveAbilities passive))
            {
                abilityName = passive.Name();
                cost = passive.Cost();
                description = passive.Description();
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
            
            _tooltip.GetComponent<Tooltip>().TextComponent.text = $"{abilityName}\nСтоимость: {cost}\n{description}";
        }
        
        public void HideTooltip()
        {
            _tooltip.SetActive(false);
            _tooltip.GetComponent<Tooltip>().TextComponent.text = string.Empty;
        }

        private void OnDestroy()
        {
            Destroy(_tooltip);
        }
    }
}