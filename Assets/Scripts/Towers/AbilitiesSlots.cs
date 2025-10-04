using System;
using System.Collections.Generic;
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
        
        private PassiveAbilities _passAbility;
        private ImageCooldowns _imageCooldowns;
        private ActiveAbility _active;
        private Dictionary<string, int> _myDict;
        private Image _activeAbilityPosition;
        
        public List<GameObject> RandomActiveAbilities;
        public List<GameObject> RandomPassiveAbilities;
        public bool HasActiveAbility = false;
        public List<GameObject> Abilities;
        public GameObject Ability;
        public bool IsPassiveSet = false;
        public bool TowerSelected = false;
        public GameObject Circle;
        public bool PassivesShowed = false;
        public bool ActivesShowed = false;

        private void Start()
        {
            _imageCooldowns = FindAnyObjectByType<ImageCooldowns>();
            _activeAbilityPosition = FindAnyObjectByType<ImageCooldowns>().gameObject.GetComponent<Image>();
        }

        private void Update()
        {
            if (_active)
            {
                if (_passAbility) _passAbility.SetAbility(_active.gameObject);

                if (TowerSelected)
                {
                    _imageCooldowns.GetProperties(_active.Timer(), _active.AbilityCooldown());
                }
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
                }
            }
        }

        public void SetAbilitiesImages()
        {
            List<GameObject> tempPassives = new List<GameObject>();

            foreach (var ability in Abilities)
            {
                if (ability.GetComponent<ActiveAbility>())
                {
                    _activeAbilityPosition.enabled = true;
                    _imageCooldowns.ParentImage.enabled = true;
                    _activeAbilityPosition.sprite = ability.GetComponent<Image>().sprite;
                    _imageCooldowns.ParentImage.sprite = Resources.Load<Sprite>("UI/ability-bg");
                    _imageCooldowns.TextTimer.enabled = true;
                }

                if (ability.GetComponent<PassiveAbilities>())
                {
                    if (tempPassives.Count > 0)
                    {
                        bool equal = false;

                        bool foundSample = false;
                    
                        foreach (var passive in tempPassives)
                        {
                            if (!ability.name.Contains(passive.name) && !foundSample)
                            {
                                equal = true;
                            }

                            if (ability.name.Contains(passive.name))
                            {
                                equal = false;
                                foundSample = true;
                                passive.GetComponent<PassiveAbilities>().Count(1);
                            }
                        }

                        if (equal)
                        {
                            tempPassives.Add(ability);
                        }
                    }
                    else
                    {
                        tempPassives.Add(ability);
                    }
                }
            }

            foreach (var passive in tempPassives)
            {
                GameObject background = Instantiate(imageBackgroundPrefab, passivesTransform.transform);
                var passiveAbility = Instantiate(passive, background.transform);
                passiveAbility.GetComponent<PassiveAbilities>().DisableAbility();
                passiveAbility.GetComponent<EventTrigger>().enabled = false;
                imagePositions.Add(background);
            }
        }

        public void HideAbilities()
        {
            _activeAbilityPosition.enabled = false;
            _imageCooldowns.ParentImage.enabled = false;
            _activeAbilityPosition.sprite = null;
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
    }
}