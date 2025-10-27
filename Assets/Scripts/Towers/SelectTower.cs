using System.Collections.Generic;
using Shop;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.EventSystems;
using GameConfiguration;
using GameConfiguration.Settings.Audio;
using UnityEngine.UI;
using Cursor = UnityEngine.Cursor;

namespace Towers
{
    public class SelectTower : MonoBehaviour
    {
        [SerializeField] private CinemachineCamera mainCinemachineCamera;
        [SerializeField] private List<GameObject> towers;
        [SerializeField] private RechargeAbility rechargeAbility;
        [SerializeField] private GameObject selectTowerControls;
        [SerializeField] private GameObject upgradeTowerControls;
        [SerializeField] private BuyingSystem buyingSystem;
        
        private Camera _mainCamera;
        private Tower _currentTower;
        private RangeVisualizer _currentRangeViz;
        
        private void Awake()
        {
            _mainCamera = Camera.main;
        }

        private void Update()
        {
            if (GameConfig.Instance.HasLost) return;
            
            bool isInTower = mainCinemachineCamera.Priority == 0;
            GameConfig.Instance.IsInTower = isInTower;
            
            if (isInTower && _currentTower)
            {
                _currentTower.DisplayCd();
            }
            
            HandleInput();
        }
        
        private void HandleInput()
        {
            DisableTowerView();
            ToggleShopUI();
            
            if (mainCinemachineCamera.Priority != 0)
            {
                OnTowerClicked();
            }
        }

        private void ToggleSelectTowerControls(bool b)
        {
            selectTowerControls.SetActive(b);
        }
        
        public void ToggleUpgradeTowerControls(bool b)
        {
            upgradeTowerControls.SetActive(!upgradeTowerControls.activeSelf);
            ToggleSelectTowerControls(false);
        }
        
        public void EnterCurrentTower()
        {
            ToggleSelectTowerControls(false);
            AbilitiesSlots towerSlots = _currentTower.gameObject.GetComponent<AbilitiesSlots>();
            towerSlots.SetAbilitiesImages();

            towerSlots.TowerSelected = true;

            foreach (var tw in towers)
            {
                if (tw != _currentTower.gameObject)
                {
                    tw.GetComponentInChildren<TowerCamera>().enabled = false;
                }
            }
            
            _currentTower.TowerCamera.Priority = 1;
            mainCinemachineCamera.Priority = 0;
            _currentTower.Piloted = true;
            rechargeAbility.TextTimer.enabled = true;
            rechargeAbility.ParentImage.enabled = true;
            rechargeAbility.AbilityImage.enabled = true;
            
            _currentTower.TowerCamera.GetComponent<TowerCamera>().ActivateTowerListener();
                        
            _currentTower.EmpowerTower();
            
            GameConfig.Instance.NotifyTowerChanged(_currentTower);
        }

        private void DisableTowerView()
        {
            if (Input.GetKeyDown(KeyCode.Q)) // Exit tower
            {
                if (mainCinemachineCamera.Priority == 1)
                {
                    return;
                }

                AbilitiesSlots towerSlots = _currentTower.gameObject.GetComponent<AbilitiesSlots>();
                towerSlots.TowerSelected = false;
                towerSlots.HideAbilities();
                upgradeTowerControls.SetActive(false);
                
                foreach (var tw in towers)
                {
                    if (tw != _currentTower.gameObject)
                    {
                        tw.GetComponentInChildren<TowerCamera>().enabled = true;
                    }
                }
                
                towerSlots.Circle.SetActive(false);
                if (_currentRangeViz) _currentRangeViz.SetVisible(false);
                _currentTower.Piloted = false;
                
                _currentTower.TowerCamera.GetComponent<TowerCamera>().ActivateMainCameraListener();
                
                _currentTower.TowerCamera.Priority = 0;
                mainCinemachineCamera.Priority = 1;
                rechargeAbility.TextTimer.enabled = false;
                rechargeAbility.ParentImage.enabled = false;
                rechargeAbility.AbilityImage.enabled = false;
                
                GameConfig.Instance.NotifyTowerChanged(null);
            }
        }

        private void ToggleShopUI()
        {
            if (Input.GetKeyDown(KeyCode.B))
            {
                if (mainCinemachineCamera.Priority == 1)
                {
                    return;
                }

                if (!upgradeTowerControls.activeSelf)
                {
                    GameObject activeButton = new GameObject();
                    foreach (var button in upgradeTowerControls.GetComponentsInChildren<ButtonFrozen>())
                    {
                        if (button.gameObject.CompareTag("Active"))
                        {
                            activeButton = button.gameObject;
                        }
                    }
                    buyingSystem.ActivateActiveSlot(activeButton.GetComponent<Button>());
                    buyingSystem.ResetLists();
                    buyingSystem.GetTower(_currentTower.gameObject.GetComponent<AbilitiesSlots>());
                    Cursor.visible = true;
                    Cursor.lockState = CursorLockMode.None;
                }
                else
                {
                    Cursor.visible = false;
                    Cursor.lockState = CursorLockMode.Locked;
                }

                GameConfig.Instance.ShopIsOpened = !upgradeTowerControls.activeSelf;
                upgradeTowerControls.SetActive(!upgradeTowerControls.activeSelf);
            }
        }

        private void OnTowerClicked()
        {
            if (Input.GetMouseButtonUp(0))
            {
                if (EventSystem.current.IsPointerOverGameObject()) // If clicking on UI
                {
                    return;
                }
                
                if (upgradeTowerControls.activeSelf)
                {
                    buyingSystem.HidePassiveAbilities();
                }
                upgradeTowerControls.SetActive(false);
                
                Ray ray = _mainCamera.ScreenPointToRay(Input.mousePosition);
                if (Physics.Raycast(ray, out RaycastHit hit))
                {
                    if (hit.collider.gameObject.CompareTag("Tower")) // If clicking on a tower
                    {
                        AudioManager.Instance.PlaySFX("Click");
                        Tower tower = hit.collider.gameObject.GetComponent<Tower>();
                        hit.collider.gameObject.GetComponent<AbilitiesSlots>().UpdateAbilityUI();
                        
                        buyingSystem.ResetLists(); // чистка выбора умений

                        selectTowerControls.transform.position = _mainCamera.WorldToScreenPoint(tower.transform.position);
                        if (!selectTowerControls.activeSelf)
                        {
                            ToggleSelectTowerControls(!selectTowerControls.activeSelf);
                        }
                        
                        _currentTower = tower;
                        _currentRangeViz = _currentTower.GetComponentInChildren<RangeVisualizer>(true);
                        
                        AbilitiesSlots towerSlots = _currentTower.gameObject.GetComponent<AbilitiesSlots>();
                        towerSlots.Circle.SetActive(true);
                        towerSlots.Circle.transform.position = new Vector3(1000f, 1000f, 1000f);
                        foreach (var tw in towers)
                        {
                            var viz = tw.GetComponentInChildren<RangeVisualizer>(true);
                            if (viz)
                            {
                                viz.SetVisible(tw == _currentTower.gameObject);
                                if (tw == _currentTower.gameObject)
                                {
                                    viz.Redraw();
                                }
                            }
                        }
                        
                        buyingSystem.GetTower(tower.gameObject.GetComponent<AbilitiesSlots>());
                    }
                    else
                    {
                        ToggleSelectTowerControls(false);
                        buyingSystem.ResetLists();
                        foreach (var tw in towers)
                        {
                            var viz = tw.GetComponentInChildren<RangeVisualizer>(true);
                            if (viz) viz.SetVisible(false);
                        }
                    }
                }
            }
        }
    }
}