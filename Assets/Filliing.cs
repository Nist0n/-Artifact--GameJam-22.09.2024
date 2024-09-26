using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.InputSystem.XR.Haptics;
using UnityEngine.UI;

public class Filliing : MonoBehaviour
{
    private int souls;
    private SoulsCounter soulsCounter;
    private int FillAmount;
    
    [SerializeField] private Image image;
    void Update() {
        souls = soulsCounter.currentSouls;
        image.fillAmount = souls;
    }
}
