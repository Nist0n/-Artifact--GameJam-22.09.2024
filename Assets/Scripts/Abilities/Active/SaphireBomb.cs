using UnityEngine;

public class SaphireBomb : MonoBehaviour
{
    public bool IsAbilityUsed = false;

    public float AbilityCooldown;

    public float Timer;

    public float RangeOfAction;

    public GameObject ActionCollider;
    
    public GameObject ActionRadius;

    public float Cost;
    
    public string Name { private set; get; } = "Сапфировая бомба";
    
    public string Description { private set; get; } = "Наносит урон по области";
    
    private void Update()
    {
        CheckAbilityCooldown();
    }

    
    [ContextMenu("Z")]
    public void ActivateAbility(Vector3 pos)
    {
        if (!IsAbilityUsed)
        {
            Instantiate(ActionCollider, pos, Quaternion.identity);
            IsAbilityUsed = true;
        }
    }
    
    public void ActivateAbilityRadius(Vector3 pos)
    {
        ActionRadius.transform.position = pos;
    }
    
    protected void CheckAbilityCooldown()
    {
        if (IsAbilityUsed)
        {
            Timer += Time.deltaTime;
            if (Timer > AbilityCooldown)
            {
                IsAbilityUsed = false;
                Timer = 0;
            }
        }
    }
}
