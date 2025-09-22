using System.Collections;
using Audio;
using Castle;
using Enemies.StateMachine;
using Events;
using GameConfiguration;
using UnityEngine;
using UnityEngine.UI;

namespace Enemies
{
    public class Enemy : Core
    {
        [SerializeField] private Image back;
        
        [SerializeField] private Image front;

        private float _lerpTimer;
        
        private float _slowTimer;

        public RunningState Running;
        public TakingDamageState TakingDamage;
        public FreezingState Freeze;
        public DeathState Death;
        public AttackingState Attacking;
        public CelebratingState Celebrating;
        public SlownessState Slow;

        private Coroutine _hpBarCoroutine;

        [SerializeField] private GameEvent deathEvent;
        
        private void Start()
        {
            Health = MaxHealth;
            SetupInstances();
            Set(Running);
        }

        private void Update()
        {
            Health = Mathf.Clamp(Health, 0, MaxHealth);

            if (_slowTimer <= 3f)
            {
                _slowTimer += Time.deltaTime;
                IsSlowness = true;
            }
            else
            {
                IsSlowness = false;
            }
            
            if (State.IsComplete)
            {
                if (GameConfig.Instance.HasLost)
                {
                    Set(Celebrating);
                    return;
                }
                
                if (IsFrozen)
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
                            if (IsSlowness)
                            {
                                Set(Slow);
                            }
                            else
                            {
                                Set(Running);
                            }
                        }
                    }
                }
            }

            if (Health <= 0)
            {
                Set(Death);
                Invoke(nameof(KillEnemy), 1f);
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

        public void SetSlowness()
        {
            _slowTimer = 0;
        }

        private void FixedUpdate()
        {
            State.FixedDoBranch();
        }

        private void KillEnemy()
        {
            Destroy(gameObject);
            deathEvent.TriggerEvent();
        }

        public void FreezeEnemyActivate(float freezeTime)
        {
            StartCoroutine(FreezeEnemy(freezeTime));
        }
        
        public void ReceiveDamageActivate(float damage)
        {
            if (_hpBarCoroutine != null)
            {
                StopCoroutine(_hpBarCoroutine);
                _hpBarCoroutine = null;
            }
            StartCoroutine(ReceiveDamage(damage));
        }

        public void AttackCastle()
        {
            AudioManager.instance.PlayRandomSoundByName("GateBreak", AudioSource);
            GameObject.FindGameObjectWithTag("Castle").GetComponent<CastleHealth>().ReceiveDamage(Damage);
        }
        
        private IEnumerator ReceiveDamage(float damage)
        {
            IsDamaged = true;
            Health -= damage;
            if (_hpBarCoroutine == null)
            {
                _hpBarCoroutine = StartCoroutine(ShowHpBar());
            }
            _lerpTimer = 0;
            yield return new WaitForSeconds(0.1f);
            IsDamaged = false;
        }
        
        private IEnumerator FreezeEnemy(float freezeTime)
        {
            IsFrozen = true;
            yield return new WaitForSeconds(freezeTime);
            IsFrozen = false;
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
            front.color = Color.red;
            back.color = Color.white;
            yield return new WaitForSeconds(3f);
            front.color = Color.clear;
            back.color = Color.clear;
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