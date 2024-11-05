using Audio;
using Enemies;
using GameConfiguration;
using UI.InGame;
using Unity.Mathematics;
using UnityEngine;
using Random = UnityEngine.Random;

public class DeathState : EnemyState
{
    public override void Enter()
    {
        GameConfig.Instance.enemyList.Remove(gameObject.GetComponentInParent<Enemy>().gameObject);
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
