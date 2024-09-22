using UnityEngine;

namespace Enemies
{
    public class Enemy : MonoBehaviour
    {
        [SerializeField] private int healthPoints;

        public void ReceiveDamage(int damage)
        {
            healthPoints -= damage;

            if (healthPoints <= 0)
            {
                Destroy(gameObject);
            }
        }
    }
}