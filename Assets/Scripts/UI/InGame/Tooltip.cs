using System;
using TMPro;
using UnityEngine;
using Cursor = UnityEngine.Cursor;

namespace UI.InGame
{
    public class Tooltip : MonoBehaviour
    {
        public TextMeshProUGUI textComponent;
        private GameObject _tooltipObj;

        private void Start()
        {
            // _tooltipObj = GameObject.FindGameObjectWithTag("Tooltip");
            // Debug.Log(_tooltipObj);
            Cursor.visible = true;
            _tooltipObj.SetActive(false);
        }
        
        private void Update()
        {
            gameObject.transform.position = Input.mousePosition;
        }

        public void SetAndShowTooltip(GameObject obj)
        {
            // ga = GameObject.FindWithTag("Tooltip");
            gameObject.SetActive(true);
            Debug.Log("a");
            float cost = 0;
            if (obj.TryGetComponent(out PassiveAbilities passive))
            {
                cost = passive.Cost(obj.name);
            }
            else if (obj.TryGetComponent(out ActiveAbility active))
            {
                cost = active.Cost(obj.name);
            }
            else
            {
                Debug.Log("couldn't find script");
            }
            Debug.Log(cost);
            
            _tooltipObj.GetComponent<Tooltip>().textComponent.text = $"Стоимость: {cost}";
        }
        
        public void HideTooltip()
        {
            Debug.Log("b");
            gameObject.SetActive(false);
            gameObject.GetComponent<Tooltip>().textComponent.text = string.Empty;
        }
    }
}