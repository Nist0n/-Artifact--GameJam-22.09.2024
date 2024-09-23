using UnityEngine;

public class AttackingState : EnemyState
{
    public override void Enter()
    {
        navMeshAgent.speed = 0;
    }
    
    public override void Do()
    {
        animationController.Attacking();
        if (!IsAttacking)
        {
            IsComplete = true;
        }
    }
    
    public override void Exit()
    {
        
    }
}
