using GameConfiguration;

namespace Enemies.StateMachine
{
    public class SlownessState : EnemyState
    {
        public override void Enter()
        {
            navMeshAgent.speed = Speed * Slowness;
        }
    
        public override void Do()
        {
            animationController.Run();
            if (IsDamaged || IsAttacking || GameConfig.Instance.HasLost || IsFrozen || !IsSlowness)
            {
                IsComplete = true;
            }
        }
    
        public override void Exit()
        {
        
        }
    }
}
