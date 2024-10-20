using TMPro;
using UnityEngine;
using UnityEngine.Rendering.Universal;

namespace Settings
{
    public class URPSettings : MonoBehaviour
    {
        [SerializeField] private TMP_Dropdown shadowRes;

        [SerializeField] private UniversalRenderPipelineAsset[] qualityLevels;

        private void Start()
        {
            shadowRes.value = PlayerPrefs.GetInt("GraphicsPreset", 0);
            QualitySettings.SetQualityLevel(shadowRes.value);
            QualitySettings.renderPipeline = qualityLevels[shadowRes.value];
        }

        public void DropDown_IndexChanged()
        {
            QualitySettings.SetQualityLevel(shadowRes.value);
            QualitySettings.renderPipeline = qualityLevels[shadowRes.value];
            PlayerPrefs.SetInt("GraphicsPreset", shadowRes.value);
        }
    }
}
