using Audio;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Audio;
using static Unity.VisualScripting.Member;

public class AudioManager : MonoBehaviour
{
    public static AudioManager instance;

    [SerializeField] AudioSource musicSource;
    [SerializeField] AudioSource SFXSource;
    [SerializeField] List<Sound> music, sounds;

    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }
    }

    private void Start()
    {
        PlayMusic("MainMenu");
    }

    public void PlayMusic(string soundName)
    {
        Sound s = music.Find(x => x.name == soundName);

        if (s != null)
        {
            musicSource.clip = s.audio;
            musicSource.Play();
        }
    }

    public void PlaySFX(string soundName)
    {
        Sound s = sounds.Find(x => x.name == soundName);

        if (s != null)
        {
            SFXSource.PlayOneShot(s.audio);
        }
    }

    public void PlayRandomSoundByName(string soundName, AudioSource source)
    {
        List<Sound> matchingSounds = sounds.FindAll(sound => sound.name == soundName);

        if (matchingSounds.Count > 0)
        {
            Debug.Log("Workat PlayRandomSoundByName");
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
            Debug.Log("Workat PlayWalkSound");
            int randomIndex = Random.Range(0, matchingSounds.Count);
            Sound randomSound = matchingSounds[randomIndex];

            source.clip = randomSound.audio;
            source.loop = true;
            source.Play();
        }
    }

    public void PlayLocalSound(string soundName,AudioSource source)
    {
        Sound s = sounds.Find(sound => sound.name == soundName);

        if (s != null)
        {
            Debug.Log("Workat PlayLocalSound");
            source.PlayOneShot(s.audio);
        }
    }

    public void StopSound(AudioSource source)
    {
        source.Stop();
    }
}
