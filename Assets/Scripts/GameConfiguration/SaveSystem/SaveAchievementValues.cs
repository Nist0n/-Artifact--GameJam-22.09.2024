using System;
using System.IO;
using Unity.VisualScripting;
using UnityEngine;

namespace SaveSystem
{
    public class SaveAchievementValues
    {
        // public static SaveAchievementValues Instance;
        
        private readonly string _savePath = Application.persistentDataPath +
                                            "/achievement-values.json";

        // private void Awake()
        // {
        //     if (Instance == null)
        //     {
        //         Instance = this;
        //         DontDestroyOnLoad(gameObject);
        //     }
        //     else
        //     {
        //         Destroy(gameObject);
        //     }
        //     
        //     
        // }

        public void Save(AchievementsData data)
        {
            string json = JsonUtility.ToJson(data, true);
            File.WriteAllText(_savePath, json);
        }

        public AchievementsData Load()
        {
            if (File.Exists(_savePath))
            {
                string json = File.ReadAllText(_savePath);
                return JsonUtility.FromJson<AchievementsData>(json);
            }

            return null;
        }
    }
}