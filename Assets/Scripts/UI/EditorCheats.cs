using System;
using System.Globalization;
using StaticClasses;
using TMPro;
using UI.InGame;
using UnityEngine;

namespace UI
{
    public class EditorCheats : MonoBehaviour
    {
        [SerializeField] private GameObject cheatMenu;
        [SerializeField] private GameObject expandableCheats;
        [SerializeField] private TMP_Text gameSpeedValueText;
        
        
        private void Start()
        {
            #if UNITY_EDITOR
                cheatMenu.SetActive(true);
            #endif
        }

        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.A))
            {
                GameEvents.OnCheatGameWin();
            }
        }

        public void ExpandAllCheats()
        {
            expandableCheats.SetActive(!expandableCheats.activeSelf);
        }
        
        public void AddMaxDreams()
        {
            SoulsCounter.Instance.Dreams += int.MaxValue;
        }

        public void WinGame()
        {
            GameEvents.OnCheatGameWin();
        }

        public void OnChangeGameSpeed(float value)
        {
            // An event invoke doesn't make a lot of sense since
            // this code is very unlikely to be repeated elsewhere
            Time.timeScale = value;
            gameSpeedValueText.text = value.ToString("0.00");
        }
    }
}