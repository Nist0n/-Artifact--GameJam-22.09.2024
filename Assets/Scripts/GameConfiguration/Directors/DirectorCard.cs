using GameConfiguration.Cards;
using GameConfiguration.Directors.Elites;
using UnityEngine;

namespace GameConfiguration.Directors
{
    [CreateAssetMenu]
    public class DirectorCard : ScriptableObject
    {
        public SpawnCard spawnCard;
        
        public int SelectionWeight;
        public bool NoElites;
        public EliteTierDef[] AllowedEliteTiers;

        public int Cost => spawnCard.DirectorCreditCost;
    }
}
