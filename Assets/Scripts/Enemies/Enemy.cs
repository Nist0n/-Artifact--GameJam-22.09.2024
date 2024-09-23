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
                        Set(TakingDamage);
                    }
                    else
                    {
                        Set(Running);
                    }
                }
            }
            
            State.DoBranch();
        }

        private void FixedUpdate()
        {
            State.FixedDoBranch();
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