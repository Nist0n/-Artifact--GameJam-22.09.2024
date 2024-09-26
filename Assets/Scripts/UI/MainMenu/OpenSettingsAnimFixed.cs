using UnityEngine;
using UnityEngine.UI;

public class OpenSettingsAnimFixed : MonoBehaviour
{
    [SerializeField] GameObject mainMenuButtonsGroup;
    [SerializeField] GameObject settingsButtonsGroup;
    [SerializeField] Button playGameButton;
    [SerializeField] Button quitButton;


    public void OpenSettings()
    {
        settingsButtonsGroup.SetActive(true);
        mainMenuButtonsGroup.SetActive(false);
    }

    public void NotIntaractable()
    {
        playGameButton.interactable = false;
        quitButton.interactable = false;
    }
}
