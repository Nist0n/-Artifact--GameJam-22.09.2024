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
        
        public void ExpandAllCheats()
        {
            expandableCheats.SetActive(!expandableCheats.activeSelf);
        }
        
        public void AddMaxDreams()
        {
            SoulsCounter.Instance.Dreams += int.MaxValue;
        }
    }
}