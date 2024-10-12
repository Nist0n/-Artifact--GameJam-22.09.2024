using System.Collections.Generic;
using UnityEngine;

namespace UI.InGame
{
    public class Victory : MonoBehaviour
    {
        [SerializeField] private List<GameObject> objects;
        
        [SerializeField] private GameObject victoryUI;
        
        [SerializeField] private float timer;
        private bool _gameRun = true;
        
        void Update()
        {
            if (timer > 0) timer -= Time.deltaTime;
            if (GameConfig.GameConfig.Instance.EnemyList.Count <= 0 && _gameRun && timer < 0) {
                _gameRun = false;
                VictoryMode();  
            }
        }

        private void VictoryMode()
        {
            GameConfig.GameConfig.Instance.HasWon = true;
            Cursor.visible = true;
            victoryUI.SetActive(true);
            foreach (var obj in objects)
            {
                obj.SetActive(false);
            }
        }
    }
}
