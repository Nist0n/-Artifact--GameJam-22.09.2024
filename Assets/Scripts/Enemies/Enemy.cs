using System;
using UnityEngine;

namespace Enemies
{
    public class Enemy : Core
    {
        private void Start()
        {
            SetupInstances();
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