using System;
using UnityEngine;

public class EmeraldBomb : ActiveAbility
{
    private void Update()
    {
        CheckAbilityCooldown();
    }
}
