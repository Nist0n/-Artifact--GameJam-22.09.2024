using Towers;
using UnityEngine;

public class RangeGiga : MonoBehaviour
{
    private Tower _tower;

    public float Cost;

    [SerializeField] private float radius = 1.25f;

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
        _tower.attackRange *= radius;
        _isPassiveUsed = true;
    }
}
