using System.Collections.Generic;
using UnityEngine;

namespace UI.InGame
{
    public class Lose : MonoBehaviour
    {
        [SerializeField] private List<GameObject> objectsToHide;
        
        [SerializeField] private GameObject loseUI;
        
        private bool _gameRun = true;
        
        void Update()
        {
            if (GameConfig.GameConfig.Instance.GameIsOverByLose && _gameRun) {
                _gameRun = false;
                LoseMode();
            }
        }

        private void LoseMode() {
            Cursor.visible = true;
            loseUI.SetActive(true);
            foreach (var gameObj in objectsToHide)
            {
                gameObj.SetActive(false);
            }
        }
    }
}