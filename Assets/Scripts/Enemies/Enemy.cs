using System;
using System.Collections;
using Enemies.StateMachine;
using Unity.Mathematics;
using UnityEngine;
using UnityEngine.UI;
using Random = UnityEngine.Random;

namespace Enemies
{
    public class Enemy : Core
    {
        [SerializeField] private Image back;
        
        [SerializeField] private Image front;

        private float _lerpTimer;
        
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

            if (front.color.a != 0)
            {
                UpdateHpBar();
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

        public void FreezeEnemyActivate(float freezeTime)
        {
            StartCoroutine(FreezeEnemy(freezeTime));
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
            StartCoroutine(ShowHpBar());
            _lerpTimer = 0;
            yield return new WaitForSeconds(0.1f);
            IsDamaged = false;
        }
        
        private IEnumerator FreezeEnemy(float freezeTime)
        {
            IsFreezed = true;
            yield return new WaitForSeconds(freezeTime);
            IsFreezed = false;
        }
        
        private void OnTriggerEnter(Collider other)
        {
            if (other.gameObject.CompareTag("Castle"))
            {
                IsAttacking = true;
            }
        }

        private IEnumerator ShowHpBar()
        {
            if (front.color.a == 0)
            {
                front.color = Color.red;
                back.color = Color.white;
                yield return new WaitForSeconds(3f);
                front.color = Color.clear;
                back.color = Color.clear;
            }
        }
        
        private void UpdateHpBar()
        {
            float fillFrontBar = front.fillAmount;
            float fillBackBar = back.fillAmount;
            float hFraction = Health / MaxHealth;

            if (fillBackBar > hFraction)
            {
                front.fillAmount = hFraction;
                back.color = Color.white;
                _lerpTimer += Time.deltaTime;
                float percentComplete = _lerpTimer / 3;
                percentComplete *= percentComplete;
                back.fillAmount = Mathf.Lerp(fillBackBar, hFraction, percentComplete);
            }
            
            if (fillFrontBar < hFraction)
            {
                back.color = Color.green;
                back.fillAmount = hFraction;
                _lerpTimer += Time.deltaTime;
                float percentComplete = _lerpTimer / 3;
                percentComplete *= percentComplete;
                front.fillAmount = Mathf.Lerp(fillFrontBar, back.fillAmount, percentComplete);
            }
        }
    }
}