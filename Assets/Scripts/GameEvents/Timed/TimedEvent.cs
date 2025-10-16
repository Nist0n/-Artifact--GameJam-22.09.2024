using System.Collections;
using GameConfiguration;
using UnityEngine;

namespace GameEvents.Timed
{
	public abstract class TimedEvent : ScriptableObject
	{
		[Header("Identification")]
		public string EventId;
		public string DisplayName;
		
		[TextArea]
		public string Description;

		[Header("Selection & Gating")]
		public float MinDifficulty = 1f;
		public float MaxDifficulty = 0f;
		[Range(0f, 1f)] public float SelectionWeight = 1f;

		[Header("Timing")]
		public float DefaultDuration = 20f;

		public virtual bool IsEligible(GameConfig config)
		{
			if (!config) return false;
			float difficulty = config.GameDifficulty;
			if (difficulty < MinDifficulty) return false;
			if (MaxDifficulty > 0f && difficulty > MaxDifficulty) return false;
			return true;
		}

		public abstract IEnumerator Execute(TimedEventRuntime context);
		public virtual void Revert(TimedEventRuntime context) {}
	}

	public sealed class TimedEventRuntime
	{
		public readonly GameObject Owner;
		public readonly GameConfig Config;

		public TimedEventRuntime(GameObject owner, GameConfig config)
		{
			Owner = owner;
			Config = config;
		}
	}
}


