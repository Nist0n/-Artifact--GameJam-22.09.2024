using UnityEngine;

namespace GameConfiguration.Settings.Audio
{
    public class ClickSound : MonoBehaviour
    {
        public void PlaySoundHighlighted()
        {
            AudioManager.Instance.PlaySFX("Aimed");
        }
    
        public void PlaySoundPressed()
        {
            AudioManager.Instance.PlaySFX("Click");
        }
    }
}
