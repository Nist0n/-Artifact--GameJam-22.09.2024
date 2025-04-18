using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace UI.InGame
{
    public class SoulsCounter : MonoBehaviour
    {
        public static SoulsCounter Instance;
    
        public float Nightmares;
    
        public float Dreams;
    
        [SerializeField] private TextMeshProUGUI text;
    
        [SerializeField] private string newText;

        [SerializeField] private Image frontBar;

        [SerializeField] private Image backBar;

        private float _chipSpeed = 3f;

        private float _lerpTimer;
    
        private void Awake()
        {
            if (Instance == null)
            {
                Instance = this;
            }
            else
            {
                Destroy(gameObject);
            }
        }

        private void Update()
        {
            if (Nightmares >= 100)
            {
                RemoveNightmares(100);
                Dreams++;
            }
        
            UpdateHpBar();
        }
    
        private void UpdateHpBar()
        {
            float fillFrontBar = frontBar.fillAmount;
            float fillBackBar = backBar.fillAmount;
            float hFraction = Nightmares / 100;
        
            text.text = $"{newText}{Dreams.ToString()}";

            if (fillBackBar > hFraction)
            {
                frontBar.fillAmount = hFraction;
                backBar.color = Color.red;
                _lerpTimer += Time.deltaTime;
                float percentComplete = _lerpTimer / _chipSpeed;
                percentComplete *= percentComplete;
                backBar.fillAmount = Mathf.Lerp(fillBackBar, hFraction, percentComplete);
            }

            if (fillFrontBar < hFraction)
            {
                backBar.color = Color.magenta;
                backBar.fillAmount = hFraction;
                _lerpTimer += Time.deltaTime;
                float percentComplete = _lerpTimer / _chipSpeed;
                percentComplete *= percentComplete;
                frontBar.fillAmount = Mathf.Lerp(fillFrontBar, backBar.fillAmount, percentComplete);
            }
        }
    
        public void AddNightmares(float count) 
        {
            Nightmares += count;
            _lerpTimer = 0f;
        }

        private void RemoveNightmares(float count)
        {
            Nightmares -= count;
            _lerpTimer = 0f;
        }
    }
}