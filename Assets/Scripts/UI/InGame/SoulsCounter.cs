using System;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class SoulsCounter : MonoBehaviour
{
    public static SoulsCounter Instance;
    
    [SerializeField] private float nightmares;
    
    [SerializeField] private float dreams;
    
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
        if (nightmares >= 100)
        {
            RemoveNightmares(100);
            dreams++;
        }
        
        UpdateHpBar();
    }
    
    private void UpdateHpBar()
    {
        float fillFrontBar = frontBar.fillAmount;
        float fillBackBar = backBar.fillAmount;
        float hFraction = nightmares / 100;
        
        text.text = $"{newText}{dreams.ToString()}";

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
            backBar.color = Color.green;
            backBar.fillAmount = hFraction;
            _lerpTimer += Time.deltaTime;
            float percentComplete = _lerpTimer / _chipSpeed;
            percentComplete *= percentComplete;
            frontBar.fillAmount = Mathf.Lerp(fillFrontBar, backBar.fillAmount, percentComplete);
        }
    }
    
    public void AddNightmares(float count) 
    {
        nightmares += count;
        _lerpTimer = 0f;
    }

    private void RemoveNightmares(float count)
    {
        nightmares -= count;
        _lerpTimer = 0f;
    }
}