using System;
using UnityEngine;

public class AmberBomb : ActiveAbility
{
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

    public void ActivateAbility(Vector3 pos)
    {
        IsAbilityUsed = true;
    }
}
