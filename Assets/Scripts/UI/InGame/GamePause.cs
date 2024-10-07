using System.Collections;
using Abilities.Active;
using Abilities.Passive;
using Shop;
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
    private Animator _pauseAnimator;
    private Animator _continueAnimator;

    private void Start()
    {
        _continueAnimator = continueGameButton.GetComponent<Animator>();
        _pauseAnimator = pauseButton.GetComponent<Animator>();
        // Отключаем все слоты и улучшения в начале игры
         foreach (Button button in towerButtons)
         {
            button.onClick.AddListener(() => OnTowerSelected(button));
         }

        AudioManager.instance.PlayMusic("InGame2");
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
        // if (pauseButton.activeSelf)
        // {
        //     if (_pauseAnimator.GetCurrentAnimatorClipInfo(0)[0].clip.name == "Selected")
        //     {
        //         Invoke("OpenSettings", 0.01f);
        //     }
        //
        // }
        //
        // if (continueGameButton.activeSelf)
        // {
        //     if (_continueAnimator.GetCurrentAnimatorClipInfo(0)[0].clip.name == "Selected")
        //     {
        //         ResumeGame();
        //         Invoke("CloseSettings", 0.01f);
        //     }
        // }

        if (Input.GetKeyUp(KeyCode.Escape))
        {
            if (!background.activeSelf)
            {
                PauseGame();
            }
            else
            {
                ResumeGame();
            }
        }
    }
    
    public void RestartGame()
    { 
        ResumeGame();
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
    }

    public void PauseGame()
    {
        Time.timeScale = 0f;
        OpenSettings();
    }

    public void ResumeGame()
    {
        Time.timeScale = 1;
        CloseSettings();
    }

    public void CloseSettings()
    {
        // pauseButton.SetActive(true);
        AudioManager.instance.PlaySFX("Click");
        background.SetActive(false);
        continueGameButton.SetActive(false);
    }

    public void OpenSettings()
    {
        // pauseButton.SetActive(false);
        AudioManager.instance.PlaySFX("Click");
        continueGameButton.SetActive(true);
        background.SetActive(true);
    }

    public void Quit()
    {
        SceneManager.LoadScene("MenuScene");
        ResumeGame();
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
        Transform tower = towerButtons[selectedTowerIndex].transform;
        for (int i = 0; i < tower.childCount; i++)
        {
            Transform slot = tower.GetChild(i);
            slot.gameObject.SetActive(false); // Скрываем все слоты
            slot.gameObject.SetActive(true);
        }
        
        if (selectedSlot.transform.GetChild(0).gameObject.activeSelf)
        {
            for (int i = 0; i < selectedSlot.transform.childCount; i++)
            {
                selectedSlot.transform.GetChild(i).gameObject.SetActive(false);
            }
        }
        else
        {
            if (!selectedSlot.GetComponent<ButtonFrozen>().Isfreezed)
            {
                if (selectedSlot.CompareTag("Active"))
                {
                    buyingSystem.GetButtonsUpgrade(selectedSlot);
                    buyingSystem.SetRandomActiveAbilities();
                }
                else
                {
                    buyingSystem.GetButtonsUpgrade(selectedSlot);
                    buyingSystem.SetRandomPassiveAbilities();
                }
            }
            
            // Находим дочерние объекты внутри слота, которые представляют собой кнопки улучшений
            for (int i = 0; i < selectedSlot.transform.childCount; i++)
            {
                
                Transform upgrade = selectedSlot.transform.GetChild(i); // Получаем улучшение
                upgrade.gameObject.SetActive(true); // Показываем кнопки с улучшениями

                if (upgrade.transform.childCount > 1)
                {
                    for (int j = 0; j < upgrade.transform.childCount - 1; j++)
                    {
                        Destroy(upgrade.transform.GetChild(j).gameObject);
                    }
                }

                // Привязываем выбор улучшения к кнопке
                Button upgradeButton = upgrade.transform.GetChild(0).GetComponent<Button>();
                int upgradeIndex = i;
                upgradeButton.onClick.AddListener(() => OnAbilitySelected(selectedSlot, upgradeButton, upgradeIndex));
            }

            selectedSlot.GetComponent<ButtonFrozen>().Isfreezed = true;
        }
    }

    // Метод для выбора улучшения
    private void OnAbilitySelected(Button selectedSlot, Button chosenUpgrade, int upgradeIndex)
    {
        if (selectedSlot.CompareTag("Active"))
        {
            float tempCost = chosenUpgrade.gameObject.GetComponent<ActiveAbility>().Cost(chosenUpgrade.gameObject.name);
            
            if (tempCost <= SoulsCounter.Instance.Dreams)
            {
                buyingSystem.SetAbilityOnTower(chosenUpgrade);
                buyingSystem.ResetLists();
                SoulsCounter.Instance.Dreams -= tempCost;
            }
            else
            {
                return;
            }
        }
        else
        {
            float tempCost = chosenUpgrade.gameObject.GetComponent<PassiveAbilities>().Cost(chosenUpgrade.gameObject.name);
            
            if (tempCost <= SoulsCounter.Instance.Dreams)
            {
                buyingSystem.SetAbilityOnTower(chosenUpgrade);
                buyingSystem.ResetLists();
                SoulsCounter.Instance.Dreams -= tempCost;
            }
            else
            {
                return;
            }
        }
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

