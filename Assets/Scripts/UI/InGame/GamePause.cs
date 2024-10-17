using Audio;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace UI.InGame
{
    public class GamePause : MonoBehaviour
    {
        [SerializeField] GameObject background;
        [SerializeField] GameObject dreamCounter;

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
            AudioManager.instance.StopMusic();
            SceneManager.LoadScene("MenuScene");
            SetPause(false);
        }
    }
}

