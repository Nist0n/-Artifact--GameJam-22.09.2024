using System;
using UnityEngine;
using UnityEngine.Audio;
using UnityEngine.UI;

namespace GameConfiguration.Settings.Audio
{
    public class VolumeSettings : MonoBehaviour
    {
        [SerializeField] private AudioMixer audioMixer;
        [SerializeField] private Slider musicSlider;
        [SerializeField] private Slider SFXSlider;

        private void Start()
        {
            if (PlayerPrefs.HasKey("musicVolume") && PlayerPrefs.HasKey("SFXVolume"))
            {
                LoadVolume();
            }
            else
            {
                SetMusicVolume();
                SetSFXVolume();
            }
        }

        public void SetMusicVolume()
        {
            float volume = musicSlider.value;
            audioMixer.SetFloat("music", MathF.Log10(volume) * 20);
            PlayerPrefs.SetFloat("musicVolume", volume);
        }

        public void SetSFXVolume()
        {
            float volume = SFXSlider.value;
            audioMixer.SetFloat("SFX", MathF.Log10(volume) * 20);
            PlayerPrefs.SetFloat("SFXVolume", volume);
        }

        private void LoadVolume()
        {
            float musicVolume = PlayerPrefs.GetFloat("musicVolume");
            musicSlider.value = musicVolume;

            float sfxVolume = PlayerPrefs.GetFloat("SFXVolume");
            SFXSlider.value = sfxVolume;
        }
    }
}
