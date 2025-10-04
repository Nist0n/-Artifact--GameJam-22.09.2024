using System.Collections.Generic;
using GameConfiguration;
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
            if (GameConfig.Instance.EnemyList.Count <= 0 && _gameRun && timer < 0) {
                _gameRun = false;
                GameConfig.Instance.HasWon = true;
            }

            if (GameConfig.Instance.HasWon)
            {
                VictoryMode();
            }
        }

        private void VictoryMode()
        {
            victoryUI.SetActive(true);
            foreach (var obj in objects)
            {
                obj.SetActive(false);
            }
        }
    }
}
