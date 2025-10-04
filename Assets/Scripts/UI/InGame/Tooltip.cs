using System;
using TMPro;
using UnityEngine;
using UnityEngine.Serialization;

namespace UI.InGame
{
    public class Tooltip : MonoBehaviour
    {
        public TextMeshProUGUI TextComponent;

        private void Start()
        {
            gameObject.SetActive(false);
        }
    }
}