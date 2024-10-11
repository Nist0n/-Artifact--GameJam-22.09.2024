using Sound;
using UnityEngine;

public class TakingDamageState : EnemyState
{
    public override void Enter()
    {
        navMeshAgent.speed -= 0.5f;
        AudioManager.instance.PlayRandomSoundByName("GetDamage", AudioSource);
    }
    
    public override void Do()
    {
        animationController.TakeDamage();
        if (!IsDamaged || GameConfig.GameConfig.Instance.GameIsOverByLose || IsFreezed)
        {
            IsComplete = true;
        }
    }
    
    public override void Exit()
    {
        
    }
}
