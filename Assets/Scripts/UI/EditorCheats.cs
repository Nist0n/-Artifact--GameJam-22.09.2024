using System;
using StaticClasses;
using UI.InGame;
using UnityEngine;

namespace UI
{
    public class EditorCheats : MonoBehaviour
    {
        [SerializeField] private GameObject cheatMenu;
        [SerializeField] private GameObject expandableCheats;
        
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
    }
}