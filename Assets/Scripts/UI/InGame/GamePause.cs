using Sound;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace UI.InGame
{
    public class GamePause : MonoBehaviour
    {
        public static GamePause Instance;
    
        [SerializeField] GameObject background;
        [SerializeField] GameObject continueGameButton;
        [SerializeField] GameObject dreamCounter;

        public bool gameIsPaused;

        private void Start()
        {
            AudioManager.instance.PlayMusic("InGame2");
            // continueGameButton.GetComponent<Animator>().keepAnimatorStateOnDisable = true;
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
    
        // public void PauseGame()
        // {
        //     Time.timeScale = 0f;
        //     ToggleSettings(true);
        // }
        //
        // public void ResumeGame()
        // {
        //     Time.timeScale = 1;
        //     ToggleSettings(false);
        // }

        private void ToggleSettings(bool active)
        {
            AudioManager.instance.PlaySFX("Click");
            background.SetActive(active);
            dreamCounter.SetActive(!active);
        }
    
        // private void OpenSettings()
        // {
        //     AudioManager.instance.PlaySFX("Click");
        //     // continueGameButton.SetActive(true);
        //     dreamCounter.SetActive(false);
        //     background.SetActive(true);
        // }
        //
        // private void CloseSettings()
        // {
        //     AudioManager.instance.PlaySFX("Click");
        //     background.SetActive(false);
        //     dreamCounter.SetActive(true);
        //     // continueGameButton.SetActive(false);
        // }
    
        public void Quit()
        {
            SceneManager.LoadScene("MenuScene");
            SetPause(false);
        }
    }
}

