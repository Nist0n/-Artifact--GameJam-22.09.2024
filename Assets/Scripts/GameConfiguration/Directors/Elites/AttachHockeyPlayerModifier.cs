using UnityEngine;

namespace GameConfiguration.Directors.Elites
{
    [CreateAssetMenu(menuName = "GameConfig/Directors/Elites/Modifiers/AttachHockeyPlayer", fileName = "AttachHockeyPlayerModifier")]
    public class AttachHockeyPlayerModifier : EliteModifier
    {
        public float TrailWidth = 1.8f;
        public float SpeedBoost = 1.5f;
        public float IceLifetime = 20f;
        public float MeltTime = 2f;
        public GameObject IceTrailPrefab;
        
        public override void OnApply(GameObject enemyRoot)
        {
            if (!enemyRoot) return;
            
            var hockeyPlayer = enemyRoot.AddComponent<HockeyPlayerElite>();
            
            hockeyPlayer.TrailWidth = TrailWidth;
            hockeyPlayer.SpeedBoost = SpeedBoost;
            hockeyPlayer.IceLifetime = IceLifetime;
            hockeyPlayer.IceTrailPrefab = IceTrailPrefab;
            
            hockeyPlayer.Initialize(enemyRoot);
        }
    }
}
