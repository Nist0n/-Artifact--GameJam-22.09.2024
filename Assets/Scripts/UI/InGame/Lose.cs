using UnityEngine;

namespace UI.InGame
{
    public class Lose : MonoBehaviour
    {
        [SerializeField] private GameObject loose;
        [SerializeField] private GameObject background;
        [SerializeField] private GameObject pauseButton;
        [SerializeField] private GameObject dreams;
        [SerializeField] private GameObject bar;
        private bool _gameRun = true;
        
        void Update()
        {
            if (GameConfig.Instance.GameIsOverByLose && _gameRun) {
                _gameRun = false;
                LooseMode();
            }
        }

        private void LooseMode() {
            Cursor.visible = true;
            pauseButton.SetActive(!pauseButton.activeSelf);
            loose.SetActive(!loose.activeSelf);
            bar.SetActive(!bar.activeSelf);
            dreams.SetActive(!dreams.activeSelf);
        }
    }
}