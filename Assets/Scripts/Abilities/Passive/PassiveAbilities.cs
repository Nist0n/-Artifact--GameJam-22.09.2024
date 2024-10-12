using Towers;
using UnityEngine;

namespace Abilities.Passive
{
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
        
        private const string FireBoost = "FireBoost";
        
        private const string RangeGiga = "RangeGiga";
        
        private const string DamageBoost = "DamageBoost";
        
        private const string FloatingTps = "FloatingTPS";
        
        private const string SlowShit = "SlowShit";
        
        private const string SpeedBoom = "SpeedBoom";

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
        
        public void Count(string name, int count)
        {
            if (name.Contains(FloatingTps))
            {
                floatingTps.Count += count;
            }
            else if (name.Contains(FireBoost))
            {
                fireBoost.Count += count;
            }
            else if (name.Contains(RangeGiga))
            {
                rangeGiga.Count += count;
            }
            else if (name.Contains(DamageBoost))
            {
                damageBoost.Count += count;
            }
            else if (name.Contains(SlowShit))
            {
                slowShit.Count += count;
            }
            else if (name.Contains(SpeedBoom))
            {
                speedBoom.Count += count;
            }
        }
        
        public void ClearCount(string name)
        {
            if (name.Contains(FloatingTps))
            {
                floatingTps.Count = 1;
            }
            else if (name.Contains(FireBoost))
            {
                fireBoost.Count = 1;
            }
            else if (name.Contains(RangeGiga))
            {
                rangeGiga.Count = 1;
            }
            else if (name.Contains(DamageBoost))
            {
                damageBoost.Count = 1;
            }
            else if (name.Contains(SlowShit))
            {
                slowShit.Count = 1;
            }
            else if (name.Contains(SpeedBoom))
            {
                speedBoom.Count = 1;
            }
        }

        public string Description(string abilityName)
        {
            if (name.Contains("FloatingTPS"))
            {
                return floatingTps.Description;
            }
        
            if (name.Contains("SlowShit"))
            {
                return slowShit.Description;
            }
        
            if (name.Contains("SpeedBoom"))
            {
                return speedBoom.Description;
            }
        
            if (name.Contains("DamageBoost"))
            {
                return damageBoost.Description;
            }
        
            if (name.Contains("FireBoost"))
            {
                return fireBoost.Description;
            }
        
            if (name.Contains("RangeGiga"))
            {
                return rangeGiga.Description;
            }

            return "Error! You were not meant to see this";
        }
    
        public void SetAbility(GameObject abil)
        {
            this.ActiveAbil = abil;
        }
    }
}
