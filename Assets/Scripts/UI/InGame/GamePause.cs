using System;
using GameConfiguration;
using GameConfiguration.Settings.Audio;
using StaticClasses;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace UI.InGame
{
    public class GamePause : MonoBehaviour
    {
        [SerializeField] private GameObject background;
        [SerializeField] private GameObject dreamCounter;
        [SerializeField] private GameObject resourcesUI;

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
            AudioManager.Instance.PlaySFX("Click");
            background.SetActive(active);
            dreamCounter.SetActive(!active);
            resourcesUI.SetActive(!active);
        }
    
        public void Quit()
        {
            AudioManager.Instance.StopMusic();
            SceneManager.LoadScene("MenuScene");
            SetPause(false);
        }
    }
}

