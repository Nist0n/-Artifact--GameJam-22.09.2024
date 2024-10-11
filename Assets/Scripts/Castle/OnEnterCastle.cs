using Enemies;
using UnityEngine;

namespace Castle
{
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
}
