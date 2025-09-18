using UnityEngine;

namespace Abilities.Active
{
    public class ActiveAbility : MonoBehaviour
    {
        [SerializeField] private bool isAbilityUsed = false;

        [SerializeField] private float abilityCooldown;

        [SerializeField] private float timer;

        [SerializeField] private float rangeOfAction;

        [SerializeField] private GameObject actionCollider;

        [SerializeField] private GameObject actionRadius;

        [SerializeField] private float cost;

        [SerializeField] private string activeAbilityName;

        [SerializeField] private string description;

        private void Update()
        {
            CheckAbilityCooldown();
        }


        [ContextMenu("Z")]
        public void ActivateAbility(Vector3 pos)
        {
            if (!isAbilityUsed)
            {
                Instantiate(actionCollider, pos, Quaternion.identity);
                isAbilityUsed = true;
            }
        }

        public void ActivateAbilityRadius(Vector3 pos)
        {
            actionRadius.transform.position = pos;
        }

        protected void CheckAbilityCooldown()
        {
            if (isAbilityUsed)
            {
                timer += Time.deltaTime;
                if (timer > abilityCooldown)
                {
                    isAbilityUsed = false;
                    timer = 0;
                }
            }
        }

        public float Cost() => cost;
    
        public float RangeOfAction() => rangeOfAction;
    
        public bool IsAbilityUsed() => !isAbilityUsed;
    
        public void ActionRadius(GameObject radius) => actionRadius = radius;

        public float Timer() => timer;

        public float AbilityCooldown() => abilityCooldown;

        public void ChangeAbilityCooldown(float percent) => abilityCooldown *= percent;

        public string Description() => description;
        
        public string Name() => activeAbilityName;
    }
}
