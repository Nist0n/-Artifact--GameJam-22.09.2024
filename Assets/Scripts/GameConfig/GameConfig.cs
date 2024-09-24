using System;
using System.Collections.Generic;
using UnityEngine;

public abstract class GameConfig : MonoBehaviour
{
    public float GameTime;

    public List<GameObject> enemyList;

    private void Update()
    {
        GameTime += Time.deltaTime;
    }
    
    public void SetupInstances()
    {
        Spawner[] allchildSpawners = GetComponentsInChildren<Spawner>();
        foreach (Spawner spawner in allchildSpawners)
        {
            spawner.SetGameConfig(this);
        }
    }
}
