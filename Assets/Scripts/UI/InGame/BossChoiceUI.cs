using System;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using GameConfiguration.Settings.Audio;

namespace UI.InGame
{
    public class BossChoiceUI : MonoBehaviour
    {
        [SerializeField] private GameObject choicePanel;
        [SerializeField] private Button summonBossButton;
        [SerializeField] private Button continueEventsButton;
        
        [SerializeField] private float fadeInDuration = 0.5f;
        [SerializeField] private float fadeOutDuration = 0.3f;
        
        public static event Action OnBossSummoned;
        public static event Action OnEventsContinued;
        
        private CanvasGroup _canvasGroup;
        private bool _isVisible = false;
        
        private void Awake()
        {
            _canvasGroup = choicePanel.GetComponent<CanvasGroup>();
            if (!_canvasGroup)
            {
                _canvasGroup = choicePanel.AddComponent<CanvasGroup>();
            }
            
            SetupButtons();
            HideChoice();
        }
        
        private void SetupButtons()
        {
            summonBossButton.onClick.AddListener(OnSummonBossClicked);
            continueEventsButton.onClick.AddListener(OnContinueEventsClicked);
        }
        
        public void ShowChoice()
        {
            if (_isVisible) return;
            
            _isVisible = true;
            choicePanel.SetActive(true);
            _canvasGroup.alpha = 0f;
            
            Time.timeScale = 0f;
            
            Cursor.visible = true;
            Cursor.lockState = CursorLockMode.None;
            
            StartCoroutine(FadeIn());
        }
        
        public void HideChoice()
        {
            if (!_isVisible) return;
            
            _isVisible = false;
            
            StartCoroutine(FadeOut());
        }
        
        private System.Collections.IEnumerator FadeIn()
        {
            float elapsed = 0f;
            while (elapsed < fadeInDuration)
            {
                elapsed += Time.unscaledDeltaTime;
                _canvasGroup.alpha = Mathf.Lerp(0f, 1f, elapsed / fadeInDuration);
                yield return null;
            }
            _canvasGroup.alpha = 1f;
        }
        
        private System.Collections.IEnumerator FadeOut()
        {
            float elapsed = 0f;
            while (elapsed < fadeOutDuration)
            {
                elapsed += Time.unscaledDeltaTime;
                _canvasGroup.alpha = Mathf.Lerp(1f, 0f, elapsed / fadeOutDuration);
                yield return null;
            }
            _canvasGroup.alpha = 0f;
            choicePanel.SetActive(false);
        }
        
        private void OnSummonBossClicked()
        {
            AudioManager.Instance.PlaySFX("Click");
            OnBossSummoned?.Invoke();
            HideChoice();
        }
        
        private void OnContinueEventsClicked()
        {
            AudioManager.Instance.PlaySFX("Click");
            OnEventsContinued?.Invoke();
            HideChoice();
        }
        
        private void OnDestroy()
        {
            summonBossButton.onClick.RemoveListener(OnSummonBossClicked);
            continueEventsButton.onClick.RemoveListener(OnContinueEventsClicked);
        }
    }
}
