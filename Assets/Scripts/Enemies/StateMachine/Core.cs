using System.Collections;
using Enemies;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Serialization;

public abstract class Core : MonoBehaviour
{
    public NavMeshAgent navMeshAgent;

    public AnimationController animationController;
    
    public Animator animator;

    public StateMachine Machine;
    
    public AudioSource AudioSource;

    public float Speed;

    public float Slowness = 0.6f;

    public float Health;

    public float DroppedCoinsMax;
    
    public float DroppedCoinsMin;

    public float MaxHealth;

    public float Damage;

    [FormerlySerializedAs("IsFreezed")] public bool IsFrozen = false;
    
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
        Machine = new StateMachine();

        EnemyState[] allchildStates = GetComponentsInChildren<EnemyState>();
        foreach (EnemyState state in allchildStates)
        {
            state.SetCore(this);
        }
    }
}
