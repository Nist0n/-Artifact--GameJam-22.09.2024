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

    public Animator[] towerAnimators;
    public float animationDuration = 0.2f;

    private int selectedTowerIndex = -1;
    private bool towerSelected = false;

    public bool gameIsPaused;

    private void Start()
    {
        // ��������� ��� ����� � ��������� � ������ ����
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

    void OnTowerSelected(Button selectedButton)
    {
        int towerIndex = System.Array.IndexOf(towerButtons, selectedButton); // �������� ������ ��������� �����

        if (towerSelected && selectedTowerIndex == towerIndex)
        {
            // ���� ����� ��� ������� � �� �������� �� ��� �������� � ������� ����� � ���������� ��� ������
            StartCoroutine(ResetTowerSelection());
        }
        else
        {
            // ��������� ��� �����, ����� ���������, � �������� ��
            foreach (Button button in towerButtons)
            {
                button.gameObject.SetActive(false); // �������� ��� �����
            }

            // ���������� ������ ��������� �����
            selectedButton.gameObject.SetActive(true);
            selectedButton.interactable = true; // ��������� � ������������� ��� ���������� ������

            // ���������� ������ ��������� �����
            selectedTowerIndex = towerIndex;
            towerSelected = true;

            // ��������� �������� ��� ��������� �����
            Animator towerAnimator = towerAnimators[towerIndex]; // ���� �������� ��������� �����
            towerAnimator.SetTrigger("SelectTower");

            // ���������� ����� ��� ��������� ����� ��������
            StartCoroutine(ShowUpgradeSlots(selectedButton));
        }
    }

    IEnumerator ShowUpgradeSlots(Button selectedButton)
    {
        yield return new WaitForSeconds(animationDuration); // ���� ��������� ��������

        // ������� ��� ����� ������ ��������� ����� (����� � ��� �������� ������� �����)
        Transform tower = selectedButton.transform;
        for (int i = 0; i < tower.childCount; i++)
        {
            Transform slot = tower.GetChild(i); // �������� ����
            slot.gameObject.SetActive(true); // ���������� ����

            // ��������� ������� ���������� Button �� �����
            Button slotButton = slot.GetComponent<Button>();
            if (slotButton != null && slotButton.interactable) // ���� �� ������ ���� ��� ���������
            {
                int slotIndex = i; // ����� ��� ���������� ������ ���������
                slotButton.onClick.AddListener(() => OnUpgradeSlotSelected(slotButton, slotIndex));
            }
        }
    }

    // ����� ��� ������ ����� ���������
    void OnUpgradeSlotSelected(Button selectedSlot, int slotIndex)
    {
        // ������� ��� �������� ������� ������ �����, ������� ������������ ����� ������ ���������
        for (int i = 0; i < selectedSlot.transform.childCount; i++)
        {
            Transform upgrade = selectedSlot.transform.GetChild(i); // �������� ���������
            upgrade.gameObject.SetActive(true); // ���������� ������ � �����������

            // ����������� ����� ��������� � ������
            Button upgradeButton = upgrade.GetComponent<Button>();
            int upgradeIndex = i;
            upgradeButton.onClick.AddListener(() => OnAbilitySelected(selectedSlot, upgradeButton, upgradeIndex));
        }
    }

    // ����� ��� ������ ���������
    void OnAbilitySelected(Button selectedSlot, Button chosenUpgrade, int upgradeIndex)
    {
        // �������� ��� ��������� ����� ������
        for (int i = 0; i < selectedSlot.transform.childCount; i++)
        {
            selectedSlot.transform.GetChild(i).gameObject.SetActive(false);
        }

        // ������ ������ ����� �� ������ ���������� ���������
        Image slotImage = selectedSlot.GetComponent<Image>();
        Image upgradeImage = chosenUpgrade.GetComponent<Image>();
        slotImage.sprite = upgradeImage.sprite;

        DisableSlotWithoutChangingAppearance(selectedSlot);

        Debug.Log("������� ���������: " + upgradeIndex + " ��� �����: " + selectedSlot.name);
    }

    // ����� ��� ������ ������ ����� � �������� ���������� � ���������� ���������
    IEnumerator ResetTowerSelection()
    {
        // �������� ����� � ���������� ��������� �����
        if (selectedTowerIndex != -1)
        {
            Transform tower = towerButtons[selectedTowerIndex].transform;
            for (int i = 0; i < tower.childCount; i++)
            {
                Transform slot = tower.GetChild(i);
                slot.gameObject.SetActive(false); // �������� ��� �����
            }

            // ���������� �������� ����� �� �����
            Animator towerAnimator = towerAnimators[selectedTowerIndex]; // ���� �������� ������� ��������� �����
            towerAnimator.SetTrigger("DeselectTower");
        }

        yield return new WaitForSeconds(animationDuration);
        // ���������� ��� ����� � �������� ���������
        foreach (Button button in towerButtons)
        {
            button.gameObject.SetActive(true);
            button.interactable = true;
        }

        // ���������� ����� �����
        towerSelected = false;
        selectedTowerIndex = -1;
    }

    void DisableSlotWithoutChangingAppearance(Button slotButton)
    {
        ColorBlock colors = slotButton.colors;
        colors.disabledColor = colors.normalColor;
        slotButton.colors = colors;

        slotButton.interactable = false;
    }
}

