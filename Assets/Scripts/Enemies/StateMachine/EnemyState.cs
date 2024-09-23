using Enemies;
using UnityEngine;

public abstract class EnemyState : MonoBehaviour
{
    public bool IsComplete { get; protected set; }

    protected float startTime;

    public float time => Time.time - startTime;

    protected Core core;

    protected Animator animator => core.animator;

    public StateMachine Machine;

    public EnemyState parent;

    public EnemyState State => Machine.State;

    protected void Set(EnemyState newState, bool forceReset = false)
    {
        Machine.Set(newState, forceReset);
    }

    public void SetCore(Core _core)
    {
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
    
    public void Initialise()
    {
        IsComplete = false;
        startTime = Time.time;
    }
}
