using UnityEngine;
using UnityEngine.SceneManagement;

public class QuitToMenu : MonoBehaviour
{
    public void Quit()
    {
        SceneManager.LoadScene("MainMenu");
    }
}
