using UnityEngine;

namespace Sound
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
