using Sound;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace UI.InGame
{
    public class GamePause : MonoBehaviour
    {
        // public static GamePause Instance;
    
        [SerializeField] GameObject background;
        // [SerializeField] GameObject continueGameButton;
        [SerializeField] GameObject dreamCounter;

        // public bool gameIsPaused;

        private void Start()
        {
            int randMusic = Random.Range(1, 3);
            AudioManager.instance.PlayMusic($"InGame{randMusic}");
        }

        // private void Awake()
        // {
        //     if (Instance == null)
        //     {
        //         Instance = this;
        //     }
        //     else
        //     {
        //         Destroy(gameObject);
        //     }
        // }

        private void Update()
        {
            if (Input.GetKeyUp(KeyCode.Escape))
            {
                if (!background.activeSelf)
                {
                    SetPause(true);
                }
                else
                {
                    SetPause(false);
                }
            }
        }
    
        public void RestartGame()
        { 
            SetPause(false);
            SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
        }

        public void SetPause(bool isPaused)
        {
            Time.timeScale = isPaused ? 0 : 1;
            ToggleSettings(isPaused);
        }

        private void ToggleSettings(bool active)
        {
            AudioManager.instance.PlaySFX("Click");
            background.SetActive(active);
            dreamCounter.SetActive(!active);
        }
    
        public void Quit()
        {
            AudioManager.instance.PlayMusic("MainMenu");
            SceneManager.LoadScene("MenuScene");
            SetPause(false);
        }
    }
}

