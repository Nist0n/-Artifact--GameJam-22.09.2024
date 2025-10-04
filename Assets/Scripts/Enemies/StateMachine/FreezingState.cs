using GameConfiguration;

namespace Enemies.StateMachine
{
    public class FreezingState : EnemyState
    {
        public override void Enter()
        {
            navMeshAgent.speed = 0f;
            animator.speed = 0f;
        }
    
        public override void Do()
        {
            if (!IsFrozen || GameConfig.Instance.HasLost)
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
}
