using System.Collections;
using System.Threading.Tasks;
using Animations.Enemies;
using Castle;
using GameConfiguration;
using GameConfiguration.Cards;
using GameConfiguration.Events;
using GameConfiguration.Settings.Audio;
using StaticClasses;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Serialization;
using UnityEngine.UI;

namespace Enemies.StateMachine
{
    public abstract class Core : MonoBehaviour
    {
        public DeathRewards deathRewards;
        public NavMeshAgent navMeshAgent;
        public AnimationController animationController;
        public Animator animator;
        public StateMachine Machine;
        public AudioSource AudioSource;
        public float Speed;
        public float Slowness;
        public float Health;
        public float MaxHealth;
        public float Damage;
        public bool IsFrozen = false;
        public bool IsSlowness = false;
        public bool IsAttacking = false;
        public bool IsCelebrating;
        public int Level;
        public GameObject Soul;
        public bool IsDamaged = false;
        public Image Back;
        public Image Front;
        public AchievementEvent DeathEvent;
        public bool IsBurning = false;

        protected EnemyState State => Machine.State;
        
        private float _lerpTimer;
        private float _slowTimer;
        private float _currentSlowMultiplier = 1f;
        private float _currentSlowDuration = 0f;
        private Coroutine _hpBarCoroutine;
        private float _burnTimer;
        private float _burnDuration;
        private float _burnDamagePerSecond;
        private Coroutine _burnCoroutine;

        protected void Set(EnemyState newState, bool forceReset = false)
        {
            Machine.Set(newState, forceReset);
        }

        protected void SetupInstances()
        {
            Machine = new StateMachine();

            EnemyState[] allchildStates = GetComponentsInChildren<EnemyState>();
            foreach (EnemyState state in allchildStates)
            {
                state.SetCore(this);
            }
        }
        
        protected void SetStats()
        {
            Level = GameConfig.Instance.EnemyLevel;
            MaxHealth *= Level / 2f;
            Health = MaxHealth;
        }

        protected virtual void UpdateEnemyState()
        {
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
        
        protected void UpdateHpBar()
        {
            float fillFrontBar = Front.fillAmount;
            float fillBackBar = Back.fillAmount;
            float hFraction = Health / MaxHealth;

            if (fillBackBar > hFraction)
            {
                Front.fillAmount = hFraction;
                Back.color = Color.white;
                _lerpTimer += Time.deltaTime;
                float percentComplete = _lerpTimer / 3;
                percentComplete *= percentComplete;
                Back.fillAmount = Mathf.Lerp(fillBackBar, hFraction, percentComplete);
            }
            
            if (fillFrontBar < hFraction)
            {
                Back.color = Color.green;
                Back.fillAmount = hFraction;
                _lerpTimer += Time.deltaTime;
                float percentComplete = _lerpTimer / 3;
                percentComplete *= percentComplete;
                Front.fillAmount = Mathf.Lerp(fillFrontBar, Back.fillAmount, percentComplete);
            }
        }

        protected void SlowControl()
        {
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
        }
        
        protected void KillEnemy()
        {
            GameConfiguration.Directors.Elites.IceTrailManager.Instance.CleanupEnemy(gameObject);
            
            Destroy(gameObject);
            StaticClasses.GameEvents.OnEnemyDeath(deathRewards.goldReward, deathRewards.expReward);
            DeathEvent.TriggerEvent();
        }

        public void ActivateBurn(float duration, float damagePerSecond)
        {
            if (duration <= 0f || damagePerSecond <= 0f)
            {
                return;
            }
            
            if (damagePerSecond > _burnDamagePerSecond)
            {
                _burnDamagePerSecond = damagePerSecond;
            }
            
            if (_burnDuration > 0f)
            {
                float remaining = _burnDuration - _burnTimer;
                if (duration > remaining)
                {
                    _burnDuration = _burnTimer + duration;
                }
            }
            else
            {
                _burnDuration = duration;
                _burnTimer = 0f;
            }

            IsBurning = true;

            if (_burnCoroutine == null)
            {
                _burnCoroutine = StartCoroutine(BurnRoutine());
            }
        }

        private IEnumerator BurnRoutine()
        {
            while (_burnTimer < _burnDuration && Health > 0f)
            {
                ReceiveDamageActivate(_burnDamagePerSecond);
                yield return new WaitForSeconds(1f);
                _burnTimer += 1f;
            }
            
            IsBurning = false;
            _burnCoroutine = null;
            _burnTimer = 0f;
            _burnDuration = 0f;
            _burnDamagePerSecond = 0f;
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
            Front.color = Color.red;
            Back.color = Color.white;
            yield return new WaitForSeconds(3f);
            Front.color = Color.clear;
            Back.color = Color.clear;
        }
    }
}
