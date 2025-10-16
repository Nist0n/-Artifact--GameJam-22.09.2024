using System.Collections;
using GameConfiguration;
using UnityEngine;

namespace GameEvents.Timed.Events
{
	[CreateAssetMenu(menuName = "Timed Events/Global Enemy Speed", fileName = "GlobalEnemySpeedEvent")]
	public class GlobalEnemySpeedEvent : TimedEvent
	{
		[Header("Speed Modifier")]
		[Tooltip("Speed multiplier applied to navmesh speed via Core.Slowness inverse.")]
		public float SpeedMultiplier = 1.3f;

		public override IEnumerator Execute(TimedEventRuntime context)
		{
			var cfg = context.Config;
			if (!cfg) yield break;

			Apply(cfg);
			float t = 0f;
			while (t < DefaultDuration)
			{
				t += Time.deltaTime;
				yield return null;
			}
		}

		public override void Revert(TimedEventRuntime context)
		{
			var cfg = context.Config;
			if (!cfg) return;
			Reset(cfg);
		}

		private void Apply(GameConfig cfg)
		{
			var enemies = cfg.EnemyList;
			if (enemies == null) return;
			for (int i = 0; i < enemies.Count; i++)
			{
				if (!enemies[i]) continue;
				var core = enemies[i].GetComponentInChildren<Enemies.StateMachine.Core>();
				if (!core) continue;
				core.Speed *= Mathf.Max(0.1f, SpeedMultiplier);
			}
		}

		private void Reset(GameConfig cfg)
		{
			var enemies = cfg.EnemyList;
			if (enemies == null) return;
			float inverse = 1f / Mathf.Max(0.1f, SpeedMultiplier);
			for (int i = 0; i < enemies.Count; i++)
			{
				if (!enemies[i]) continue;
				var core = enemies[i].GetComponentInChildren<Enemies.StateMachine.Core>();
				if (!core) continue;
				core.Speed *= inverse;
			}
		}
	}
}


