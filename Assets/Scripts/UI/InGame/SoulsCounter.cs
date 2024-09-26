using TMPro;
using System.Collections.Generic;
using TMPro.Examples;
using UnityEngine;
using UnityEngine.UI;

public class SoulsCounter : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI text;
    [SerializeField] private string NewText;
    public int currentSouls = 0;

    private void Update() {
        if(Input.GetKeyDown(KeyCode.S)) {
            AddSouls();
        }
    }
    public void AddSouls() {
        currentSouls++;
        UpdateSouls();
    }
    public void UpdateSouls() {
        text.text = $"{NewText}{currentSouls.ToString()}";
    }
}