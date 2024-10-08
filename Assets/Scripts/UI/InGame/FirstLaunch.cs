using System.Collections;
using UnityEngine;

namespace UI.InGame
{
    public class FirstTimeCheck : MonoBehaviour
    {
        [SerializeField] GameObject firstLaunchText;
        [SerializeField] GameObject arrow;

        private const string FirstLaunchKey = "FirstLaunch";

        private void Awake()
        {
            if (PlayerPrefs.HasKey(FirstLaunchKey))
            {
                return;
            }
        
            PlayerPrefs.SetInt(FirstLaunchKey, 1);

            PlayerPrefs.Save();

            StartCoroutine(FirstTimeSetup());
        }

        private IEnumerator FirstTimeSetup()
        {
            firstLaunchText.SetActive(true);
            yield return new WaitForSeconds(5f);
            firstLaunchText.SetActive(false);

            arrow.SetActive(true);
            yield return new WaitForSeconds(1f);
            arrow.SetActive(false);
        }
    }
}