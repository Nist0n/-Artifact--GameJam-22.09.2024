using System.Collections;
using Audio;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using UnityEngine.SceneManagement;

namespace UI.MainMenu
{
    public class ButtonManager : MonoBehaviour
    {
        [SerializeField] private Canvas canvas;
        [SerializeField] private GameObject mainMenuButtonsGroup;
        [SerializeField] private GameObject settingsButtonsGroup;
    
        [SerializeField] private CinemachineCamera sphereCamera;
        [SerializeField] private Volume volume;
        private VolumeProfile _volumeProfile;
        private Canvas _canvasComponent;

        private void Start()
        {
            Cursor.visible = true;
            Cursor.lockState = CursorLockMode.None;
            _canvasComponent = canvas.GetComponent<Canvas>();
            AudioManager.instance.PlayMusic("MainMenu");
        }

        public void PlayGame()
        {
            StartCoroutine(ChangeCamera());
        }

        private IEnumerator ChangeCamera()
        {
            _canvasComponent.enabled = false;
            _volumeProfile = volume.profile;
            _volumeProfile.TryGet(out DepthOfField dpf);
            dpf.active = false;
            _volumeProfile.TryGet(out Vignette vignette);
            vignette.intensity = new ClampedFloatParameter(0.6f, 0f, 1f, true);
            sphereCamera.Priority = 2;
        
            yield return new WaitForSeconds(3f);
            SceneManager.LoadScene("GameScene");
        }
    
        public void QuitGame()
        {
            Application.Quit();
        }
    }
}

