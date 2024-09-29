using UnityEngine;

public class SpeedBoom : MonoBehaviour
{
    public float Cost;

    [SerializeField] private GameObject abil;
    
    [SerializeField] private float percent = 0.6f;

    private bool _isPassiveUsed = false;

    private void Update()
    {
        if (GetComponent<PassiveAbilities>().ActiveAbil != null && !_isPassiveUsed)
        {
            SetPassiveBonus();
        }
    }

    private void SetPassiveBonus()
    {
        GetComponent<PassiveAbilities>().ActiveAbil.GetComponent<ActiveAbility>()
            .ChangeAbilityCooldown(GetComponent<PassiveAbilities>().ActiveAbil.name, percent, GetComponent<PassiveAbilities>().ActiveAbil);
        _isPassiveUsed = true;
    }
}
