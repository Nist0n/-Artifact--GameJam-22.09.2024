using GameConfiguration;
using StaticClasses;
using UnityEngine;
using UnityEngine.UI;

namespace Castle
{
    public class CastleHealth : MonoBehaviour
    {
        [SerializeField] private Image back;
    
        [SerializeField] private Image front;

        private float _timer = 4f;

        private float _cooldown = 3f;

        private float _lerpTimer;

        public float health;

        private float _maxHealth = 100;

        [SerializeField] private Color frontColor;
        [SerializeField] private Color backColor;

        private void Start()
        {
            health = _maxHealth;
        }

        private void Update()
        {
            health = Mathf.Clamp(health, 0, _maxHealth);
    
            if (health <= 0)
            {
                GameEvents.GameLost?.Invoke();
            }

            if (_timer <= _cooldown)
            {
                _timer += Time.deltaTime;
                front.color = frontColor;
                back.color = backColor;
            }
            else if (front.color.a != 0)
            {
                front.color = Color.clear;
                back.color = Color.clear;
            }
    
            if (front.color.a != 0)
            {
                UpdateHpBar();
            }
        }

        public void ReceiveDamage(float damage)
        {
            health -= damage;
            _timer = 0;
            _lerpTimer = 0;
        }

        private void UpdateHpBar()
        {
            // float fillFrontBar = front.fillAmount;
            float fillBackBar = back.fillAmount;
            float hFraction = health / _maxHealth;

            if (fillBackBar > hFraction)
            {
                front.fillAmount = hFraction;
                back.color = backColor;
                _lerpTimer += Time.deltaTime;
                float percentComplete = _lerpTimer / 3;
                percentComplete *= percentComplete;
                back.fillAmount = Mathf.Lerp(fillBackBar, hFraction, percentComplete);
            }
        
            // if (fillFrontBar < hFraction)
            // {
            //     back.color = Color.green;
            //     back.fillAmount = hFraction;
            //     _lerpTimer += Time.deltaTime;
            //     float percentComplete = _lerpTimer / 3;
            //     percentComplete *= percentComplete;
            //     front.fillAmount = Mathf.Lerp(fillFrontBar, back.fillAmount, percentComplete);
            // }
        }
    }
}