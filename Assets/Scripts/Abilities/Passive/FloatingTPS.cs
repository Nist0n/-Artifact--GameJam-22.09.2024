using System;
using Abilities.Passive;
using Towers;
using UnityEngine;

public class FloatingTPS : MonoBehaviour
{
    private Tower _tower;

    public float Cost;

    [SerializeField] private float tps = 0.6f;

    private bool _isPassiveUsed = false;
    private PassiveAbilities _passiveAbilities;

    public string Description { private set; get; } = $"Увеличивает скорострельность башни на 40% в течение первых {Tower.buffDuration} секунд";
    
    private void Start()
    {
        _passiveAbilities = GetComponent<PassiveAbilities>();
    }

    private void Update()
    {
        if (_passiveAbilities.tower)
        {
            _tower = _passiveAbilities.tower;
        }

        if (_tower && !_isPassiveUsed)
        {
            SetPassiveBonus();
        }
    }

    private void SetPassiveBonus()
    {
        _tower.buffedFireRate *= tps;
        _isPassiveUsed = true;
    }
}
