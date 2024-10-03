using Towers;
using UnityEngine;

public class RangeGiga : MonoBehaviour
{
    private Tower _tower;

    public float Cost;

    [SerializeField] private float radius = 1.25f;

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
        _tower.attackRange *= radius;
        _isPassiveUsed = true;
    }
}
