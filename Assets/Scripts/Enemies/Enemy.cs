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

        private void Start()
        {
            SetupInstances();
            Set(Running);
        }

        private void Update()
        {
            if (State.IsComplete)
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
            
            State.DoBranch();
        }

        private void FixedUpdate()
        {
            State.FixedDoBranch();
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
            Debug.Log(IsDamaged);
        }
    }
}