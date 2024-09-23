using UnityEngine;

public class TakingDamageState : EnemyState
{
    public override void Enter()
    {
        navMeshAgent.speed = 0.5f;
        Debug.Log("TakesDamage");
    }
    
    public override void Do()
    {
        animationController.TakeDamage();
        Debug.Log("Takesanim");
        if (!IsDamaged)
        {
            IsComplete = true;
        }
    }
    
    public override void Exit()
    {
        
    }
}
