using System;
using System.Collections.Generic;
using Abilities.Active;
using Abilities.Passive;
using Towers;
using UnityEngine;
using UnityEngine.UI;

public class AbilitiesSlots : MonoBehaviour
{
    [SerializeField] private GameObject abilitiesObject;
    
    public bool HasActiveAbility = false;
    
    public List<GameObject> Abilities = new List<GameObject>(3);
    
    [SerializeField] private List<Image> imagePositions;

    private int _indexOfActiveAbility;

    private ActiveAbility _active;

    public GameObject Ability;

    public bool IsPassiveSetted = false;

    private PassiveAbilities PassAbility;

    private ImageCooldowns _imageCooldowns;

    public bool TowerSelected = false;

    public GameObject Circle;
    

    private void Update()
    {
        if (_active)
        {
            if (PassAbility) PassAbility.SetAbility(_active.gameObject);
            
            if (!_imageCooldowns)
            {
                _imageCooldowns = imagePositions[_indexOfActiveAbility].GetComponent<ImageCooldowns>();
            }
            if (TowerSelected)
            {
                _imageCooldowns.GetProperties(_active.Timer(_active.name), _active.AbilityCooldown(_active.name));
            }
        }

        else if (PassAbility != null)
        {
            PassAbility.SetAbility(null);
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
                PassAbility = ability.GetComponent<PassiveAbilities>();
            }
        }
    }

    public void SetAbilitiesImages()
    {
        for (int i = 0; i < Abilities.Count; i++)
        {
            if (Abilities[i].GetComponent<ActiveAbility>())
            {
                _indexOfActiveAbility = i;

                imagePositions[0].enabled = true;
                imagePositions[0].transform.parent.GetComponent<Image>().enabled = true;
                imagePositions[0].sprite = Abilities[i].GetComponent<Image>().sprite;
                imagePositions[0].transform.parent.GetComponent<Image>().sprite = Abilities[i].GetComponent<Image>().sprite;
            }

            if (Abilities[i].GetComponent<PassiveAbilities>())
            {
                if (!IsPassiveSetted)
                {
                    Debug.Log("WTF");
                    imagePositions[1].enabled = true;
                    imagePositions[1].transform.parent.GetComponent<Image>().enabled = true;
                    imagePositions[1].sprite = Abilities[i].GetComponent<Image>().sprite;
                    imagePositions[1].transform.parent.GetComponent<Image>().sprite = Abilities[i].GetComponent<Image>().sprite;
                    IsPassiveSetted = true;
                }
                else
                {
                    imagePositions[2].enabled = true;
                    imagePositions[2].transform.parent.GetComponent<Image>().enabled = true;
                    imagePositions[2].sprite = Abilities[i].GetComponent<Image>().sprite;
                    imagePositions[2].transform.parent.GetComponent<Image>().sprite = Abilities[i].GetComponent<Image>().sprite;
                }
            }
        }
    }

    public void HideAbilities()
    {
        for (int i = 0; i < 3; i++)
        {
            imagePositions[i].enabled = false;
            imagePositions[i].transform.parent.GetComponent<Image>().enabled = false;
            imagePositions[i].sprite = null;
            imagePositions[i].transform.parent.GetComponent<Image>().sprite = null;
        }

        IsPassiveSetted = false;
    }
}