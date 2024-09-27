using UnityEngine;

namespace Enemies.StateMachine
{
    public class CelebratingState : EnemyState
    {
        private int r;
        public override void Enter()
        {
            navMeshAgent.speed = 0;
            r = Random.Range(0, 2);
        }
    
        public override void Do()
        {
            if (r == 0)
            {
                animationController.Celebrating1();
            }
            else
            {
                animationController.Celebrating2();
            }
        }
    
        public override void Exit()
        {
        
        }
    }
}