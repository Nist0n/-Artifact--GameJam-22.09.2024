using System;
using System.Collections;
using UnityEngine;

public class FirstTimeCheck : MonoBehaviour
{
    [SerializeField] GameObject strelka1;
    [SerializeField] GameObject strelka2;

    private const string FirstLaunchKey = "firstLaunch";

    private void Awake()
    {
        if (PlayerPrefs.HasKey(FirstLaunchKey))
        {
            return;
        }

        else
        {
            PlayerPrefs.SetInt(FirstLaunchKey, 1);

            PlayerPrefs.Save();

            StartCoroutine(FirstTimeSetup());
        }
    }

    IEnumerator FirstTimeSetup()
    {
        strelka1.SetActive(true);
        yield return new WaitForSeconds(2f);
        strelka1.SetActive(false);

        strelka2.SetActive(true);
        yield return new WaitForSeconds(2f);
        strelka2.SetActive(false);
    }
}