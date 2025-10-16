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
            
            SlowControl();
            
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
            
            if (Front.color.a > 0)
            {
                UpdateHpBar();
            }

            State.DoBranch();
        }
        
        protected override void UpdateEnemyState()
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

        private void FixedUpdate()
        {
            State.FixedDoBranch();
        }
    }
}