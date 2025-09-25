using System.Collections.Generic;
using UnityEngine;

namespace GameConfiguration.Directors.Elites
{
    [CreateAssetMenu(menuName = "GameConfig/Directors/Elites/EliteTierDef", fileName = "EliteTierDef")]
    public class EliteTierDef : ScriptableObject
    {
        public float CostMultiplier = 6f;
        public List<EliteDef> EliteTypes = new List<EliteDef>();
        public bool CanSelectWithoutAvailableEliteDef = false;

        public bool CanSelect()
        {
            if (CanSelectWithoutAvailableEliteDef) return true;
            foreach (var elite in EliteTypes)
            {
                if (elite && elite.IsAvailable()) return true;
            }
            return false;
        }

        public EliteDef GetRandomAvailableEliteDef()
        {
            var available = new List<EliteDef>();
            foreach (var elite in EliteTypes)
            {
                if (elite && elite.IsAvailable()) available.Add(elite);
            }
            if (available.Count == 0) return null;
            int idx = Random.Range(0, available.Count);
            return available[idx];
        }
    }
}


