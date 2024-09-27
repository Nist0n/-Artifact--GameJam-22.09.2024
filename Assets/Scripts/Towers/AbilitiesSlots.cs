using System;
using System.Collections.Generic;
using UnityEngine;

public class AbilitiesSlots : MonoBehaviour
{
    public bool HasActiveAbility = false;
    
    public List<GameObject> Abilities = new List<GameObject>(3);
    
    [SerializeField] private List<RectTransform> _screenPositions;
    
    public void CheckForActiveAbility()
    {
        foreach (GameObject ability in Abilities)
        {
            if (ability.GetComponent<ActiveAbility>())
            {
                HasActiveAbility = true;
            }
        }
    }
}