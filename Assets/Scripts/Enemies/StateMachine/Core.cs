using UnityEngine;
using UnityEngine.AI;

namespace Enemies.StateMachine
{
    public abstract class Core : MonoBehaviour
    {
        public NavMeshAgent navMeshAgent;

        public AnimationController animationController;
    
        public Animator animator;

        public global::StateMachine Machine;
    
        public AudioSource AudioSource;

        public float Speed;

        public float Slowness = 0.6f;

        public float Health;

        public float DroppedCoinsMax;
    
        public float DroppedCoinsMin;

        public float MaxHealth;

        public float Damage;

        public bool IsFrozen = false;
    
        public bool IsSlowness = false;

        public bool IsAttacking = false;

        public bool IsCelebrating;

        public GameObject Soul;

        public EnemyState State => Machine.State;

        public bool IsDamaged = false;

        protected void Set(EnemyState newState, bool forceReset = false)
        {
            Machine.Set(newState, forceReset);
        }

        public void SetupInstances()
        {
            Machine = new global::StateMachine();

            EnemyState[] allchildStates = GetComponentsInChildren<EnemyState>();
            foreach (EnemyState state in allchildStates)
            {
                state.SetCore(this);
            }
        }
    }
}
