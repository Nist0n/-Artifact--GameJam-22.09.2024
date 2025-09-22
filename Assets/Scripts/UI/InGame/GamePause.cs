using System;
using Audio;
using GameConfiguration;
using StaticClasses;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace UI.InGame
{
    public class GamePause : MonoBehaviour
    {
        [SerializeField] GameObject background;
        [SerializeField] GameObject dreamCounter;
        [SerializeField] GameObject resourcesUI;

        private void Update()
        {
            if (GameConfig.Instance.HasLost || GameConfig.Instance.HasWon)
            {
                return;
            }
            if (Input.GetKeyUp(KeyCode.Escape))
            {
                if (!background.activeSelf)
                {
                    GameEvents.OnGamePause(true);
                    SetPause(true);
                }
                else
                {
                    GameEvents.OnGamePause(false);
                    SetPause(false);
                }
            }
        }
    
        public void RestartGame()
        { 
            SetPause(false);
            SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
        }

        private void SetPause(bool isPaused)
        {
            Time.timeScale = isPaused ? 0 : 1;
            ToggleSettings(isPaused);
        }

        private void ToggleSettings(bool active)
        {
            AudioManager.instance.PlaySFX("Click");
            background.SetActive(active);
            dreamCounter.SetActive(!active);
            resourcesUI.SetActive(!active);
        }
    
        public void Quit()
        {
            AudioManager.instance.StopMusic();
            SceneManager.LoadScene("MenuScene");
            SetPause(false);
        }
    }
}

