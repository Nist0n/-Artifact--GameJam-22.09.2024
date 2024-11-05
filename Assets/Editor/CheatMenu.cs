using System;
using UI.InGame;
using UnityEditor;

namespace Editor
{
    public static class CheatMenu
    {
        [MenuItem("Cheats/Add Max Dreams")]
        public static void AddMaxDreams()
        {
            SoulsCounter.Instance.Dreams += int.MaxValue;
        }
    }
}
