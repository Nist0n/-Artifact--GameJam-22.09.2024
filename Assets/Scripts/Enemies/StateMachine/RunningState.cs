using GameConfiguration;
using UnityEngine;

namespace Enemies.StateMachine
{
    public class RunningState : EnemyState
    {
        private Transform _target;

        public override void Enter()
        {
            _target = GameObject.FindGameObjectWithTag("Castle").transform;
            navMeshAgent.speed = Speed * Slowness;
        }
    
        public override void Do()
        {
            navMeshAgent.destination = _target.position;
            animationController.Run();
            // Keep speed updated while slowed
            navMeshAgent.speed = Speed * Slowness;
            if (IsDamaged || IsAttacking || GameConfig.Instance.HasLost || IsFrozen)
            {
                IsComplete = true;
            }
        }
    
        public override void Exit()
        {
        
        }
    }
}
