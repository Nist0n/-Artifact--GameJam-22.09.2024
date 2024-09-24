using UnityEngine;
using UnityEngine.EventSystems;

namespace Towers
{
    public class SelectTower : MonoBehaviour
    {
        private Camera _mainCamera;
        private Tower _currentTower;
        
        private void Awake()
        {
            _mainCamera = Camera.main;
        }

        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.Escape))
            {
                if (_mainCamera.enabled)
                {
                    return;
                }

                _currentTower.piloted = false;
                DisableAllCameras();
                _mainCamera.enabled = true;
            }

            if (!_mainCamera.enabled)
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
                        DisableAllCameras();

                        tower.towerCamera.enabled = true;
                        tower.piloted = true;
                        _currentTower = tower;
                    }
                }
            }
        }

        private void DisableAllCameras()
        {
            foreach (var cam in Camera.allCameras)
            {
                cam.enabled = false;
            }
        }
    }
}