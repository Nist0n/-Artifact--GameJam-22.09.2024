using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class AbilitiesSlots : MonoBehaviour
{
    [SerializeField] private GameObject abilitiesObject;
    
    public bool HasActiveAbility = false;
    
    public List<GameObject> Abilities = new List<GameObject>(3);
    
    [SerializeField] private List<Image> imagePositions;

    public GameObject Ability;

    [ContextMenu("CheckForAbility")]
    public void CheckForActiveAbility()
    {
        foreach (GameObject ability in Abilities)
        {
            Ability = ability;
            HasActiveAbility = true;
        }
    }

    public void SetAbilitiesImages()
    {
        for (int i = 0; i < Abilities.Count; i++)
        {
            imagePositions[i].sprite = Abilities[i].GetComponent<Image>().sprite;
        }
        
        abilitiesObject.SetActive(true);
    }

    public void HideAbilities()
    {
        abilitiesObject.SetActive(false);
    }
}