using UnityEngine;

namespace GameConfiguration.Directors.Elites
{
	public abstract class EliteModifier : ScriptableObject
	{
		public virtual void OnApply(GameObject enemyRoot) {}
		public virtual void OnRemove(GameObject enemyRoot) {}
	}
}


