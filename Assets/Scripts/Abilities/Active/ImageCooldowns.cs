using UnityEngine;
using UnityEngine.UI;

public class ImageCooldowns : MonoBehaviour
{
    private Image _image;
    
    private float _timerAbi;

    private float _cd;

    private bool _isGot = false;
    
    void Update()
    {
        if (_isGot && _timerAbi > 0)
        {
            if (_timerAbi >= _cd)
            {
                _timerAbi = _cd;
                _image.fillAmount = _timerAbi / _cd;
            }
            else
            {
                _timerAbi += Time.deltaTime;
                _image.fillAmount = _timerAbi / _cd;
            }
        }
        else if (_image != null)
        {
            _image.fillAmount = 1;
        }
    }

    public void GetProperties(float _timer, float _Cd)
    {
        _timerAbi = _timer;
        _cd = _Cd;
        _isGot = true;
        _image = GetComponent<Image>();
    }
}
