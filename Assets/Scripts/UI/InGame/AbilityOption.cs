using UnityEngine;

namespace UI.InGame
{
    public class AbilityOption : MonoBehaviour
    {
        [SerializeField] private GameObject prefab;

        public GameObject Prefab => prefab;

        public void SetPrefab(GameObject abilityPrefab)
        {
            prefab = abilityPrefab;
        }

        public void Clear()
        {
            prefab = null;
        }
    }
}


