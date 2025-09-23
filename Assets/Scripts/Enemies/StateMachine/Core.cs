using GameConfiguration;
using GameConfiguration.Cards;
using UnityEngine;
using UnityEngine.AI;

namespace Enemies.StateMachine
{
    public abstract class Core : MonoBehaviour
    {
        public DeathRewards deathRewards;
        
        public NavMeshAgent navMeshAgent;

        public AnimationController animationController;
    
        public Animator animator;

        public global::StateMachine Machine;
    
        public AudioSource AudioSource;

        public float Speed;

        public float Slowness = 0.6f;

        public float Health;

        public float MaxHealth;

        public float Damage;

        public bool IsFrozen = false;
    
        public bool IsSlowness = false;

        public bool IsAttacking = false;

        public bool IsCelebrating;
        
        public int Level;

        public GameObject Soul;

        protected EnemyState State => Machine.State;

        public bool IsDamaged = false;

        protected void Set(EnemyState newState, bool forceReset = false)
        {
            Machine.Set(newState, forceReset);
        }

        protected void SetupInstances()
        {
            Machine = new global::StateMachine();

            EnemyState[] allchildStates = GetComponentsInChildren<EnemyState>();
            foreach (EnemyState state in allchildStates)
            {
                state.SetCore(this);
            }
        }
        
        protected void SetStats()
        {
            Level = GameConfig.Instance.EnemyLevel;
            MaxHealth *= Level / 2f;
            Health = MaxHealth;
        }
    }
}
