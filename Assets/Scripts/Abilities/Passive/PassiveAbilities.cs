using System.Collections.Generic;
using Towers;
using UnityEngine;
using UnityEngine.UIElements;

public class PassiveAbilities : MonoBehaviour
{
    public Tower tower;

    public GameObject ActiveAbil;

    [SerializeField] private FloatingTPS floatingTps;
    
    [SerializeField] private SpeedBoom speedBoom;
    
    [SerializeField] private SlowShit slowShit;

    [SerializeField] private DamageBoost damageBoost;
    
    [SerializeField] private FireBoost fireBoost;
    
    [SerializeField] private RangeGiga rangeGiga;

    public void SetTower(Tower tower)
    {
        this.tower = tower;
    }

    public float Cost(string name)
    {
        if (name.Contains("FloatingTPS"))
        {
            return floatingTps.Cost;
        }
        
        if (name.Contains("SlowShit"))
        {
            return slowShit.Cost;
        }
        
        if (name.Contains("SpeedBoom"))
        {
            return speedBoom.Cost;
        }
        
        if (name.Contains("DamageBoost"))
        {
            return damageBoost.Cost;
        }
        
        if (name.Contains("FireBoost"))
        {
            return fireBoost.Cost;
        }
        
        if (name.Contains("RangeGiga"))
        {
            return rangeGiga.Cost;
        }

        return 0;
    }

    public void SetAbility(GameObject abil)
    {
        this.ActiveAbil = abil;
    }
}
