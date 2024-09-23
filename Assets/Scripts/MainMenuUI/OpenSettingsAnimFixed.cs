using UnityEngine;

public class OpenSettingsAnimFixed : MonoBehaviour
{
    [SerializeField] GameObject mainMenuButtonsGroup;
    [SerializeField] GameObject settingsButtonsGroup;

    public void OpenSettings()
    {
        settingsButtonsGroup.SetActive(true);
        mainMenuButtonsGroup.SetActive(false);
    }

}
