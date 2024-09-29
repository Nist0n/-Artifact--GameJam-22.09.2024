using UnityEngine;
using UnityEngine.AI;

public class RunningState : EnemyState
{
    private Transform _target;

    public override void Enter()
    {
        _target = GameObject.FindGameObjectWithTag("Castle").transform;
        navMeshAgent.speed = Speed;
    }
    
    public override void Do()
    {
        AudioManager.instance.PlayWalkSound("", AudioSource);
        navMeshAgent.destination = _target.position;
        animationController.Run();
        if (IsDamaged || IsAttacking || GameConfig.Instance.GameIsOverByLose || IsFreezed)
        {
            IsComplete = true;
        }
    }
    
    public override void Exit()
    {
        
    }
}
