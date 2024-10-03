using Towers;
using UnityEngine;

public class SlowShit : MonoBehaviour
{
    private Tower _tower;

    public float Cost;

    private bool _isPassiveUsed = false;
    private PassiveAbilities _passiveAbilities;

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
        _tower.SetSlowness();
        _isPassiveUsed = true;
    }
}
