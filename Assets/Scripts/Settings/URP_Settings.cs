using System;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using ShadowQuality = UnityEngine.ShadowQuality;
using ShadowResolution = UnityEngine.ShadowResolution;

public class URP_Settings : MonoBehaviour
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
