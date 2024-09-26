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

        private void Awake()
        {
            _mainCamera = Camera.main;
        }

        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.Q))
            {
                if (mainCinemachineCamera.IsLive)
                {
                    return;
                }
                
                _currentTower.piloted = false;
                _currentTower.towerCamera.Priority = 0;
                mainCinemachineCamera.Priority = 1;
            }

            if (Input.GetKeyDown(KeyCode.B))
            {
                if (shopCinemachineCamera.IsLive)
                {
                    shopCinemachineCamera.Priority = 0;
                    mainCinemachineCamera.Priority = 1;
                }
                else
                {
                    if (mainCinemachineCamera.IsLive)
                    {
                        mainCinemachineCamera.Priority = 0;
                        shopCinemachineCamera.Priority = 1;
                    }
                }
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
                        
                        _currentTower = tower;
                        tower.towerCamera.Priority = 1;
                        mainCinemachineCamera.Priority = 0;
                        tower.piloted = true;
                    }
                }
            }
        }
    }
}