using Unity.Mathematics;
using UnityEngine;
using Random = UnityEngine.Random;

public class DeathState : EnemyState
{
    public override void Enter()
    {
        AudioManager.instance.PlayLocalSound("Die", AudioSource);
        navMeshAgent.speed = 0;
        SoulsCounter.Instance.AddNightmares(Mathf.Round(Random.Range(DroppedCoinsMin, DroppedCoinsMax)));
        Instantiate(soul, transform.position, quaternion.identity);
    }
    
    public override void Do()
    {
        animationController.Death();
    }
    
    public override void Exit()
    {
        
    }
}
