using System;
using Enemies;
using UnityEngine;

public class OnEnterCastle : Enemy
{
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Castle"))
        {
            IsAttacking = true;
        }
    }
}
