using System;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System.Collections;
using System.Collections.Generic;
using Unity.Cinemachine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

public class ButtonManager : MonoBehaviour
{
    [SerializeField] private Canvas canvas;
    [SerializeField] private GameObject mainMenuButtonsGroup;
    [SerializeField] private GameObject settingsButtonsGroup;
    
    [SerializeField] private CinemachineCamera sphereCamera;
    [SerializeField] private Volume volume;
    private VolumeProfile _volumeProfile;

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
        // SceneManager.LoadScene("MainMap");
        StartCoroutine(ChangeCamera());
    }

    private IEnumerator ChangeCamera()
    {
        canvas.GetComponent<Canvas>().enabled = false;
        _volumeProfile = volume.profile;
        _volumeProfile.TryGet(out DepthOfField dpf);
        dpf.active = false;
        _volumeProfile.TryGet(out Vignette vignette);
        vignette.intensity = new ClampedFloatParameter(0.6f, 0f, 1f, true);
        sphereCamera.Priority = 2;
        
        yield return new WaitForSeconds(3f);
        SceneManager.LoadScene("MainMap");
    }
    
    public void QuitGame()
    {
        Application.Quit();
    }
}

