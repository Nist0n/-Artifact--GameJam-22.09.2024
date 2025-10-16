using System.Collections;
using GameConfiguration;
using GameConfiguration.Directors;
using GameConfiguration.Directors.Elites;
using GameConfiguration.Directors.Functions;
using UnityEngine;
using UnityEngine.Serialization;

namespace GameEvents.Timed.Events
{
	[CreateAssetMenu(menuName = "Timed Events/Elite Surge Event", fileName = "EliteSurgeEvent")]
	public class EliteSurgeEvent : TimedEvent
	{
		[Header("Elite Surge")]
		public DirectorCard MonsterCard;
		public EliteDef MonsterEliteDef;
		public int SpawnCount = 12;
		public float EliteValueMultiplier = 1.5f;

		public override IEnumerator Execute(TimedEventRuntime context)
		{
			var config = context.Config;
			if (!config || !MonsterCard)
			{
				yield break;
			}
			
			for (int i = 0; i < SpawnCount; i++)
			{
				Transform target = TakeRandomSpawnerTransform(config);
				if (!target)
				{
					yield return null;
					continue;
				}
				var request = new DirectorSpawnRequest(MonsterCard.spawnCard, MonsterEliteDef, EliteValueMultiplier);
				DirectorCore.instance.TrySpawnObjectWithEffect(request, target, null);
				yield return null;
			}
			
			float t = 0f;
			while (t < DefaultDuration)
			{
				t += Time.deltaTime;
				yield return null;
			}
		}

		private static Transform TakeRandomSpawnerTransform(GameConfig cfg)
		{
			if (cfg.Spawners == null || cfg.Spawners.Count == 0) return null;
			int idx = Random.Range(0, cfg.Spawners.Count);
			return cfg.Spawners[idx].transform;
		}
	}
}


