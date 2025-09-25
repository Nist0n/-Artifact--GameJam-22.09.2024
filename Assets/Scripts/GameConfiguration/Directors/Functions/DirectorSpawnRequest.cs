using GameConfiguration.Cards;
using GameConfiguration.Directors.Elites;

namespace GameConfiguration.Directors.Functions
{
    public class DirectorSpawnRequest
    {
        public readonly SpawnCard SpawnCardObject;
        public readonly EliteDef Elite;
        public readonly float EliteValueMultiplier;

        public DirectorSpawnRequest(SpawnCard spawnCard, EliteDef elite = null, float eliteValueMultiplier = 1f)
        {
            SpawnCardObject = spawnCard;
            Elite = elite;
            EliteValueMultiplier = eliteValueMultiplier;
        }
    }
}
