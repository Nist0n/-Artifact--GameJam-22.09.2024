using System.Collections;
using System.Collections.Generic;
using Shop;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.Serialization;

namespace Towers
{
    public class SelectTower : MonoBehaviour
    {
        private Camera _mainCamera;
        private Tower _currentTower;

        public CinemachineCamera mainCinemachineCamera;
        public CinemachineCamera shopCinemachineCamera;

        [SerializeField] GameObject pauseButton;
        [SerializeField] GameObject shopUI;
        [SerializeField] private List<GameObject> towers;
        [SerializeField] private GameObject buffImage;
        [SerializeField] private GameObject selectTowerControls;
        [SerializeField] private GameObject upgradeTowerControls;
        [SerializeField] private BuyingSystem buyingSystem;

        private bool _isSwitching;

        private void Awake()
        {
            _mainCamera = Camera.main;
        }

        private void Update()
        {
            if (mainCinemachineCamera.Priority == 1 || shopCinemachineCamera.Priority == 1 || 
                GameConfig.GameConfig.Instance.GameIsOverByLose || Time.timeScale == 0)
            {
                Cursor.visible = true;
                Cursor.lockState = CursorLockMode.None;
            }
            else
            {
                Cursor.visible = false;
                Cursor.lockState = CursorLockMode.Locked;
            }
            
            if (Input.GetKeyDown(KeyCode.Q)) // Exit tower
            {
                if (mainCinemachineCamera.IsLive || shopCinemachineCamera.IsLive)
                {
                    return;
                }

                AbilitiesSlots towerSlots = _currentTower.gameObject.GetComponent<AbilitiesSlots>();
                towerSlots.TowerSelected = false;
                towerSlots.HideAbilities();
                
                foreach (var tw in towers)
                {
                    if (tw != _currentTower.gameObject)
                    {
                        tw.GetComponentInChildren<TowerCamera>().enabled = true;
                    }
                }
                
                towerSlots.Circle.SetActive(false);
                _currentTower.piloted = false;
                _currentTower.towerCamera.Priority = 0;
                mainCinemachineCamera.Priority = 1;
                buffImage.SetActive(false);
            }

            // if (Input.GetKeyDown(KeyCode.B) && !_isSwitching && !GamePause.Instance.gameIsPaused && (mainCinemachineCamera.IsLive || shopCinemachineCamera.IsLive))
            // {
            //     StartCoroutine(ShopCameraSwap());
            // }
            
            if (!mainCinemachineCamera.IsLive) // If we are already in a tower
            {
                return;
            }

            if (Input.GetMouseButtonDown(0))
            {
                if (EventSystem.current.IsPointerOverGameObject()) // If clicking on UI
                {
                    return;
                }
                
                upgradeTowerControls.SetActive(false);
                
                Ray ray = _mainCamera.ScreenPointToRay(Input.mousePosition);
                if (Physics.Raycast(ray, out RaycastHit hit))
                {
                    if (hit.collider.gameObject.CompareTag("Tower")) // If clicking on a tower
                    {
                        Tower tower = hit.collider.gameObject.GetComponent<Tower>();
                        
                        buyingSystem.ResetLists(); // чистка выбора умений

                        selectTowerControls.transform.position = _mainCamera.WorldToScreenPoint(tower.transform.position);
                        ToggleSelectTowerControls(!selectTowerControls.activeSelf);
                        // upgradeTowerControls.transform.position =
                        //     _mainCamera.WorldToScreenPoint(tower.transform.position);
                        
                        _currentTower = tower;
                        
                        AbilitiesSlots towerSlots = _currentTower.gameObject.GetComponent<AbilitiesSlots>();
                        towerSlots.Circle.SetActive(true);
                        towerSlots.Circle.transform.position = new Vector3(1000f, 1000f, 1000f);
                        
                        buyingSystem.GetTower(tower.gameObject.GetComponent<AbilitiesSlots>());
                    }
                    else
                    {
                        ToggleSelectTowerControls(false);
                        buyingSystem.ResetLists();
                    }
                }
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

        // private IEnumerator ShopCameraSwap()
        // {
        //     if (_isSwitching)
        //     {
        //         yield break;
        //     }
        //
        //     _isSwitching = true;
        //
        //     if (shopCinemachineCamera.IsLive)
        //     {
        //         shopCinemachineCamera.Priority = 0;
        //         mainCinemachineCamera.Priority = 1;
        //     }
        //     else if (mainCinemachineCamera.IsLive)
        //     {
        //         mainCinemachineCamera.Priority = 0;
        //         shopCinemachineCamera.Priority = 1;
        //     }
        //
        //     yield return new WaitForSeconds(1f);
        //     StartCoroutine(ShopSwitch());
        //
        //     _isSwitching = false;
        // }

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
            
            _currentTower.towerCamera.Priority = 1;
            mainCinemachineCamera.Priority = 0;
            _currentTower.piloted = true;
                        
            _currentTower.EmpowerTower();
        }
        
        // private IEnumerator ShopSwitch()
        // {
        //     yield return null;
        //     // pauseButton.SetActive(!pauseButton.activeSelf);
        //     shopUI.SetActive(shopCinemachineCamera.IsLive);
        // }
    }
}