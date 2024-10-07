using UnityEngine;

public class ClickSound : MonoBehaviour
{
    public void PlaySoundHighlited()
    {
        AudioManager.instance.PlaySFX("Aimed");
    }
    
    public void PlaySoundPressed()
    {
        AudioManager.instance.PlaySFX("Click");
    }
}
