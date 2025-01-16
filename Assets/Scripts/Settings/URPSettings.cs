using TMPro;
using UnityEngine;
using UnityEngine.Rendering.Universal;

namespace Settings
{
    public class URPSettings : MonoBehaviour
    {
        [SerializeField] private TMP_Dropdown graphicsLevelDropdown;

        [SerializeField] private UniversalRenderPipelineAsset[] qualityLevels;

        [SerializeField] private TMP_Dropdown shadowResolutionDropdown;
        
        private void Start()
        {
            graphicsLevelDropdown.value = PlayerPrefs.GetInt("GraphicsPreset", 0);
            if (QualitySettings.GetQualityLevel() == graphicsLevelDropdown.value)
            {
                return;
            }
            
            ChangeGraphicsLevel(graphicsLevelDropdown.value);
            AdjustShadowResolutionDropdown();
        }

        private void AdjustShadowResolutionDropdown()
        {
            UniversalRenderPipelineAsset renderPipelineAsset = QualitySettings.renderPipeline as UniversalRenderPipelineAsset;
            if (!renderPipelineAsset)
            {
                Debug.LogWarning("No render pipeline asset found");
                return;
            }

            shadowResolutionDropdown.value = renderPipelineAsset.mainLightShadowmapResolution;
        }

        public void GraphicsDropDown_IndexChanged()
        {
            ChangeGraphicsLevel(graphicsLevelDropdown.value);
        }

        private void ChangeGraphicsLevel(int level)
        {
            QualitySettings.SetQualityLevel(level);
            QualitySettings.renderPipeline = qualityLevels[level];
            PlayerPrefs.SetInt("GraphicsPreset", level);
            MaintainAntialiasing();
        }
        
        private void MaintainAntialiasing()
        {
            int aaModeIndex = PlayerPrefs.GetInt(AntialiasingSettings.CameraAaKey, 0);
            int sampleCount = PlayerPrefs.GetInt(AntialiasingSettings.MSAAKey, 1);
            
            AntialiasingSettings.ChangeAASettings(aaModeIndex, Camera.main);
            AntialiasingSettings.ChangeMSAASettings(sampleCount);
        }

        public void ChangeShadowResolution()
        {
            UniversalRenderPipelineAsset renderPipelineAsset = QualitySettings.renderPipeline as UniversalRenderPipelineAsset;
            if (!renderPipelineAsset)
            {
                Debug.LogWarning("No render pipeline asset found");
                return;
            }

            int selectedIndex = shadowResolutionDropdown.value;
            // renderPipelineAsset.mainLightShadowmapResolution = shadowResolutionDropdown.options[selectedIndex].text;
        }
    }
}
