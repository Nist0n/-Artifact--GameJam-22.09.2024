using UnityEngine;

namespace GameConfiguration.Directors.Elites
{
	[CreateAssetMenu(menuName = "GameConfig/Directors/Elites/Modifiers/AttachAbilityPrefab", fileName = "AttachAbilityPrefabModifier")]
	public class AttachAbilityPrefabModifier : EliteModifier
	{
		public GameObject AbilityPrefab;
		public bool ParentToEnemy = true;
		public Vector3 LocalPosition;
		public Vector3 LocalEulerAngles;

		public override void OnApply(GameObject enemyRoot)
		{
			if (!AbilityPrefab || !enemyRoot) return;
			var instance = Object.Instantiate(AbilityPrefab);
			if (ParentToEnemy) instance.transform.SetParent(enemyRoot.transform, false);
			instance.transform.localPosition = LocalPosition;
			instance.transform.localRotation = Quaternion.Euler(LocalEulerAngles);
			var ability = instance.GetComponent<EliteAbility>();
			if (ability) ability.Initialize(enemyRoot);
		}
	}
}


