using System.Collections;
using DG.Tweening;
using GameConfiguration.Settings.Audio;
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
        [SerializeField] private CinemachineCamera sphereCamera;
        [SerializeField] private Volume volume;
        
        private VolumeProfile _volumeProfile;
        private Canvas _canvasComponent;

        private void Start()
        {
            canvas.GetComponent<CanvasGroup>().DOFade(1, 3);
            Cursor.visible = true;
            Cursor.lockState = CursorLockMode.None;
            _canvasComponent = canvas.GetComponent<Canvas>();
            AudioManager.Instance.PlayMusic("MainMenu");
        }

        public void PlayGame()
        {
            StartCoroutine(ChangeCamera());
        }

        private IEnumerator ChangeCamera()
        {
            _canvasComponent.enabled = false;
            sphereCamera.Priority = 2;
        
            yield return new WaitForSeconds(2f);
            LoadingScreen.Instance.LoadScene("GameScene");
        }
    
        public void QuitGame()
        {
            Application.Quit();
        }
    }
}

