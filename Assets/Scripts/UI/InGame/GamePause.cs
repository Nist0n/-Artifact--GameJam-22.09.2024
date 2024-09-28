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
    [SerializeField] private BuyingSystem buyingSystem;

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
        // Отключаем все слоты и улучшения в начале игры
        foreach (Button button in towerButtons)
        {
            button.onClick.AddListener(() => OnTowerSelected(button));
        }

        Time.timeScale = 3f;
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

    private void OnTowerSelected(Button selectedButton)
    {
        int towerIndex = System.Array.IndexOf(towerButtons, selectedButton); // Получаем индекс выбранной башни

        if (towerSelected && selectedTowerIndex == towerIndex)
        {
            // Если башня уже выбрана и мы нажимаем на нее повторно — снимаем выбор и возвращаем все кнопки
            StartCoroutine(ResetTowerSelection());
        }
        else
        {
            // Отключаем все башни, кроме выбранной, и скрываем их
            foreach (Button button in towerButtons)
            {
                button.gameObject.SetActive(false); // Скрываем все башни
            }

            // Активируем только выбранную башню
            selectedButton.gameObject.SetActive(true);
            selectedButton.interactable = true; // Оставляем её интерактивной для повторного выбора

            // Запоминаем индекс выбранной башни
            selectedTowerIndex = towerIndex;
            towerSelected = true;

            // Запускаем анимацию для выбранной башни
            Animator towerAnimator = towerAnimators[towerIndex]; // Берём аниматор выбранной башни
            towerAnimator.SetTrigger("SelectTower");
            
            buyingSystem.GetTowerIndex(selectedTowerIndex);

            // Показываем слоты для улучшений после анимации
            StartCoroutine(ShowUpgradeSlots(selectedButton));
        }
    }

    IEnumerator ShowUpgradeSlots(Button selectedButton)
    {
        yield return new WaitForSeconds(animationDuration); // Ждем окончания анимации

        // Находим все слоты внутри выбранной башни (слоты — это дочерние объекты башни)
        Transform tower = selectedButton.transform;
        for (int i = 0; i < tower.childCount; i++)
        {
            Transform slot = tower.GetChild(i); // Получаем слот
            slot.gameObject.SetActive(true); // Показываем слот

            // Проверяем наличие компонента Button на слоте
            Button slotButton = slot.GetComponent<Button>();
            if (slotButton != null && slotButton.interactable) // Слот не должен быть уже выбранным
            {
                int slotIndex = i; // Копия для корректной работы замыкания
                slotButton.onClick.AddListener(() => OnUpgradeSlotSelected(slotButton, slotIndex));
            }
        }
    }

    // Метод для выбора слота улучшений
    private void OnUpgradeSlotSelected(Button selectedSlot, int slotIndex)
    {
        buyingSystem.GetButtonsUpgrade(selectedSlot);
        buyingSystem.SetRandomActiveAbilities();
        // Находим дочерние объекты внутри слота, которые представляют собой кнопки улучшений
        for (int i = 0; i < selectedSlot.transform.childCount; i++)
        {
            Transform upgrade = selectedSlot.transform.GetChild(i); // Получаем улучшение
            upgrade.gameObject.SetActive(true); // Показываем кнопки с улучшениями

            // Привязываем выбор улучшения к кнопке
            Button upgradeButton = upgrade.transform.GetChild(0).GetComponent<Button>();
            int upgradeIndex = i;
            upgradeButton.onClick.AddListener(() => OnAbilitySelected(selectedSlot, upgradeButton, upgradeIndex));
        }
    }

    // Метод для выбора улучшения
    private void OnAbilitySelected(Button selectedSlot, Button chosenUpgrade, int upgradeIndex)
    {
        buyingSystem.SetAbilityOnTower(chosenUpgrade);
        buyingSystem.ResetLists();
        // Скрываем все улучшения после выбора
        for (int i = 0; i < selectedSlot.transform.childCount; i++)
        {
            selectedSlot.transform.GetChild(i).gameObject.SetActive(false);
        }

        // Меняем иконку слота на иконку выбранного улучшения
        Image slotImage = selectedSlot.GetComponent<Image>();
        Image upgradeImage = chosenUpgrade.GetComponent<Image>();
        slotImage.sprite = upgradeImage.sprite;

        DisableSlotWithoutChangingAppearance(selectedSlot);

        Debug.Log("Выбрано улучшение: " + upgradeIndex + " для слота: " + selectedSlot.name);
    }

    // Метод для сброса выбора башни и возврата интерфейса к начальному состоянию
    IEnumerator ResetTowerSelection()
    {
        // Скрываем слоты и сбрасываем выбранную башню
        if (selectedTowerIndex != -1)
        {
            Transform tower = towerButtons[selectedTowerIndex].transform;
            for (int i = 0; i < tower.childCount; i++)
            {
                Transform slot = tower.GetChild(i);
                slot.gameObject.SetActive(false); // Скрываем все слоты
            }

            // Возвращаем анимацию башни на место
            Animator towerAnimator = towerAnimators[selectedTowerIndex]; // Берём аниматор текущей выбранной башни
            towerAnimator.SetTrigger("DeselectTower");
        }

        yield return new WaitForSeconds(animationDuration);
        // Возвращаем все башни в исходное состояние
        foreach (Button button in towerButtons)
        {
            button.gameObject.SetActive(true);
            button.interactable = true;
        }

        // Сбрасываем выбор башни
        towerSelected = false;
        selectedTowerIndex = -1;
    }

    private void DisableSlotWithoutChangingAppearance(Button slotButton)
    {
        ColorBlock colors = slotButton.colors;
        colors.disabledColor = colors.normalColor;
        slotButton.colors = colors;

        slotButton.interactable = false;
    }
}

