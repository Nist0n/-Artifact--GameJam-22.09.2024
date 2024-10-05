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
    
    private bool _shadowVisibility = false;

    private void Start()
    {
        PopulateList();
    }

    public void SetShadows()
    {
        if (!_shadowVisibility)
        {
            
            Debug.Log(QualitySettings.shadows);
            _shadowVisibility = true;
        }
        else
        {
            QualitySettings.shadows = ShadowQuality.Disable;
            Debug.Log(QualitySettings.shadows);
            _shadowVisibility = false;
        }
    }

    public void DropDown_IndexChanged(int index)
    {
        index = shadowRes.value;
        QualitySettings.shadowResolution = (ShadowResolution)index;
    }

    private void PopulateList()
    {
        string[] enumNames = Enum.GetNames(typeof(ShadowResolution));
        List<string> names = new List<string>(enumNames);
        
        shadowRes.AddOptions(names);
    }
}
