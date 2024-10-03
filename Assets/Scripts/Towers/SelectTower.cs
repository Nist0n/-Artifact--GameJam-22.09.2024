using System.Collections;
using System.Collections.Generic;
using NUnit.Framework;
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

        private bool _isSwitching = false;

        private void Awake()
        {
            _mainCamera = Camera.main;
        }

        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.Q))
            {
                if (mainCinemachineCamera.IsLive || shopCinemachineCamera.IsLive)
                {
                    return;
                }

                _currentTower.GetComponent<AbilitiesSlots>().TowerSelected = false;
                _currentTower.GetComponent<AbilitiesSlots>().HideAbilities();
                
                foreach (var tw in towers)
                {
                    if (tw != _currentTower.gameObject)
                    {
                        tw.GetComponentInChildren<TowerCamera>().enabled = true;
                    }
                }

                _currentTower.GetComponent<AbilitiesSlots>().Circle.transform.position = new Vector3(1000, 1000, 1000);
                _currentTower.piloted = false;
                _currentTower.towerCamera.Priority = 0;
                mainCinemachineCamera.Priority = 1;
                buffImage.SetActive(false);
            }

            if (Input.GetKeyDown(KeyCode.B) && !_isSwitching && !GamePause.Instance.gameIsPaused && (mainCinemachineCamera.IsLive || shopCinemachineCamera.IsLive))
            {
                StartCoroutine(ShopCameraSwap());
            }
            
            if (!mainCinemachineCamera.IsLive)
            {
                return;
            }

            if (Input.GetMouseButtonDown(0))
            {
                if (EventSystem.current.IsPointerOverGameObject()) // If clicking on UI
                {
                    return;
                }

                Ray ray = _mainCamera.ScreenPointToRay(Input.mousePosition);
                if (Physics.Raycast(ray, out RaycastHit hit))
                {
                    if (hit.collider.gameObject.CompareTag("Tower")) // If clicking on a tower
                    {
                        Tower tower = hit.collider.gameObject.GetComponent<Tower>();
                        
                        tower.gameObject.GetComponent<AbilitiesSlots>().SetAbilitiesImages();

                        tower.gameObject.GetComponent<AbilitiesSlots>().TowerSelected = true;

                        foreach (var tw in towers)
                        {
                            if (tw != tower.gameObject)
                            {
                                tw.GetComponentInChildren<TowerCamera>().enabled = false;
                            }
                        }
                        
                        _currentTower = tower;
                        tower.towerCamera.Priority = 1;
                        mainCinemachineCamera.Priority = 0;
                        tower.piloted = true;
                        
                        tower.EmpowerTower();
                    }
                }
            }
        }
        IEnumerator ShopCameraSwap()
        {
            if (_isSwitching)
            {
                yield break;
            }

            _isSwitching = true;

            if (shopCinemachineCamera.IsLive)
            {
                shopCinemachineCamera.Priority = 0;
                mainCinemachineCamera.Priority = 1;
            }
            else if (mainCinemachineCamera.IsLive)
            {
                mainCinemachineCamera.Priority = 0;
                shopCinemachineCamera.Priority = 1;
            }

            yield return new WaitForSeconds(1f);
            StartCoroutine(ShopSwitch());

            _isSwitching = false;
        }

        IEnumerator ShopSwitch()
        {
            yield return null;
            pauseButton.SetActive(!pauseButton.activeSelf);
            shopUI.SetActive(!pauseButton.activeSelf);
        }
    }
}