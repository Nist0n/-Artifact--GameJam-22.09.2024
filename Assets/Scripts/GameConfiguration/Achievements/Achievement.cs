using UnityEngine;

namespace GameConfiguration.Achievements
{
    [CreateAssetMenu(menuName = "Achievement")]
    public class Achievement : ScriptableObject
    {
        [field: SerializeField]
        public bool Completed
        { get; private set; }

        public void CompleteAchievement()
        {
            Completed = true;
        }
    }
}