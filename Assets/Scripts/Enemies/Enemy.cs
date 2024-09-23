using System;
using System.Collections;
using UnityEngine;
using UnityEngine.AI;

namespace Enemies
{
    public class Enemy : Core
    {
        public RunningState Running;
        public TakingDamageState TakingDamage;
        public FreezingState Freeze;
        public DeathState Death;

        private void Start()
        {
            SetupInstances();
            Set(Running);
        }

        private void Update()
        {
            if (State.IsComplete)
            {
                if (IsFreezed)
                {
                    Set(Freeze);
                }
                else
                {
                    if (IsDamaged)
                    {
                        Debug.Log("Damage");
                        Set(TakingDamage);
                    }
                    else
                    {
                        Set(Running);
                    }
                }
            }

            if (Health <= 0)
            {
                Set(Death);
                Invoke("KillEnemy", 1.5f);
            }
            
            State.DoBranch();
        }

        private void FixedUpdate()
        {
            State.FixedDoBranch();
        }

        private void KillEnemy()
        {
            Destroy(this.gameObject);
        }

        public void FreezeEnemyActivate()
        {
            StartCoroutine(FreezeEnemy());
        }
        
        public void ReceiveDamageActivate()
        {
            StartCoroutine(ReceiveDamage());
        }
        
        private IEnumerator ReceiveDamage()
        {
            IsDamaged = true;
            Health -= 5;
            yield return new WaitForSeconds(0.1f);
            IsDamaged = false;
        }
        
        private IEnumerator FreezeEnemy()
        {
            IsFreezed = true;
            yield return new WaitForSeconds(2f);
            IsFreezed = false;
        }
    }
}