using UnityEngine;

namespace Achievements
{
    [CreateAssetMenu(menuName = "Achievement")]
    public class Achievement : ScriptableObject
    {
        public bool Completed
        { get; private set; }

        public void CompleteAchievement()
        {
            Completed = true;
        }
    }
}