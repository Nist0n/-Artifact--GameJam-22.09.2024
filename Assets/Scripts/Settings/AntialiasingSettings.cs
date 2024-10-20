using System;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.Rendering.Universal;

namespace Settings
{
    public class AntialiasingSettings : MonoBehaviour
    {
        [SerializeField] private TMP_Dropdown cameraAaDropdown;
        [SerializeField] private TMP_Dropdown msaaDropdown;

        [SerializeField] private List<String> options;
        
        private const string CameraAaKey = "CAMERA_AA";
        private const string MSAAKey = "MSAA";

        private UniversalRenderPipelineAsset _renderPipelineAsset;
        
        private void Start()
        {
            _renderPipelineAsset = QualitySettings.renderPipeline as UniversalRenderPipelineAsset;
            if (!_renderPipelineAsset)
            {
                Debug.LogWarning("No render pipeline found");
                return;
            }
            
            // Set saved values
            int aaModeIndex = PlayerPrefs.GetInt(CameraAaKey, 0);
            int sampleCount = PlayerPrefs.GetInt(MSAAKey, 1);
            
            ChangeAASettings(aaModeIndex, Camera.main);
            ChangeMSAASettings(sampleCount);
        }

        public void OnCameraAaDropdownChanged()
        {
            int currentValue = cameraAaDropdown.value;
            ChangeAASettings(currentValue, Camera.main);
            AdjustMSAADropdown(currentValue);
        }

        public void OnCameraMsaaDropdownChanged()
        {
            int currentValue = msaaDropdown.value;
            switch (currentValue)
            {
                case 1:
                    ChangeMSAASettings(2);
                    break;
                case 2:
                    ChangeMSAASettings(4);
                    break;
                case 3:
                    ChangeMSAASettings(8);
                    break;
                default:
                    ChangeMSAASettings(1);
                    break;
            }
            
            AdjustAADropdown();
        }
        
        /// <summary>
        /// Changes antialiasing parameter in camera rendering settings.
        /// </summary>
        /// 
        /// <param name="aaModeIndex">
        ///     Antialiasing mode. 0 - No antialiasing, 1 - FXAA, 2 - SMAA, <br/> 3 - TAA. <br/>
        ///     Note that TAA only works when MSAA is off. <br/>
        ///     If MSAA is on and 3 is passed, antialiasing will be set to SMAA instead.
        /// </param>
        /// /// <param name="cameraObject">
        ///     Camera object to set antialiasing for.
        /// </param>
        public void ChangeAASettings(int aaModeIndex, Camera cameraObject)
        {
            if (aaModeIndex == 3 && _renderPipelineAsset.msaaSampleCount != 1) // if MSAA is on
            {
                aaModeIndex = 2;
            }
            AntialiasingMode aaMode = (AntialiasingMode) aaModeIndex;
            
            cameraObject.GetComponent<UniversalAdditionalCameraData>().antialiasing = aaMode;
        }

        /// <summary>
        /// Changes MSAA setting for current URP asset.
        /// </summary>
        /// <param name="sampleCount">
        ///     MSAA sample count. <br/> 1 - MSAA disabled. Other possible values are 2, 4, 8.
        /// </param>
        public void ChangeMSAASettings(int sampleCount)
        {
            if (!_renderPipelineAsset)
            {
                Debug.LogWarning("No render pipeline asset found");
                return;
            }

            List<int> possibleValues = new() { 1, 2, 4, 8 };
            if (!possibleValues.Contains(sampleCount))
            {
                Debug.LogWarning("Invalid sample count \n Possible values are: 1, 2, 4, 8");
            }
            
            _renderPipelineAsset.msaaSampleCount = sampleCount;
        }

        private void AdjustAADropdown()
        {
            // If MSAA is on, TAA needs to be turned off
            if (_renderPipelineAsset.msaaSampleCount != 1)
            {
                int currentValue = cameraAaDropdown.value;
                cameraAaDropdown.ClearOptions();
                cameraAaDropdown.AddOptions(options.GetRange(0, 3));
                cameraAaDropdown.value = currentValue == 3 ? 2 : currentValue;
            }
            else
            {
                cameraAaDropdown.AddOptions(options.GetRange(3, 1));
            }
        }

        private void AdjustMSAADropdown(int aaModeIndex)
        {
            // If TAA is on, MSAA needs to be turned off
            if (aaModeIndex == 3)
            {
                msaaDropdown.value = 0;
                msaaDropdown.interactable = false;
            }
            else
            {
                msaaDropdown.interactable = true;
            }
        }
    }
}