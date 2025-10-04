using GameConfiguration;
using GameConfiguration.Settings.Audio;

namespace Enemies.StateMachine
{
    public class TakingDamageState : EnemyState
    {
        public override void Enter()
        {
            navMeshAgent.speed -= 0.5f;
            AudioManager.Instance.PlayRandomSoundByName("GetDamage", AudioSource);
        }
    
        public override void Do()
        {
            animationController.TakeDamage();
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
