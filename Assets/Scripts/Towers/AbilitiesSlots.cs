using System;
using System.Collections.Generic;
using Abilities.Active;
using Abilities.Passive;
using Towers;
using UnityEngine;
using UnityEngine.UI;

public class AbilitiesSlots : MonoBehaviour
{
    [SerializeField] private Image activeAbilityPosition;
    
    [SerializeField] private List<GameObject> imagePositions;

    [SerializeField] private GameObject passivesTransform;
    
    public List<GameObject> RandomActiveAbilities;
        
    public List<GameObject> RandomPassiveAbilities;
    
    public bool HasActiveAbility = false;
    
    public List<GameObject> Abilities;

    public GameObject Ability;

    public bool IsPassiveSetted = false;
    
    public bool TowerSelected = false;

    public GameObject Circle;

    public bool PassivesShowed = false;
    
    public bool ActivesShowed = false;

    private PassiveAbilities _passAbility;

    private ImageCooldowns _imageCooldowns;

    private ActiveAbility _active;


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

        else if (_passAbility != null)
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

        for (int i = 0; i < Abilities.Count; i++)
        {
            if (Abilities[i].GetComponent<ActiveAbility>())
            {
                activeAbilityPosition.enabled = true;
                activeAbilityPosition.transform.parent.GetComponent<Image>().enabled = true;
                activeAbilityPosition.sprite = Abilities[i].GetComponent<Image>().sprite;
                activeAbilityPosition.transform.parent.GetComponent<Image>().sprite = Abilities[i].GetComponent<Image>().sprite;
            }

            if (Abilities[i].GetComponent<PassiveAbilities>())
            {
                if (tempPassives.Count > 0)
                {
                    bool equal = false;
                    
                    foreach (var passive in tempPassives)
                    {
                        if (!Abilities[i].name.Contains(passive.name) && !equal)
                        {
                            equal = true;
                        }
                    }

                    if (equal)
                    {
                        tempPassives.Add(Abilities[i]);
                    }
                }
                else
                {
                    tempPassives.Add(Abilities[i]);
                }
            }
        }

        foreach (var passive in tempPassives)
        {
            GameObject temp = Instantiate(passive, passivesTransform.transform);
            imagePositions.Add(temp);
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
        
        imagePositions.Clear();

        IsPassiveSetted = false;
    }
}