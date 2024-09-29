using TMPro;
using UnityEngine;
using Cursor = UnityEngine.Cursor;

namespace UI.InGame
{
    public class Tooltip : MonoBehaviour
    {
        public TextMeshProUGUI textComponent;

        private void Start()
        {
            Cursor.visible = true;
            gameObject.SetActive(false);
        }
        
        private void Update()
        {
            transform.position = Input.mousePosition;
        }

        public void SetAndShowTooltip()
        {
            Debug.Log("a");
            // textComponent.text = 
        }
        
        public void HideTooltip()
        {
            Debug.Log("b");
            gameObject.SetActive(false);
            textComponent.text = string.Empty;
        }
    }
}