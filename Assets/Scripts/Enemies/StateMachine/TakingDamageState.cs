using UnityEngine;

public class TakingDamageState : EnemyState
{
    public override void Enter()
    {
        navMeshAgent.speed -= 0.5f;
    }
    
    public override void Do()
    {
        animationController.TakeDamage();
        if (!IsDamaged || GameConfig.Instance.GameIsOverByLose)
        {
            IsComplete = true;
        }
    }
    
    public override void Exit()
    {
        
    }
}
