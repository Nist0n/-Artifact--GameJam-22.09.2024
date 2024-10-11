using UnityEngine;

namespace UI.InGame
{
    public class Victory : MonoBehaviour
    {
        [SerializeField] private GameObject victory;
        [SerializeField] private GameObject dreams;
        [SerializeField] private GameObject bar;
        [SerializeField] private float timer;
        private bool _gameRun = true;
        
        void Update()
        {
            if(timer > 0) timer -= Time.deltaTime;
            if (GameConfig.GameConfig.Instance.EnemyList.Count <= 0 && _gameRun && timer < 0) {
                _gameRun = false;
                VictoryMode();  
            }
        }

        private void VictoryMode()
        {
            GameConfig.GameConfig.Instance.HasWon = true;
            Cursor.visible = true;
            victory.SetActive(!victory.activeSelf);
            bar.SetActive(!bar.activeSelf);
            dreams.SetActive(!dreams.activeSelf);
        }
    }
}
