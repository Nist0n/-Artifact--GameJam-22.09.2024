using System;
using UnityEngine;

public class AmberBomb : ActiveAbility
{
    private void Start()
    {
        Timer = 45f;
        //Cost = 
    }

    private void Update()
    {
        CheckAbilityCooldown();
    }

    private void CheckAbilityCooldown()
    {
        if (IsAbilityUsed)
        {
            AbilityCooldown += Time.deltaTime;
            if (AbilityCooldown > Timer)
            {
                IsAbilityUsed = false;
                AbilityCooldown = 0;
            }
        }
    }
}
