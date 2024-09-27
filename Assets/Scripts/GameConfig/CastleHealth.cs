using System;
using UnityEngine;

public class CastleHealth : MonoBehaviour
{
    [SerializeField] private float health;

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
    }

    public void ReceiveDamage(float damage)
    {
        health -= damage;
    }
}
