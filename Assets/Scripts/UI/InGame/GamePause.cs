using System.Collections;
using Towers;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GamePause : MonoBehaviour
{
    public static GamePause Instance;

    [SerializeField] GameObject pauseButton;
    [SerializeField] GameObject background;
    [SerializeField] GameObject continueGameButton;
    [SerializeField] GameObject shopUI;

    [SerializeField] CinemachineCamera cameraMain;
    [SerializeField] CinemachineCamera cameraShop;

    public Button[] towerButtons;

    public Animator shopButtonsAnimator;

    private int selectedTowerIndex = -1;

    public bool gameIsPaused;

    private void Start()
    {
        foreach (Button button in towerButtons)
        {
            button.onClick.AddListener(() => OnTowerSelected(button));
        }
    }

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
        }
        else
        {
            Destroy(gameObject);
        }
    }

    private void Update()
    {
        StartCoroutine(ShopSwitch());

        if (Input.GetKeyUp(KeyCode.Escape))
        {
            gameIsPaused = !gameIsPaused;
            PauseGame();
            pauseButton.SetActive(!pauseButton.activeSelf);
            continueGameButton.SetActive(!continueGameButton.activeSelf);
            background.SetActive(!background.activeSelf);
        }

        if (pauseButton.activeSelf)
        {
            if (pauseButton.GetComponent<Animator>().GetCurrentAnimatorClipInfo(0)[0].clip.name == "Selected")
            {
                Invoke("OpenSettings", 0.01f);
            }

        }

        if (continueGameButton.activeSelf)
        {
            if (continueGameButton.GetComponent<Animator>().GetCurrentAnimatorClipInfo(0)[0].clip.name == "Selected")
            {
                ResumeGame();
                Invoke("CloseSettings", 0.01f);
            }
        }
    }

    public void PauseGame()
    {
        if (gameIsPaused)
        {
            Time.timeScale = 0f;
        }
        else
        {
            Time.timeScale = 1;
        }
    }

    public void ResumeGame()
    {
        Time.timeScale = 1;
    }

    public void CloseSettings()
    {
        pauseButton.SetActive(true);
        background.SetActive(false);
        continueGameButton.SetActive(false);
    }

    public void OpenSettings()
    {
        gameIsPaused = !gameIsPaused;
        PauseGame();
        pauseButton.SetActive(false);
        continueGameButton.SetActive(true);
        background.SetActive(true);
    }

    public void Quit()
    {
        SceneManager.LoadScene("UI VLAD");
        ResumeGame();
    }

    private void OnTowerSelected(Button selectedButton)
    {
        foreach (Button button in towerButtons)
        {
            button.interactable = false;
        }

        selectedTowerIndex = System.Array.IndexOf(towerButtons, selectedButton);
        shopButtonsAnimator.SetTrigger("SelectTower");

        StartCoroutine(ShowUpgradeSlots(selectedButton));
    }

    IEnumerator ShowUpgradeSlots(Button selectedButton)
    {
        yield return new WaitForSeconds(0.1f);

        Transform tower = selectedButton.transform;
        for (int i = 0; i < tower.childCount; i++)
        {
            Transform slot = tower.GetChild(i);
            slot.gameObject.SetActive(true);

            Button slotButton = slot.GetComponent<Button>();
            int slotIndex = i;
            slotButton.onClick.AddListener(() => OnUpgradeSlotSelected(slotButton, slotIndex));
        }
    }

    private void OnUpgradeSlotSelected(Button selectedSlot, int slotIndex)
    {
        Transform slotTransform = selectedSlot.transform;
        for (int i = 0; i < slotTransform.childCount; i++)
        {
            Transform upgrade = slotTransform.GetChild(i);
            upgrade.gameObject.SetActive(true);

            Button upgradeButton = upgrade.GetComponent<Button>();
            int upgradeIndex = i;
            upgradeButton.onClick.AddListener(() => OnAbilitySelected(selectedSlot, upgradeButton, upgradeIndex));
        }
    }

    private void OnAbilitySelected(Button selectedSlot, Button chosenUpgrade, int upgradeIndex)
    {
        for (int i = 0; i < selectedSlot.transform.childCount; i++)
        {
            selectedSlot.transform.GetChild(i).gameObject.SetActive(false);
        }

        Image slotImage = selectedSlot.GetComponent<Image>();
        Image upgradeImage = chosenUpgrade.GetComponent<Image>();
        slotImage.sprite = upgradeImage.sprite;
    }

   IEnumerator ShopSwitch()
   {
        if (Input.GetKeyDown(KeyCode.B) && cameraMain.IsLive && !gameIsPaused)
        {
            pauseButton.SetActive(!pauseButton.activeSelf);
            shopUI.SetActive(!shopUI.activeSelf);
            yield return new WaitForSeconds(1f);
        }
        else if (Input.GetKeyDown(KeyCode.B) && cameraShop.IsLive && !gameIsPaused)
        {
            pauseButton.SetActive(!pauseButton.activeSelf);
            shopUI.SetActive(!shopUI.activeSelf);
            yield return new WaitForSeconds(1f);
        }
   }
}

