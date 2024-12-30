using System;
using UnityEngine;

namespace StaticClasses
{
    public static class GameEvents
    {
        public static Action<bool> GamePause;

        public static Action CheatGameWin;

        public static void OnGamePause(bool var)
        {
            GamePause?.Invoke(var);
        }

        public static void OnCheatGameWin()
        {
            CheatGameWin?.Invoke();
        }
    }
}
