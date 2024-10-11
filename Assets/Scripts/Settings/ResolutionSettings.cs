using System.Collections.Generic;
using System.Linq;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Settings
{
    public class ResolutionSettings : MonoBehaviour
    {
        [SerializeField] private TMP_Dropdown resolutionDropdown;
        [SerializeField] private Toggle fullScreenToggle;
        
        private Resolution[] _resolutions;
        
        private void Start()
        {
            _resolutions = Screen.resolutions;
            resolutionDropdown.ClearOptions();
            
            List<string> options = new List<string>();
            foreach (Resolution res in _resolutions)
            {
                options.Add($"{res.width}x{res.height} {res.refreshRateRatio}hz");
            }
            resolutionDropdown.AddOptions(options);
            
            int defaultResolutionIndex = _resolutions.ToList().FindIndex(x => x is { width: 1920, height: 1080 });
            
            int width = PlayerPrefs.GetInt("ResolutionWidth", 0);
            int height = PlayerPrefs.GetInt("ResolutionHeight", 0);
            
            if (width != 0 && height != 0)
            {
                defaultResolutionIndex = _resolutions.ToList().FindIndex(x => x.width == width && x.height == height);
            }
            
            resolutionDropdown.value = defaultResolutionIndex;
            // By default, full screen should be on
            fullScreenToggle.isOn = PlayerPrefs.GetInt("FullScreen", 1) == 1;
        }
        
        public void OnResolutionChanged()
        {
            bool fullScreen = fullScreenToggle.isOn;
            Resolution resolution = _resolutions[resolutionDropdown.value];
            
            if (Screen.width == resolution.width && Screen.height == resolution.height)
            {
                return;
            }
            
            Screen.SetResolution(resolution.width, resolution.height, fullScreen);
            PlayerPrefs.SetInt("ResolutionWidth", resolution.width);
            PlayerPrefs.SetInt("ResolutionHeight", resolution.height);
        }

        public void OnFullScreenValueChanged()
        {
            Screen.fullScreen = fullScreenToggle.isOn;
            PlayerPrefs.SetInt("FullScreen", fullScreenToggle.isOn ? 1 : 0);
        }
    }
}