using System;
using System.Collections.Generic;
using GameEvents.Timed.Events;
using Towers.Abilities.Active;
using Towers.Abilities.Passive;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Towers
{
    public class AbilitiesSlots : MonoBehaviour
    {
        [SerializeField] private List<GameObject> imagePositions;
        [SerializeField] private GameObject passivesTransform;
        [SerializeField] private GameObject imageBackgroundPrefab;
        [SerializeField] private Image abilityDisabled;
        
        private PassiveAbilities _passAbility;
        private ImageCooldowns _imageCooldowns;
        private ActiveAbility _active;
        private Dictionary<string, int> _myDict;
        
        public List<GameObject> RandomActiveAbilities;
        public List<GameObject> RandomPassiveAbilities;
        public bool HasActiveAbility = false;
        public bool CanUseActiveAbility = true;
        public List<GameObject> Abilities;
        public GameObject Ability;
        public bool IsPassiveSet = false;
        public bool TowerSelected = false;
        public GameObject Circle;
        public bool PassivesShowed = false;
        public bool ActivesShowed = false;

        private void OnEnable()
        {
            TowerAbilitiesDisableEvent.HandleAbilityUse += HandleActiveAbilityUsing;
        }

        private void OnDisable()
        {
            TowerAbilitiesDisableEvent.HandleAbilityUse -= HandleActiveAbilityUsing;
        }

        private void Start()
        {
            _imageCooldowns = FindAnyObjectByType<ImageCooldowns>();
        }

        private void Update()
        {
            if (_active && TowerSelected)
            {
                if (_passAbility) _passAbility.SetAbility(_active.gameObject);
                _imageCooldowns.GetProperties(_active.Timer(), _active.AbilityCooldown());
            }
            else if (_passAbility)
            {
                _passAbility.SetAbility(null);
            }
        }


        [ContextMenu("CheckForAbility")]
        public void CheckForActiveAbility()
        {
            foreach (GameObject ability in Abilities)
            {
                if (ability.GetComponent<ActiveAbility>())
                {
                    Ability = ability;
                    HasActiveAbility = true;
                    _active = Ability.GetComponent<ActiveAbility>();
                }
                else
                {
                    ability.GetComponent<PassiveAbilities>().SetTower(GetComponent<Tower>());
                }

                if (ability.name.Contains("SpeedBoom"))
                {
                    _passAbility = ability.GetComponent<PassiveAbilities>();
                    ability.GetComponent<PassiveAbilities>().SetTower(GetComponent<Tower>());
                }
            }
        }

        public void SetAbilitiesImages()
        {
            Dictionary<string, (GameObject prefab, int count) > grouped = new Dictionary<string, (GameObject prefab, int count)>();

            foreach (var ability in Abilities)
            {
                var active = ability.GetComponent<ActiveAbility>();
                if (active)
                {
                    if (!CanUseActiveAbility) abilityDisabled.enabled = true;
                    _imageCooldowns.AbilityImage.enabled = true;
                    _imageCooldowns.ParentImage.enabled = true;
                    _imageCooldowns.AbilityImage.sprite = ability.GetComponent<Image>().sprite;
                    _imageCooldowns.ParentImage.sprite = Resources.Load<Sprite>("UI/ability-bg");
                    _imageCooldowns.TextTimer.enabled = true;
                    continue;
                }

                var passive = ability.GetComponent<PassiveAbilities>();
                if (!passive) continue;

                string key = passive.Name();
                if (string.IsNullOrEmpty(key))
                {
                    key = ability.name;
                }

                if (grouped.TryGetValue(key, out var entry))
                {
                    grouped[key] = (entry.prefab, entry.count + 1);
                }
                else
                {
                    grouped[key] = (ability, 1);
                }
            }

            foreach (var kv in grouped)
            {
                GameObject background = Instantiate(imageBackgroundPrefab, passivesTransform.transform);
                var passiveAbility = Instantiate(kv.Value.prefab, background.transform);
                var pa = passiveAbility.GetComponent<PassiveAbilities>();
                pa.DisableAbility();
                var evt = passiveAbility.GetComponent<EventTrigger>();
                if (evt) evt.enabled = false;
                int extra = Mathf.Max(0, kv.Value.count - 1);
                if (extra > 0)
                {
                    pa.Count(extra);
                    pa.SetTower(GetComponent<Tower>());
                }
                imagePositions.Add(background);
            }
        }

        public void HideAbilities()
        {
            abilityDisabled.enabled = false;
            _imageCooldowns.AbilityImage.enabled = false;
            _imageCooldowns.ParentImage.enabled = false;
            _imageCooldowns.AbilityImage.sprite = null;
            _imageCooldowns.ParentImage.sprite = null;
            _imageCooldowns.TextTimer.enabled = false;

            foreach (var image in imagePositions)
            {
                Destroy(image);
            }

            foreach (var ability in Abilities)
            {
                if (ability.GetComponent<PassiveAbilities>())
                {
                    ability.GetComponent<PassiveAbilities>().ClearCount();
                }
            }
        
            imagePositions.Clear();

            IsPassiveSet = false;
        }

        public void UpdateAbilityUI()
        {
            if (_active)
            {
                _imageCooldowns.GetProperties(_active.Timer(), _active.AbilityCooldown());
            }
        }

        public void ClearActiveAbility()
        {
            Abilities.Remove(Ability);
            Destroy(Ability);
            _active = null;
            ActivesShowed = false;
            RandomActiveAbilities.Clear();
            Ability = null;
            HasActiveAbility = false;
        }

        private void HandleActiveAbilityUsing(bool abilityCondition)
        {
            if (TowerSelected) abilityDisabled.enabled = !abilityCondition;
            CanUseActiveAbility = abilityCondition;
            abilityDisabled.gameObject.SetActive(!abilityCondition);
        }
    }
}