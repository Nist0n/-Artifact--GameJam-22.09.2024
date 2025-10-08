using UnityEngine;

namespace UI.InGame
{
    public class TowerControlsTooltip : BaseTooltip
    {
        public override void ShowTooltip(GameObject obj)
        {
            gameObject.transform.position = Input.mousePosition + offset;
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
    }
}