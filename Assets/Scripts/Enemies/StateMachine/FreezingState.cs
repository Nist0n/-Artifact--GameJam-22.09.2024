using UnityEngine;

public class FreezingState : EnemyState
{
    public override void Enter()
    {
        navMeshAgent.speed = 0f;
        animator.speed = 0f;
        AudioManager.instance.StopSound(AudioSource);
    }
    
    public override void Do()
    {
        if (!IsFreezed || GameConfig.Instance.GameIsOverByLose)
        {
            navMeshAgent.speed = 1f;
            animator.speed = 1f;
            IsComplete = true;
        }
    }
    
    public override void Exit()
    {
        
    }
}
