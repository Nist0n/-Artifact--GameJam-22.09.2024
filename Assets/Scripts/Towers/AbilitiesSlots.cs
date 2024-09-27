using System;
using System.Collections.Generic;
using UnityEngine;

public class AbilitiesSlots : MonoBehaviour
{
    public bool HasActiveAbility = false;
    
    public List<GameObject> Abilities = new List<GameObject>(3);
    
    [SerializeField] private List<RectTransform> _screenPositions;

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
}