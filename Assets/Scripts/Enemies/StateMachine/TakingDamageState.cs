using GameConfiguration;
using GameConfiguration.Settings.Audio;

namespace Enemies.StateMachine
{
    public class TakingDamageState : EnemyState
    {
        public override void Enter()
        {
            AudioManager.Instance.PlayRandomSoundByName("GetDamage", AudioSource);
            navMeshAgent.speed = Speed * Slowness;
        }
    
        public override void Do()
        {
            animationController.TakeDamage();
            navMeshAgent.speed = Speed * Slowness;
            if (!IsDamaged || GameConfig.Instance.HasLost || IsFrozen)
            {
                IsComplete = true;
            }
        }
    
        public override void Exit()
        {
        
        }
    }
}
