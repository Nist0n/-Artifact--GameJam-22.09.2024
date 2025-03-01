using System;
using System.Collections.Generic;
using UnityEngine;

namespace Achievements
{
    public class AchievementHandler : MonoBehaviour
    {
        [SerializeField] private List<Achievement> achievements;
        
        // these should be saved
        private int _enemyKilledCounter;

        // private void Update()
        // {
        //     foreach (var achievement in achievements)
        //     {
        //         Debug.Log(achievement.Completed);
        //     }
        // }

        public void OnEnemyDeath()
        {
            // kill 100 enemies
            _enemyKilledCounter++;
            if (_enemyKilledCounter < 100)
            {
                return;
            }
            
            Achievement achievement = achievements.Find(x => x.name.Contains("Kill 100 Enemies"));
            if (!achievement.Completed)
            {
                achievement.CompleteAchievement();
                // notify the player
                Debug.Log($"{achievement.name} was just completed!");
                // possibly also utilize events to UI to notify the player
            }
        }

        public void OnTowerUpgraded()
        {
            // if a tower has all possible upgrades (5 passives and 1 active)
            // check if achievement is already completed
            // if not, complete it
            // notify the player
        }

        public void OnLoss()
        {
            // check if achievement is already completed
            // if not, complete it
            // notify the player
        }
    }
}