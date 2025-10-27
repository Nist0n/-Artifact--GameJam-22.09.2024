using System;
using System.Globalization;
using TMPro;
using UnityEngine;
using UnityEngine.Serialization;
using UnityEngine.UI;

namespace Towers
{
    public class RechargeAbility : MonoBehaviour
    {
        public Image AbilityImage;
        public TextMeshProUGUI TextTimer;
        public Image ParentImage;

        private float _timer;
        private float _cd;

        private void Update()
        {
            if (_timer > 0 || AbilityImage.fillAmount < 1)
            {
                DisplayOfCd();
            }
            else
            {
                TextTimer.text = null;
            }
        }

        private void DisplayOfCd()
        {
            if (_timer > 0)
            {
                TextTimer.text = Mathf.Floor(_cd - _timer).ToString(CultureInfo.CurrentCulture);
                if (_timer >= _cd)
                {
                    _timer = _cd;
                    AbilityImage.fillAmount = _timer / _cd;
                }
                else
                {
                    _timer += Time.deltaTime;
                    AbilityImage.fillAmount = _timer / _cd;
                }
            }
            else if (AbilityImage)
            {
                TextTimer.text = null;
                AbilityImage.fillAmount = 1;
            }
        }
        
        public void GetProperties(float time, float cd)
        {
            _timer = time;
            _cd = cd;
        }
    }
}
