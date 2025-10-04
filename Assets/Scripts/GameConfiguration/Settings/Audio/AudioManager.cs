using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Audio;

namespace GameConfiguration.Settings.Audio
{
    public class AudioManager : MonoBehaviour
    {
        public static AudioManager Instance;

        [SerializeField] private AudioSource musicSource;
        [SerializeField] private AudioSource SFXSource;
        [SerializeField] private AudioResource musicAudioRandomController;
        [SerializeField] private List<Sound> music, sounds;

        private void Awake()
        {
            if (!Instance)
            {
                Instance = this;
                DontDestroyOnLoad(gameObject);
            }
            else
            {
                Destroy(gameObject);
            }
        }
        
        public void PlayMusic(string soundName)
        {
            Sound s = music.Find(x => x.name == soundName);

            if (s == null)
            {
                Debug.LogWarning("Music: " + soundName + " not found!");
                return;
            }
            
            musicSource.clip = s.audio;
            musicSource.Play();
        }

        public void PlaySFX(string soundName)
        {
            Sound s = sounds.Find(x => x.name == soundName);

            if (s == null)
            {
                Debug.LogWarning("Sound " + soundName + " not found!");
                return;
            }
            
            SFXSource.PlayOneShot(s.audio);
        }

        public void PlayRandomSoundByName(string soundName, AudioSource source)
        {
            List<Sound> matchingSounds = sounds.FindAll(sound => sound.name == soundName);

            if (matchingSounds.Count > 0)
            {
                int randomIndex = Random.Range(0, matchingSounds.Count);
                Sound randomSound = matchingSounds[randomIndex];

                source.PlayOneShot(randomSound.audio);
            }
        }

        public void PlayWalkSound(string soundName, AudioSource source)
        {
            List<Sound> matchingSounds = sounds.FindAll(sound => sound.name == soundName);

            if (matchingSounds.Count > 0)
            {
                int randomIndex = Random.Range(0, matchingSounds.Count);
                Sound randomSound = matchingSounds[randomIndex];

                source.clip = randomSound.audio;
                source.Play();
            }
        }

        public void PlayLocalSound(string soundName,AudioSource source)
        {
            Sound s = sounds.Find(sound => sound.name == soundName);

            if (s != null)
            {
                source.PlayOneShot(s.audio);
            }
        }

        public void StopMusic()
        {
            musicSource.Stop();
        }

        public void StartMusicShuffle()
        {
            musicSource.resource = musicAudioRandomController;
            musicSource.Play();
        }

        public void StopMusicSourceLoop()
        {
            musicSource.loop = false;
        }
    }
}
