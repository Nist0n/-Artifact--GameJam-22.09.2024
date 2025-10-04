using System.Globalization;
using StaticClasses;
using TMPro;
using UnityEngine;
using UnityEngine.Serialization;
using UnityEngine.UI;

namespace Towers.Abilities.Active
{
    public class ImageCooldowns : RechargeAbility
    {
        public Image ParentImage;
        
        private void Update()
        {
            DisplayOfCd();
        }
    }
}
