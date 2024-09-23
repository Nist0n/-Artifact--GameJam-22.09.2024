using UnityEngine;

public class DeathState : EnemyState
{
    public override void Enter()
    {
        navMeshAgent.speed = 0;
    }
    
    public override void Do()
    {
        animationController.Death();
    }
    
    public override void Exit()
    {
        
    }
}
