using UnityEngine;
using Towers;

namespace Combo
{
    /// <summary>
    /// Компонент для отслеживания того, какая башня убила моба
    /// Добавляется к каждому мобу при создании
    /// </summary>
    public class EnemyKillTrackerComponent : MonoBehaviour
    {
        public Tower LastHittingTower { get; private set; }
        public float LastHitTime { get; private set; }
        
        public void SetLastHittingTower(Tower tower)
        {
            LastHittingTower = tower;
            LastHitTime = Time.time;
        }
        
        public bool WasKilledByPlayerTower()
        {
            if (!LastHittingTower) return false;
            
            return LastHittingTower.Piloted;
        }
    }
}
