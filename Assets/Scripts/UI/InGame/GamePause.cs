using Towers;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GamePause : MonoBehaviour
{
    [SerializeField] GameObject pauseButton;
    [SerializeField] GameObject background;
    [SerializeField] GameObject continueGameButton;
    [SerializeField] GameObject shopUI;
    [SerializeField] CinemachineCamera camera;

    public static bool gameIsPaused;

    private void Update()
    {
        if(Input.GetKeyDown(KeyCode.Escape))
        {
            gameIsPaused = !gameIsPaused;
            PauseGame();
            pauseButton.SetActive(!pauseButton.activeSelf);
            background.SetActive(!background.activeSelf);
        }

        if (Input.GetKeyDown(KeyCode.B) && camera.IsLive && !gameIsPaused)
        {
            Invoke("ShopSwitch", 1f);
        }

        if (pauseButton.activeSelf)
        {
            if (pauseButton.GetComponent<Animator>().GetCurrentAnimatorClipInfo(0)[0].clip.name == "Selected")
            {
                Invoke("OpenSettings", 0.2f);
            }

        }
        if (background.activeSelf)
        {
            if (continueGameButton.GetComponent<Animator>().GetCurrentAnimatorClipInfo(0)[0].clip.name == "Selected")
            {
                Debug.Log("Workaet");
                Invoke("CloseSettings", 0.2f);
            }
        }
    }

    public void PauseGame()
    {
        if (gameIsPaused)
        {
            Time.timeScale = 0f;
        }
        else
        {
            Time.timeScale = 1;
        }
    }
    public void ResumeGame()
    {
        Time.timeScale = 1;
    }

    public void ShopSwitch()
    {
        pauseButton.SetActive(!pauseButton.activeSelf);
        shopUI.SetActive(!shopUI.activeSelf);
    }

    public void OpenSettings()
    {
        gameIsPaused = !gameIsPaused;
        PauseGame();
        pauseButton.SetActive(false);
        background.SetActive(true);
    }

    public void CloseSettings()
    {
        Debug.Log("Workaet2");
        ResumeGame();
        pauseButton.SetActive(true);
        background.SetActive(false);
    }

    public void Quit()
    {
        SceneManager.LoadScene("UI VLAD");
        ResumeGame();
    }
}
