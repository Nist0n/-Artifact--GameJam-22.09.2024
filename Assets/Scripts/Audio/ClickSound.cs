using UnityEngine;

namespace Audio
{
    public class ClickSound : MonoBehaviour
    {
        public void PlaySoundHighlighted()
        {
            AudioManager.instance.PlaySFX("Aimed");
        }
    
        public void PlaySoundPressed()
        {
            AudioManager.instance.PlaySFX("Click");
        }
    }
}
