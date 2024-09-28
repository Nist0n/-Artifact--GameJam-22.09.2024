using Unity.Mathematics;
using UnityEngine;
using Random = UnityEngine.Random;

public class DeathState : EnemyState
{
    public override void Enter()
    {
        navMeshAgent.speed = 0;
        SoulsCounter.Instance.AddNightmares(1);
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
