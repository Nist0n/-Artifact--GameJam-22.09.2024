using System.Collections;
using Enemies;
using UnityEngine;
using UnityEngine.AI;

public abstract class Core : MonoBehaviour
{
    public NavMeshAgent navMeshAgent;

    public AnimationController animationController;
    
    public Animator animator;

    public StateMachine Machine;

    public float Health;

    public float Damage;

    public bool IsFreezed = false;

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
