using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System.Collections;

public class ButtonManager : MonoBehaviour
{
    [SerializeField] GameObject mainMenuButtonsGroup;
    [SerializeField] GameObject settingsButtonsGroup;

    private void Update()
    {
        if (Input.GetKeyUp(KeyCode.Escape))
        {
            settingsButtonsGroup.SetActive(false);
            mainMenuButtonsGroup.SetActive(true);
        }
    }

    public void PlayGame()
    {
        SceneManager.LoadScene("MainMap");
    }

    public void QuitGame()
    {
        Application.Quit();
    }
}

