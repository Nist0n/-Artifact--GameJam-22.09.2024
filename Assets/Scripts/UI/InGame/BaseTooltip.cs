using System;
using TMPro;
using UnityEngine;
using UnityEngine.Serialization;

namespace UI.InGame
{
    public class BaseTooltip : MonoBehaviour
    {
        [SerializeField] protected TMP_Text tooltipText;
        [SerializeField] protected string textToShow;
        [SerializeField] protected Vector3 offset = new(0, -75, 0);

        private void Update()
        {
            gameObject.transform.position = Input.mousePosition + offset;
        }

        public virtual void ShowTooltip(GameObject obj = null)
        {
            gameObject.transform.position = Input.mousePosition + offset;
            gameObject.SetActive(true);
            tooltipText.text = textToShow;
        }

        public void HideTooltip()
        {
            gameObject.SetActive(false);
            tooltipText.text = String.Empty;
        }
    }
}
