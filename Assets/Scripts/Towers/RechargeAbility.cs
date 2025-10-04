using System.Globalization;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Towers
{
    public class RechargeAbility : MonoBehaviour
    {
        [SerializeField] protected Image image;
        
        public TextMeshProUGUI TextTimer;

        private float _timer;
        private float _cd;

        protected void DisplayOfCd()
        {
            if (_timer > 0)
            {
                TextTimer.text = Mathf.Floor(_cd - _timer).ToString(CultureInfo.CurrentCulture);
                if (_timer >= _cd)
                {
                    _timer = _cd;
                    image.fillAmount = _timer / _cd;
                }
                else
                {
                    _timer += Time.deltaTime;
                    image.fillAmount = _timer / _cd;
                }
            }
            else if (image)
            {
                TextTimer.text = null;
                image.fillAmount = 1;
            }
        }
        
        public void GetProperties(float time, float cd)
        {
            _timer = time;
            _cd = cd;
        }
    }
}
