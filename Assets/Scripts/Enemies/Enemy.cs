using System.Collections;
using Castle;
using Enemies.StateMachine;
using GameConfiguration;
using GameConfiguration.Events;
using GameConfiguration.Settings.Audio;
using StaticClasses;
using UnityEngine;
using UnityEngine.UI;

namespace Enemies
{
    public class Enemy : Core
    {
        [SerializeField] private Image back;
        [SerializeField] private Image front;
        [SerializeField] private AchievementEvent deathEvent;

        private float _lerpTimer;
        private float _slowTimer;
        private float _currentSlowMultiplier = 1f;
        private float _currentSlowDuration = 0f;
        private Coroutine _hpBarCoroutine;

        public RunningState Running;
        public TakingDamageState TakingDamage;
        public FreezingState Freeze;
        public DeathState Death;
        public AttackingState Attacking;
        public CelebratingState Celebrating;
        
        
        private void Start()
        {
            Health = MaxHealth;
            SetStats();
            SetupInstances();
            Set(Running);
        }

        private void Update()
        {
            if (Health < 0 || Health > MaxHealth)
            {
                Health = Mathf.Clamp(Health, 0, MaxHealth);
            }
            
            if (_currentSlowDuration > 0f)
            {
                _slowTimer += Time.deltaTime;
                if (_slowTimer >= _currentSlowDuration)
                {
                    _currentSlowDuration = 0f;
                    _currentSlowMultiplier = 1f;
                    IsSlowness = false;
                    Slowness = 1f;
                }
                else
                {
                    IsSlowness = true;
                    Slowness = _currentSlowMultiplier;
                }
            }
            else
            {
                IsSlowness = false;
                Slowness = 1f;
            }
            
            if (State.IsComplete)
            {
                UpdateEnemyState();
            }
            
            if (Health <= 0 && State != Death)
            {
                Set(Death);
                Invoke(nameof(KillEnemy), 1f);
                return;
            }
            
            if (front.color.a > 0)
            {
                UpdateHpBar();
            }

            State.DoBranch();
        }
        
        private void UpdateEnemyState()
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
            else if (IsAttacking)
            {
                Set(Attacking);
            }
            else if (IsDamaged)
            {
                Set(TakingDamage);
            }
            else
            {
                Set(Running);
            }
        }

        public void HealHP(float heal)
        {
            Health += heal;
        }

        public void ApplySlow(float multiplier, float duration)
        {
            const float minSpeedFraction = 0.2f;
            float cappedMultiplier = Mathf.Clamp(multiplier, minSpeedFraction, 1f);
            
            bool isStronger = cappedMultiplier < _currentSlowMultiplier;
            if (isStronger)
            {
                _currentSlowMultiplier = cappedMultiplier;
                _currentSlowDuration = duration;
                _slowTimer = 0f;
            }
            else if (_currentSlowDuration > 0f)
            {
                if (duration > (_currentSlowDuration - _slowTimer))
                {
                    _currentSlowDuration = _slowTimer + duration;
                }
            }
            else
            {
                _currentSlowMultiplier = cappedMultiplier;
                _currentSlowDuration = duration;
                _slowTimer = 0f;
            }
        }

        private void FixedUpdate()
        {
            State.FixedDoBranch();
        }

        private void KillEnemy()
        {
            GameConfiguration.Directors.Elites.IceTrailManager.Instance.CleanupEnemy(gameObject);
            
            Destroy(gameObject);
            GameEvents.OnEnemyDeath(deathRewards.goldReward, deathRewards.expReward);
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
            AudioManager.Instance.PlayRandomSoundByName("GateBreak", AudioSource);
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