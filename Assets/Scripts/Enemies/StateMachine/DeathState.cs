using GameConfiguration;
using GameConfiguration.Settings.Audio;
using Unity.Mathematics;

namespace Enemies.StateMachine
{
    public class DeathState : EnemyState
    {
        public override void Enter()
        {
            GameConfig.Instance.EnemyList.Remove(gameObject.GetComponentInParent<Enemy>().gameObject);
            AudioManager.Instance.PlayLocalSound("Die", AudioSource);
            navMeshAgent.speed = 0;
            Instantiate(soul, transform.position, quaternion.identity);
            animator.Play("Death");
        }
    
        public override void Do()
        {
        }
    
        public override void Exit()
        {
        
        }
    }
}
