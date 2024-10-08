using System;
using TMPro;
using UnityEngine;

namespace UI.InGame
{
    public class Tooltip : MonoBehaviour
    {
        public TextMeshProUGUI textComponent;

        private void Start()
        {
            gameObject.SetActive(false);
        }

        private void Update()
        {
            // transform.position = Input.mousePosition;
        }
    }
}