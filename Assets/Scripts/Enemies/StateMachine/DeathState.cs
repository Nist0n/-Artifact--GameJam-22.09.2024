using Enemies;
using Sound;
using Unity.Mathematics;
using UnityEngine;
using Random = UnityEngine.Random;

public class DeathState : EnemyState
{
    public override void Enter()
    {
        GameConfig.GameConfig.Instance.EnemyList.Remove(gameObject.GetComponentInParent<Enemy>().gameObject);
        AudioManager.instance.PlayLocalSound("Die", AudioSource);
        navMeshAgent.speed = 0;
        SoulsCounter.Instance.AddNightmares(Mathf.Round(Random.Range(DroppedCoinsMin, DroppedCoinsMax)));
        Instantiate(soul, transform.position, quaternion.identity);
        animator.Play("Death");
    }
    
    public override void Do()
    {
    }
    
    public override void Exit()
    {
        
    }
}
