using System;
using UnityEngine;

public class Spawner : MonoBehaviour
{
    private GameConfig _gameConfig;

    private void Start()
    {
        
    }

    public void SetGameConfig(GameConfig gameConfig)
    {
        _gameConfig = gameConfig;
    }
}
