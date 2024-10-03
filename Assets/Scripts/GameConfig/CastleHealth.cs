using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CastleHealth : MonoBehaviour
{
    [SerializeField] private Image back;
        
    [SerializeField] private Image front;

    private float _lerpTimer;
    
    public float health;

    private float _maxHealth = 100;

    private void Start()
    {
        health = _maxHealth;
    }

    private void Update()
    {
        health = Mathf.Clamp(health, 0, _maxHealth);
        
        if (health <= 0)
        {
            GameConfig.Instance.GameIsOverByLose = true;
        }
        
        if (front.color.a != 0)
        {
            UpdateHpBar();
        }
    }

    public void ReceiveDamage(float damage)
    {
        health -= damage;
        StartCoroutine(ShowHpBar());
        _lerpTimer = 0;
    }
    
    private IEnumerator ShowHpBar()
    {
        if (front.color.a == 0)
        {
            front.color = Color.red;
            back.color = Color.white;
            yield return new WaitForSeconds(3f);
            front.color = Color.clear;
            back.color = Color.clear;
        }
    }
    
    private void UpdateHpBar()
    {
        float fillFrontBar = front.fillAmount;
        float fillBackBar = back.fillAmount;
        float hFraction = health / _maxHealth;

        if (fillBackBar > hFraction)
        {
            front.fillAmount = hFraction;
            back.color = Color.white;
            _lerpTimer += Time.deltaTime;
            float percentComplete = _lerpTimer / 3;
            percentComplete *= percentComplete;
            back.fillAmount = Mathf.Lerp(fillBackBar, hFraction, percentComplete);
        }
            
        if (fillFrontBar < hFraction)
        {
            back.color = Color.green;
            back.fillAmount = hFraction;
            _lerpTimer += Time.deltaTime;
            float percentComplete = _lerpTimer / 3;
            percentComplete *= percentComplete;
            front.fillAmount = Mathf.Lerp(fillFrontBar, back.fillAmount, percentComplete);
        }
    }
}
