using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System.Collections;
using System.Collections.Generic;
using Unity.Cinemachine;

public class ButtonManager : MonoBehaviour
{
    [SerializeField] private Canvas canvas;
    [SerializeField] private GameObject mainMenuButtonsGroup;
    [SerializeField] private GameObject settingsButtonsGroup;
    
    [SerializeField] private CinemachineCamera sphereCamera;

    private void Update()
    {
        if (Input.GetKeyUp(KeyCode.Escape))
        {
            settingsButtonsGroup.SetActive(!settingsButtonsGroup.activeSelf);
            mainMenuButtonsGroup.SetActive(!mainMenuButtonsGroup.activeSelf);
        }
    }

    public void PlayGame()
    {
        StartCoroutine(ChangeCamera());
    }

    private IEnumerator ChangeCamera()
    {
        sphereCamera.Priority = 1;
        canvas.GetComponent<Canvas>().enabled = false;
        yield return new WaitForSeconds(2f);
        SceneManager.LoadScene("MainMap");
    }
    
    public void QuitGame()
    {
        Application.Quit();
    }
}

