using UnityEngine;
using UnityEngine.UI;

public class CloseSettingsAnimFixed : MonoBehaviour
{
    [SerializeField] GameObject mainMenuButtonsGroup;
    [SerializeField] GameObject settingsButtonsGroup;
    [SerializeField] Button playGameButton;
    [SerializeField] Button quitButton;

    public void CloseSettings()
    {
        playGameButton.interactable = true;
        quitButton.interactable = true;
        settingsButtonsGroup.SetActive(false);
        mainMenuButtonsGroup.SetActive(true);
    }
}
