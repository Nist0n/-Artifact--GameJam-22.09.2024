using UnityEngine;

public class StateMachine
{
    public EnemyState State;

    public void Set(EnemyState newState, bool forceReset = false)
    {
        if (State != newState || forceReset)
        {
            State?.Exit();
            State = newState;
            State.Initialise();
            State.Enter();
        }
    }
}
