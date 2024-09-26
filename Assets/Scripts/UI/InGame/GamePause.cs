using System.Collections;
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
    [SerializeField] CinemachineCamera cameraMain;
    [SerializeField] CinemachineCamera cameraShop;

    public static bool gameIsPaused;

    private void Update()
    {
        StartCoroutine(ShopSwitch());

        if (Input.GetKeyUp(KeyCode.Escape))
        {
            if (gameIsPaused)
            {
                gameIsPaused = !gameIsPaused;
                Time.timeScale = 0f;
                pauseButton.SetActive(!pauseButton.activeSelf);
                continueGameButton.SetActive(!continueGameButton.activeSelf);
                background.SetActive(!background.activeSelf);
            }
            if (!gameIsPaused)
            {
                gameIsPaused = !gameIsPaused;
                Time.timeScale = 1f;
                pauseButton.SetActive(!pauseButton.activeSelf);
                continueGameButton.SetActive(!continueGameButton.activeSelf);
                background.SetActive(!background.activeSelf);
            }
        }
        
        if (pauseButton.activeSelf)
        {
            if (pauseButton.GetComponent<Animator>().GetCurrentAnimatorClipInfo(0)[0].clip.name == "Selected")
            {
                Invoke("OpenSettings", 0.1f);
            }

        }

        if (continueGameButton.activeSelf)
        {
            if (continueGameButton.GetComponent<Animator>().GetCurrentAnimatorClipInfo(0)[0].clip.name == "Selected")
            {
                ResumeGame();
                Invoke("CloseSettings", 0.1f);
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

    public void CloseSettings()
    {
        pauseButton.SetActive(true);
        background.SetActive(false);
        continueGameButton.SetActive(false);
    }

    public void OpenSettings()
    {
        gameIsPaused = !gameIsPaused;
        PauseGame();
        pauseButton.SetActive(false);
        continueGameButton.SetActive(true);
        background.SetActive(true);
    }

    // private void EscapeSettings

    public void Quit()
    {
        SceneManager.LoadScene("UI VLAD");
        ResumeGame();
    }

    IEnumerator ShopSwitch()
    {
        if (Input.GetKeyDown(KeyCode.B) && cameraMain.IsLive && !gameIsPaused)
        {
            pauseButton.SetActive(!pauseButton.activeSelf);
            shopUI.SetActive(!shopUI.activeSelf);
            yield return new WaitForSeconds(1f);
        }
        else if (Input.GetKeyDown(KeyCode.B) && cameraShop.IsLive && !gameIsPaused)
        {
            pauseButton.SetActive(!pauseButton.activeSelf);
            shopUI.SetActive(!shopUI.activeSelf);
            yield return new WaitForSeconds(1f);
        }
    }
}
