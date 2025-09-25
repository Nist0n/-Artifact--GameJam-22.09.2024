using UnityEngine;

namespace GameConfiguration.Directors.Elites
{
    [CreateAssetMenu(menuName = "GameConfig/Directors/Elites/EliteDef", fileName = "EliteDef")]
    public class EliteDef : ScriptableObject
    {
        public Color TintColor = Color.white;
        public float HealthBoostCoefficient = 1f;
        public float DamageBoostCoefficient = 1f;
        public Material OverrideMaterial;

        public bool IsAvailable()
        {
            return true;
        }
    }
}


