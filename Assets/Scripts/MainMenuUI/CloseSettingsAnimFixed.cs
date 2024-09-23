using UnityEngine;

public class CloseSettingsAnimFixed : MonoBehaviour
{
    [SerializeField] GameObject mainMenuButtonsGroup;
    [SerializeField] GameObject settingsButtonsGroup;

    public void CloseSettings()
    {
        settingsButtonsGroup.SetActive(false);
        mainMenuButtonsGroup.SetActive(true);
    }
}
