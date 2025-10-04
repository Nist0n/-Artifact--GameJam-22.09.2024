using GameConfiguration;
using StaticClasses;
using UnityEngine;
using UnityEngine.Serialization;
using UnityEngine.UI;

namespace Castle
{
    public class CastleHealth : MonoBehaviour
    {
        [SerializeField] private Image back;
        [SerializeField] private Image front;
        [SerializeField] private Color frontColor;
        [SerializeField] private Color backColor;

        private float _timer = 4f;
        private float _cooldown = 3f;
        private float _lerpTimer;
        private float _maxHealth = 100;

        public float Health;

        private void Start()
        {
            Health = _maxHealth;
        }

        private void Update()
        {
            Health = Mathf.Clamp(Health, 0, _maxHealth);
    
            if (Health <= 0)
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
            Health -= damage;
            _timer = 0;
            _lerpTimer = 0;
        }

        private void UpdateHpBar()
        {
            float fillBackBar = back.fillAmount;
            float hFraction = Health / _maxHealth;

            if (fillBackBar > hFraction)
            {
                front.fillAmount = hFraction;
                back.color = backColor;
                _lerpTimer += Time.deltaTime;
                float percentComplete = _lerpTimer / 3;
                percentComplete *= percentComplete;
                back.fillAmount = Mathf.Lerp(fillBackBar, hFraction, percentComplete);
            }
        }
    }
}