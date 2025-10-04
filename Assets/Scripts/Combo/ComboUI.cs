using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System.Collections;

namespace Combo
{
    public class ComboUI : MonoBehaviour
    {
        [Header("UI References")]
        [SerializeField] private TextMeshProUGUI comboText;
        [SerializeField] private TextMeshProUGUI multiplierText;
        [SerializeField] private Image comboBar;
        [SerializeField] private Image multiplierBar;
        [SerializeField] private GameObject comboContainer;
        
        [Header("Animation Settings")]
        [SerializeField] private float animationDuration = 0.3f;
        [SerializeField] private float scaleMultiplier = 1.2f;
        [SerializeField] private Color comboActiveColor = Color.yellow;
        [SerializeField] private Color comboInactiveColor = Color.gray;
        
        [Header("Combo Bar Settings")]
        [SerializeField] private float maxComboForBar = 100f;
        
        public static ComboUI Instance { get; private set; }
        
        private Coroutine _comboAnimationCoroutine;
        private Coroutine _multiplierAnimationCoroutine;
        private Vector3 _originalScale;
        
        private void Awake()
        {
            if (!Instance)
            {
                Instance = this;
            }
            else
            {
                Destroy(gameObject);
            }
        }
        
        private void Start()
        {
            _originalScale = comboContainer.transform.localScale;
            
            ComboManager.OnComboChanged += OnComboChanged;
            ComboManager.OnComboMultiplierChanged += OnComboMultiplierChanged;
            
            UpdateComboDisplay(0, 1f);
        }
        
        private void OnDestroy()
        {
            ComboManager.OnComboChanged -= OnComboChanged;
            ComboManager.OnComboMultiplierChanged -= OnComboMultiplierChanged;
        }
        
        private void OnComboChanged(int newCombo)
        {
            UpdateComboDisplay(newCombo, ComboManager.Instance?.GetResourceMultiplier() ?? 1f);
            
            if (_comboAnimationCoroutine != null)
            {
                StopCoroutine(_comboAnimationCoroutine);
            }
            _comboAnimationCoroutine = StartCoroutine(AnimateComboChange());
        }
        
        private void OnComboMultiplierChanged(float newMultiplier)
        {
            UpdateMultiplierDisplay(newMultiplier);
            
            if (_multiplierAnimationCoroutine != null)
            {
                StopCoroutine(_multiplierAnimationCoroutine);
            }
            _multiplierAnimationCoroutine = StartCoroutine(AnimateMultiplierChange());
        }
        
        public void UpdateComboDisplay(int combo, float multiplier)
        {
            if (comboText)
            {
                comboText.text = combo > 0 ? $"COMBO: {combo}" : "";
            }
            
            Color textColor = combo > 0 ? comboActiveColor : comboInactiveColor;
            if (comboText)
            {
                comboText.color = textColor;
            }
            
            if (comboBar)
            {
                float fillAmount = Mathf.Clamp01(combo / maxComboForBar);
                comboBar.fillAmount = fillAmount;
                comboBar.color = Color.Lerp(comboInactiveColor, comboActiveColor, fillAmount);
            }
            
            if (comboContainer)
            {
                comboContainer.SetActive(combo > 0);
            }
            
            UpdateMultiplierDisplay(multiplier);
        }
        
        private void UpdateMultiplierDisplay(float multiplier)
        {
            if (multiplierText)
            {
                multiplierText.text = $"x{multiplier:F2}";
                multiplierText.color = multiplier > 1f ? comboActiveColor : comboInactiveColor;
            }
            
            if (multiplierBar)
            {
                float fillAmount = Mathf.Clamp01((multiplier - 1f) / 2f); // Максимум x3.0
                multiplierBar.fillAmount = fillAmount;
                multiplierBar.color = Color.Lerp(comboInactiveColor, comboActiveColor, fillAmount);
            }
        }
        
        private IEnumerator AnimateComboChange()
        {
            Vector3 targetScale = _originalScale * scaleMultiplier;
            
            float elapsed = 0f;
            while (elapsed < animationDuration * 0.5f)
            {
                elapsed += Time.deltaTime;
                float progress = elapsed / (animationDuration * 0.5f);
                comboContainer.transform.localScale = Vector3.Lerp(_originalScale, targetScale, progress);
                yield return null;
            }
            
            elapsed = 0f;
            while (elapsed < animationDuration * 0.5f)
            {
                elapsed += Time.deltaTime;
                float progress = elapsed / (animationDuration * 0.5f);
                comboContainer.transform.localScale = Vector3.Lerp(targetScale, _originalScale, progress);
                yield return null;
            }
            
            comboContainer.transform.localScale = _originalScale;
        }
        
        private IEnumerator AnimateMultiplierChange()
        {
            if (!multiplierText) yield break;
            
            Color originalColor = multiplierText.color;
            Color targetColor = originalColor * 1.5f;
            
            float elapsed = 0f;
            while (elapsed < animationDuration)
            {
                elapsed += Time.deltaTime;
                float progress = elapsed / animationDuration;
                multiplierText.color = Color.Lerp(originalColor, targetColor, Mathf.PingPong(progress * 2f, 1f));
                yield return null;
            }
            
            multiplierText.color = originalColor;
        }
        
        public void ShowComboUI(bool show)
        {
            if (comboContainer != null)
            {
                comboContainer.SetActive(show);
            }
        }
        
        public void SetComboBarMaxValue(float maxValue)
        {
            maxComboForBar = maxValue;
        }
    }
}
