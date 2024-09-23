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
