using Enemies;
using UnityEngine;

public abstract class Core : MonoBehaviour
{
    public Animator animator;

    public StateMachine Machine;

    public EnemyState State => Machine.State;

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
