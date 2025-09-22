using GameConfiguration.Cards;
using UnityEngine;

namespace GameConfiguration.Directors
{
    [CreateAssetMenu]
    public class DirectorCard : ScriptableObject
    {
        public SpawnCard spawnCard;
        
        public int SelectionWeight;

        public int Cost => spawnCard.DirectorCreditCost;
    }
}
