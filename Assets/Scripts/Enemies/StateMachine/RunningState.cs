using UnityEngine;
using UnityEngine.AI;

public class RunningState : EnemyState
{
    private Transform _target;

    public override void Enter()
    {
        _target = GameObject.FindGameObjectWithTag("Castle").transform;
        navMeshAgent.speed = 1;
        animator.Play("mixamo_com");
    }
    
    public override void Do()
    {
        navMeshAgent.destination = _target.position;
        animator.speed = Helpers.Map(navMeshAgent.speed - 0.43f, 0, 1, 0, 1.6f, true);
    }
    
    public override void Exit()
    {
        
    }
}
