using UnityEngine;
using UnityEngine.UIElements;

public class InGameSettings : MonoBehaviour
{
    [SerializeField] GameObject pauseButton;
    [SerializeField] GameObject background;

    GamePause gamePaused = new GamePause();
    
    public void OpenSettings()
    {
        GamePause.gameIsPaused = true;
        gamePaused.PauseGame();
        pauseButton.SetActive(false);
        background.SetActive(true);
    }
}
