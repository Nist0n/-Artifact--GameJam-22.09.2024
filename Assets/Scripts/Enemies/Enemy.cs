using System;
using System.Collections;
using Enemies.StateMachine;
using Unity.Mathematics;
using UnityEngine;

namespace Enemies
{
    public class Enemy : Core
    {
        public RunningState Running;
        public TakingDamageState TakingDamage;
        public FreezingState Freeze;
        public DeathState Death;
        public AttackingState Attacking;
        public CelebratingState Celebrating;
        
        private void Start()
        {
            Health = MaxHealth;
            SetupInstances();
            Set(Running);
        }

        private void Update()
        {
            Health = Mathf.Clamp(Health, 0, MaxHealth);
            
            if (State.IsComplete)
            {
                if (GameConfig.Instance.GameIsOverByLose)
                {
                    Set(Celebrating);
                    return;
                }
                
                if (IsFreezed)
                {
                    Set(Freeze);
                }
                else
                {
                    if (IsAttacking)
                    {
                        Set(Attacking);
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
            }

            if (Health <= 0)
            {
                Set(Death);
                Invoke("KillEnemy", 1f);
            }
            
            State.DoBranch();
        }

        public void HealHP(float heal)
        {
            Health += heal;
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
        
        public void ReceiveDamageActivate(float damage)
        {
            StartCoroutine(ReceiveDamage(damage));
        }

        public void AttackCastle()
        {
            GameObject.FindGameObjectWithTag("Castle").GetComponent<CastleHealth>().ReceiveDamage(Damage);
        }
        
        private IEnumerator ReceiveDamage(float damage)
        {
            IsDamaged = true;
            Health -= damage;
            yield return new WaitForSeconds(0.1f);
            IsDamaged = false;
        }
        
        private IEnumerator FreezeEnemy()
        {
            IsFreezed = true;
            yield return new WaitForSeconds(2f);
            IsFreezed = false;
        }
        
        private void OnTriggerEnter(Collider other)
        {
            if (other.gameObject.CompareTag("Castle"))
            {
                IsAttacking = true;
            }
        }
    }
}