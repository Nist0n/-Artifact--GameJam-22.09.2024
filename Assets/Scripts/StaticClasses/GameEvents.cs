using System;
using UnityEngine;

namespace StaticClasses
{
    public static class GameEvents
    {
        public static Action<bool> GamePause;

        public static void OnGamePause(bool var)
        {
            GamePause?.Invoke(var);
        }
        
    }
}
