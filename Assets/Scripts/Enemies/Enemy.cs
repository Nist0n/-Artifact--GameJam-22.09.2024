using System;
using UnityEngine;
using UnityEngine.AI;

namespace Enemies
{
    public class Enemy : Core
    {
        public RunningState Running;

        private void Start()
        {
            SetupInstances();
            Set(Running);
        }

        private void Update()
        {
            if (State.IsComplete)
            {
                
            }
            
            State.DoBranch();
        }

        private void FixedUpdate()
        {
            State.FixedDoBranch();
        }
    }
}