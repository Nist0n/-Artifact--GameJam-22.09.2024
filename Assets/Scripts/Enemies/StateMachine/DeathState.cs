using Unity.Mathematics;
using UnityEngine;

public class DeathState : EnemyState
{
    public override void Enter()
    {
        navMeshAgent.speed = 0;
        Instantiate(soul, transform.position, quaternion.identity);
    }
    
    public override void Do()
    {
        animationController.Death();
    }
    
    public override void Exit()
    {
        
    }
}
