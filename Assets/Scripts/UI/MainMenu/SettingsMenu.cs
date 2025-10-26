using UnityEngine;

namespace UI.MainMenu
{
    public class SettingsMenu : MonoBehaviour
    {
        [SerializeField] private GameObject mainMenuButtonsGroup;
        [SerializeField] private GameObject settingsButtonsGroup;
        
        public void OpenSettings()
        {
            mainMenuButtonsGroup.SetActive(false);
            settingsButtonsGroup.SetActive(true);
        }

        public void CloseSettings()
        {
            mainMenuButtonsGroup.SetActive(true);
            settingsButtonsGroup.SetActive(false);
        }
    }
}
