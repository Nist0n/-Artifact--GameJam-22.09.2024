using UnityEngine;

public class InGameSettings : MonoBehaviour
{
    [SerializeField] GameObject pauseButton;
    [SerializeField] GameObject pauseSettings;

    GamePause gamePaused = new GamePause();

    public void OpenSettings()
    {
        gamePaused.PauseGame();
        pauseButton.SetActive(false);
        pauseSettings.SetActive(true);
    }
}
