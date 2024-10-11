using System.Collections;
using Abilities.Active;
using Abilities.Passive;
using Shop;
using Sound;
using Towers;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GamePause : MonoBehaviour
{
    public static GamePause Instance;
    
    [SerializeField] GameObject background;
    [SerializeField] GameObject continueGameButton;

    public bool gameIsPaused;

    private void Start()
    {
        AudioManager.instance.PlayMusic("InGame2");
    }

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
        }
        else
        {
            Destroy(gameObject);
        }
    }

    private void Update()
    {
        if (Input.GetKeyUp(KeyCode.Escape))
        {
            if (!background.activeSelf)
            {
                PauseGame();
            }
            else
            {
                ResumeGame();
            }
        }
    }
    
    public void RestartGame()
    { 
        ResumeGame();
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
    }

    public void PauseGame()
    {
        Time.timeScale = 0f;
        OpenSettings();
    }

    public void ResumeGame()
    {
        Time.timeScale = 1;
        CloseSettings();
    }

    private void CloseSettings()
    {
        AudioManager.instance.PlaySFX("Click");
        background.SetActive(false);
        continueGameButton.SetActive(false);
    }

    private void OpenSettings()
    {
        AudioManager.instance.PlaySFX("Click");
        continueGameButton.SetActive(true);
        background.SetActive(true);
    }

    public void Quit()
    {
        SceneManager.LoadScene("MenuScene");
        ResumeGame();
    }
}

