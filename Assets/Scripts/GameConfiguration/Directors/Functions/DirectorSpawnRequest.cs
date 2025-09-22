using GameConfiguration.Cards;

namespace GameConfiguration.Directors.Functions
{
    public class DirectorSpawnRequest
    {
        public readonly SpawnCard SpawnCardObject;

        public DirectorSpawnRequest(SpawnCard spawnCard)
        {
            SpawnCardObject = spawnCard;
        }
    }
}
