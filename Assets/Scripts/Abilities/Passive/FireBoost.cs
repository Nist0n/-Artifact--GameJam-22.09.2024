using Towers;
using UnityEngine;

public class FireBoost : MonoBehaviour
{
    private Tower _tower;

    public float Cost;

    [SerializeField] private float tps = 0.6f;

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
        _tower._initialFireRate *= tps;
        _isPassiveUsed = true;
    }
}
