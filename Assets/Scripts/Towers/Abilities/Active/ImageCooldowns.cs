using System.Globalization;
using TMPro;
using UnityEngine;
using UnityEngine.Serialization;
using UnityEngine.UI;

namespace Towers.Abilities.Active
{
    public class ImageCooldowns : MonoBehaviour
    {
        [SerializeField] private Image image;
        
        public TextMeshProUGUI TextTimer;
        public Image ParentImage;
        
        private float _timerAbi;
        private float _cd;
        private bool _isGot = false;
    
        void Update()
        {
            if (_isGot && _timerAbi > 0)
            {
                TextTimer.text = Mathf.Floor(_cd - _timerAbi).ToString(CultureInfo.CurrentCulture);
                if (_timerAbi >= _cd)
                {
                    _timerAbi = _cd;
                    image.fillAmount = _timerAbi / _cd;
                }
                else
                {
                    _timerAbi += Time.deltaTime;
                    image.fillAmount = _timerAbi / _cd;
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
            _timerAbi = time;
            _cd = cd;
            _isGot = true;
        }
    }
}
