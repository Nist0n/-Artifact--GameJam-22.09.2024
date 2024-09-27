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

    public void AddSouls() {
        currentSouls++;
        UpdateSouls();
    }
    public void DecreaseSouls() {
        currentSouls--;
        UpdateSouls();
    }
    public void UpdateSouls() {
        text.text = $"{NewText}{currentSouls.ToString()}";
    }
}