using UnityEngine;

public class ContinueGame : MonoBehaviour
{
    [SerializeField] GameObject pauseButton;
    [SerializeField] GameObject background;

    GamePause gamePaused = new GamePause();

    public void CloseSettings()
    {
        GamePause.gameIsPaused = !GamePause.gameIsPaused;
        gamePaused.ResumeGame();
        pauseButton.SetActive(true);
        background.SetActive(false);
    }
}
