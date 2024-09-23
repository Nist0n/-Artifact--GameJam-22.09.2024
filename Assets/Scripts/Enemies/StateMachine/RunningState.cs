using UnityEngine;
using UnityEngine.AI;

public class RunningState : EnemyState
{
    private Transform _target;

    public override void Enter()
    {
        _target = GameObject.FindGameObjectWithTag("Castle").transform;
        navMeshAgent.speed = 1;
    }
    
    public override void Do()
    {
        navMeshAgent.destination = _target.position;
        animationController.Run();
        if (IsDamaged)
        {
            IsComplete = true;
        }
    }
    
    public override void Exit()
    {
        
    }
}
