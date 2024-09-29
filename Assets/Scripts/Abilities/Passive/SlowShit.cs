using Towers;
using UnityEngine;

public class SlowShit : MonoBehaviour
{
    private Tower _tower;

    public float Cost;

    private bool _isPassiveUsed = false;

    private void Update()
    {
        if (GetComponent<PassiveAbilities>().tower != null)
        {
            _tower = GetComponent<PassiveAbilities>().tower;
        }

        if (_tower != null && !_isPassiveUsed)
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
