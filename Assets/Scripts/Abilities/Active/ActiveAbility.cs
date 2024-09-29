using System;
using UnityEngine;

public class ActiveAbility : MonoBehaviour
{
    [SerializeField] private AmberBomb amberBomb;
    [SerializeField] private SaphireBomb saphireBomb;
    [SerializeField] private EmeraldBomb emeraldBomb;
    [SerializeField] private DiamondBomb diamondBomb;
    [SerializeField] private RubyBomb rubyBomb;

    private const string Amber = "AmberBomb";
    private const string Saphire = "SaphireBomb";
    private const string Emerald = "EmeraldBomb";
    private const string Diamond = "DiamondBomb";
    private const string Ruby = "RubyBomb";

    public float Cost(string name)
    {
        if (name.Contains(Amber))
        {
            return amberBomb.Cost;
        }
        else if (name.Contains(Saphire))
        {
            return saphireBomb.Cost;
        }
        else if (name.Contains(Emerald))
        {
            return emeraldBomb.Cost;
        }
        else if (name.Contains(Ruby))
        {
            return rubyBomb.Cost;
        }
        else if (name.Contains(Diamond))
        {
            return diamondBomb.Cost;
        }

        return 0;
    }
    
    public float RangeOfAction(string name)
    {
        if (name.Contains(Amber))
        {
            return amberBomb.RangeOfAction;
        }
        else if (name.Contains(Saphire))
        {
            return saphireBomb.RangeOfAction;
        }
        else if (name.Contains(Emerald))
        {
            return emeraldBomb.RangeOfAction;
        }
        else if (name.Contains(Ruby))
        {
            return rubyBomb.RangeOfAction;
        }
        else if (name.Contains(Diamond))
        {
            return diamondBomb.RangeOfAction;
        }

        return 0;
    }

    public void ActivateAbilityRadius(string name, Vector3 pos)
    {
        if (name.Contains(Amber))
        {
            amberBomb.ActivateAbilityRadius(pos);
        }
        else if (name.Contains(Saphire))
        {
            saphireBomb.ActivateAbilityRadius(pos);
        }
        else if (name.Contains(Emerald))
        {
            emeraldBomb.ActivateAbilityRadius(pos);
        }
        else if (name.Contains(Ruby))
        {
            rubyBomb.ActivateAbilityRadius(pos);
        }
        else if (name.Contains(Diamond))
        {
            diamondBomb.ActivateAbilityRadius(pos);
        }
    }
    
    public void ActivateAbility(string name, Vector3 pos, GameObject abil)
    {
        if (name.Contains(Amber))
        {
            abil.GetComponent<AmberBomb>().ActivateAbility(pos);
        }
        else if (name.Contains(Saphire))
        {
            abil.GetComponent<SaphireBomb>().ActivateAbility(pos);
        }
        else if (name.Contains(Emerald))
        {
            abil.GetComponent<EmeraldBomb>().ActivateAbility(pos);
        }
        else if (name.Contains(Ruby))
        {
            abil.GetComponent<RubyBomb>().ActivateAbility(pos);
        }
        else if (name.Contains(Diamond))
        {
            abil.GetComponent<DiamondBomb>().ActivateAbility(pos);
        }
    }
    
    public bool IsAbilityUsed(string name)
    {
        if (name.Contains(Amber))
        {
            return amberBomb.IsAbilityUsed;
        }
        else if (name.Contains(Saphire))
        {
            return saphireBomb.IsAbilityUsed;
        }
        else if (name.Contains(Emerald))
        {
            return emeraldBomb.IsAbilityUsed;
        }
        else if (name.Contains(Ruby))
        {
            return rubyBomb.IsAbilityUsed;
        }
        else if (name.Contains(Diamond))
        {
            return diamondBomb.IsAbilityUsed;
        }

        return false;
    }
    
    public void ActionRadius(string name, GameObject radius)
    {
        if (name.Contains(Amber))
        {
            amberBomb.ActionRadius = radius;
        }
        else if (name.Contains(Saphire))
        {
            saphireBomb.ActionRadius = radius;
        }
        else if (name.Contains(Emerald))
        {
            emeraldBomb.ActionRadius = radius;
        }
        else if (name.Contains(Ruby))
        {
            rubyBomb.ActionRadius = radius;
        }
        else if (name.Contains(Diamond))
        {
            diamondBomb.ActionRadius = radius;
        }
    }
    
    public float Timer(string name)
    {
        if (name.Contains(Amber))
        {
            return amberBomb.Timer;
        }
        else if (name.Contains(Saphire))
        {
            return saphireBomb.Timer;
        }
        else if (name.Contains(Emerald))
        {
            return emeraldBomb.Timer;
        }
        else if (name.Contains(Ruby))
        {
            return rubyBomb.Timer;
        }
        else if (name.Contains(Diamond))
        {
            return diamondBomb.Timer;
        }

        return 0;
    }
    
    public float AbilityCooldown(string name)
    {
        if (name.Contains(Amber))
        {
            return amberBomb.AbilityCooldown;
        }
        else if (name.Contains(Saphire))
        {
            return saphireBomb.AbilityCooldown;
        }
        else if (name.Contains(Emerald))
        {
            return emeraldBomb.AbilityCooldown;
        }
        else if (name.Contains(Ruby))
        {
            return rubyBomb.AbilityCooldown;
        }
        else if (name.Contains(Diamond))
        {
            return diamondBomb.AbilityCooldown;
        }

        return 0;
    }
    
    public void ChangeAbilityCooldown(string name, float percent, GameObject abil)
    {
        if (name.Contains(Amber))
        {
            abil.GetComponent<AmberBomb>().AbilityCooldown *= percent;
        }
        else if (name.Contains(Saphire))
        {
            abil.GetComponent<SaphireBomb>().AbilityCooldown *= percent;
        }
        else if (name.Contains(Emerald))
        {
            abil.GetComponent<EmeraldBomb>().AbilityCooldown *= percent;
        }
        else if (name.Contains(Ruby))
        {
            abil.GetComponent<RubyBomb>().AbilityCooldown *= percent;
        }
        else if (name.Contains(Diamond))
        {
            abil.GetComponent<DiamondBomb>().AbilityCooldown *= percent;
        }
    }
}
