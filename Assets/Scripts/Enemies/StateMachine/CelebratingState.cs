using UnityEngine;

namespace Enemies.StateMachine
{
    public class CelebratingState : EnemyState
    {
        private int _randNum;
        public override void Enter()
        {
            navMeshAgent.speed = 0;
            _randNum = Random.Range(0, 2);
            AudioSource.enabled = false;
        }
    
        public override void Do()
        {
            if (_randNum == 0)
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