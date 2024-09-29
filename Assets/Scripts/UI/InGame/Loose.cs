using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class Loose : MonoBehaviour
{
    [SerializeField] private GameObject loose;
    [SerializeField] private GameObject background;
    [SerializeField] private GameObject pauseButton;
    [SerializeField] private GameObject dreams;
    [SerializeField] private GameObject bar;
    private bool GameRun = true;
    // Update is called once per frame
    void Update()
    {
        if (GameConfig.Instance.GameIsOverByLose && GameRun) {
            GameRun = false;
            LooseMode();
        }
    }

    private void LooseMode() {
        pauseButton.SetActive(!pauseButton.activeSelf);
        loose.SetActive(!loose.activeSelf);
        bar.SetActive(!bar.activeSelf);
        dreams.SetActive(!dreams.activeSelf);
    }
}