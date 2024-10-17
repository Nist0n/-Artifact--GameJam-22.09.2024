using GameConfiguration;
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
        if (!IsAttacking || GameConfig.Instance.HasLost || IsFreezed)
        {
            IsComplete = true;
        }
    }
    
    public override void Exit()
    {
        
    }
}
