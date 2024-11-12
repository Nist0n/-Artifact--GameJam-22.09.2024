using System.Collections.Generic;
using Abilities.Active;
using Abilities.Passive;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Towers
{
    public class AbilitiesSlots : MonoBehaviour
    {
        [SerializeField] private Image activeAbilityPosition;
    
        [SerializeField] private List<GameObject> imagePositions;

        [SerializeField] private GameObject passivesTransform;

        [SerializeField] private GameObject imageBackgroundPrefab;
        
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

        private PassiveAbilities _passAbility;

        private ImageCooldowns _imageCooldowns;

        private ActiveAbility _active;

        private Dictionary<string, int> _myDict;


        private void Update()
        {
            if (_active)
            {
                if (_passAbility) _passAbility.SetAbility(_active.gameObject);
            
                if (!_imageCooldowns)
                {
                    _imageCooldowns = activeAbilityPosition.GetComponent<ImageCooldowns>();
                }
                if (TowerSelected)
                {
                    _imageCooldowns.GetProperties(_active.Timer(_active.name), _active.AbilityCooldown(_active.name));
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
                    activeAbilityPosition.enabled = true;
                    activeAbilityPosition.transform.parent.GetComponent<Image>().enabled = true;
                    activeAbilityPosition.sprite = ability.GetComponent<Image>().sprite;
                    activeAbilityPosition.transform.parent.GetComponent<Image>().sprite = Resources.Load<Sprite>("UI/ability-bg");
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
                                passive.GetComponent<PassiveAbilities>().Count(passive.name, 1);
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
                passiveAbility.GetComponent<PassiveAbilities>().DisableAbility(passive.name);
                passiveAbility.GetComponent<EventTrigger>().enabled = false;
                imagePositions.Add(background);
            }
        }

        public void HideAbilities()
        {
            activeAbilityPosition.enabled = false;
            activeAbilityPosition.transform.parent.GetComponent<Image>().enabled = false;
            activeAbilityPosition.sprite = null;
            activeAbilityPosition.transform.parent.GetComponent<Image>().sprite = null;

            foreach (var image in imagePositions)
            {
                Destroy(image);
            }

            foreach (var ability in Abilities)
            {
                if (ability.GetComponent<PassiveAbilities>())
                {
                    ability.GetComponent<PassiveAbilities>().ClearCount(ability.name);
                }
            }
        
            imagePositions.Clear();

            IsPassiveSet = false;
        }
    }
}