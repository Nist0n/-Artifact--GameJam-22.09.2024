using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.InputSystem.XR.Haptics;
using UnityEngine.UI;

public class Filliing : MonoBehaviour
{
    private int souls;
    [SerializeField] private SoulsCounter soulsCounter;

    [SerializeField] private float FillAmount;
    
    [SerializeField] private Image image;

    void Start() {
        image = this.GetComponent<Image>();
        soulsCounter = FindFirstObjectByType<SoulsCounter>();
    }

    void Update() {
        souls = soulsCounter.currentSouls;
        image.fillAmount = souls / FillAmount;
    }
}
