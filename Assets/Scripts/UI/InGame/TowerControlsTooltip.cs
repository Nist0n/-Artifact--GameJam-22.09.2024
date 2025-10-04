using System;
using TMPro;
using UnityEngine;

namespace UI.InGame
{
    public class TowerControlsTooltip : MonoBehaviour
    {
        [SerializeField] private TMP_Text tooltipText;
        
        private readonly Vector3 _offset = new(-75, -75, 0);

        private void Update()
        {
            gameObject.transform.position = Input.mousePosition + _offset;
        }

        public void ShowTooltip(GameObject obj)
        {
            gameObject.transform.position = Input.mousePosition + _offset;
            gameObject.SetActive(true);
            string info;
            if (obj.name == "EnterTowerButton")
            {
                info = "Управлять";
            }
            else if (obj.name == "OpenUpgradesButton")
            {
                info = "Открыть магазин";
            }
            else
            {
                info = "Ошибка!";
            }

            tooltipText.text = info;
        }

        public void HideTooltip()
        {
            gameObject.SetActive(false);
            tooltipText.text = String.Empty;
        }
    }
}