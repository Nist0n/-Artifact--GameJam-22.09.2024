using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class Victory : MonoBehaviour
{
    [SerializeField] private GameConfig gameConfig;
    [SerializeField] private GameObject victory;
    [SerializeField] private GameObject background;
    [SerializeField] private GameObject pauseButton;
    [SerializeField] private float timer;
    private bool GameRun = true;
    // Update is called once per frame
    void Update()
    {
        if(timer > 0) timer -= Time.deltaTime;
        if (gameConfig.EnemyList.Count <= 0 && GameRun && timer < 0) {
            GameRun = false;
            VictoryMode();  
        }
    }

    private void VictoryMode() {
        pauseButton.SetActive(!pauseButton.activeSelf);
        victory.SetActive(!victory.activeSelf);
    }
}
