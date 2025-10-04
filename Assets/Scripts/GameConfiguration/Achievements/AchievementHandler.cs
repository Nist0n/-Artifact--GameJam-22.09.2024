using System.Collections.Generic;
using GameConfiguration.SaveSystem;
using UnityEngine;

namespace GameConfiguration.Achievements
{
    public class AchievementHandler : MonoBehaviour
    {
        [SerializeField] private List<Achievement> achievements;

        private SaveAchievementValues _achievementSaver;
        private AchievementsData _achievementsData;

        private void Awake()
        {
            _achievementSaver = new SaveAchievementValues();
            AchievementsData loadedData = _achievementSaver.Load();
            if (loadedData == null)
            {
                Debug.Log("No data loaded");
                _achievementsData = new AchievementsData();
            }
            else
            {
                _achievementsData = loadedData;
            }
        }

        private void SaveData()
        {
            _achievementSaver.Save(_achievementsData);
        }
        
        public void OnEnemyDeath()
        {
            // kill 100 enemies
            _achievementsData.EnemiesKilledCounter++;
            SaveData();
            
            if (_achievementsData.EnemiesKilledCounter < 100)
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

        // dunno how to check for that for now
        // maybe every time a tower is upgraded check all its upgrades
        public void OnTowerUpgraded()
        {
            // if a tower has all possible upgrades (5 passives and 1 active)
            // check if achievement is already completed
            // if not, complete it
            // notify the player
        }

        public void OnLoss() // a basic event
        {
            // check if achievement is already completed
            // if not, complete it
            // notify the player
        }
    }
}