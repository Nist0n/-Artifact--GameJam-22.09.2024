using System.IO;
using UnityEngine;

namespace GameConfiguration.SaveSystem
{
    public class SaveAchievementValues
    {
        private readonly string _savePath = Application.persistentDataPath +
                                            "/achievement-values.json";

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