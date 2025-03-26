using System;
using System.Collections.Generic;
using SaveSystem;
using UnityEngine;

namespace Achievements
{
    public class AchievementHandler : MonoBehaviour
    {
        [SerializeField] private List<Achievement> achievements;

        private SaveAchievementValues _achievementSaver;
        private AchievementsData _achievementsData;
        
        // these should be saved
        // private int _enemiesKilledCounter;

        // private void Update()
        // {
        //     foreach (var achievement in achievements)
        //     {
        //         Debug.Log(achievement.Completed);
        //     }
        // }

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
                Debug.Log("Loaded data");
                _achievementsData = loadedData;
            }
        }

        private void SaveData()
        {
            _achievementSaver.Save(_achievementsData);
            Debug.Log("Saved achievement data");
        }
        
        public void OnEnemyDeath()
        {
            // kill 100 enemies
            // _enemiesKilledCounter++;
            _achievementsData.enemiesKilledCounter++;
            SaveData();
            Debug.Log(_achievementsData.enemiesKilledCounter);
            
            if (_achievementsData.enemiesKilledCounter < 100)
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