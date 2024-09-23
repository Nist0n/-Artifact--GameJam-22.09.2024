using Enemies;
using UnityEngine;
using UnityEngine.AI;

public abstract class EnemyState : MonoBehaviour
{
    public bool IsComplete { get; protected set; }

    protected float startTime;

    public float time => Time.time - startTime;

    protected Core core;

    protected bool IsDamaged => core.IsDamaged;

    protected Animator animator => core.animator;

    protected NavMeshAgent navMeshAgent => core.navMeshAgent;

    protected AnimationController animationController => core.animationController;

    public StateMachine Machine;

    public StateMachine parent;

    public EnemyState State => Machine.State;

    protected void Set(EnemyState newState, bool forceReset = false)
    {
        Machine.Set(newState, forceReset);
    }

    public void SetCore(Core _core)
    {
        Machine = new StateMachine();
        core = _core;
    }

    public virtual void Enter() {}
    
    public virtual void Do() {}
    
    public virtual void FixedDo() {}
    
    public virtual void Exit() {}

    public void DoBranch()
    {
        Do();
        State?.DoBranch();
    }
    
    public void FixedDoBranch()
    {
        FixedDo();
        State?.FixedDoBranch();
    }
    
    public void Initialise(StateMachine _parent)
    {
        parent = _parent;
        IsComplete = false;
        startTime = Time.time;
    }
}
