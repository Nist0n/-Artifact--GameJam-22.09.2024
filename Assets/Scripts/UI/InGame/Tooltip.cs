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
            _tooltipObj = GameObject.FindGameObjectWithTag("Tooltip");
            Cursor.visible = true;
            gameObject.SetActive(false);
        }
        
        private void Update()
        {
            transform.position = Input.mousePosition;
        }

        public void SetAndShowTooltip(GameObject obj)
        {
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
            Debug.Log(gameObject);
            textComponent.text = $"Стоимость: {cost}";
        }
        
        public void HideTooltip()
        {
            Debug.Log("b");
            gameObject.SetActive(false);
            textComponent.text = string.Empty;
        }
    }
}