using GameConfiguration;
using NUnit.Framework;
using UnityEngine;

public class SlownessState : EnemyState
{
    public override void Enter()
    {
        navMeshAgent.speed = Speed * Slowness;
        Debug.Log(navMeshAgent.speed);
    }
    
    public override void Do()
    {
        animationController.Run();
        if (IsDamaged || IsAttacking || GameConfig.Instance.GameIsOverByLose || IsFreezed || !IsSlowness)
        {
            IsComplete = true;
        }
    }
    
    public override void Exit()
    {
        
    }
}
