using System.Collections.Generic;
using Enemies;
using GameConfiguration;
using StaticClasses;
using Towers.Abilities.Active;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.UI;

namespace Towers
{
    public class TowerCamera : MonoBehaviour
    {
        private GameObject _abilityRange;
        private AbilitiesSlots _abilities;
        [SerializeField] private bool _isAbilityActived;
        [SerializeField] private float turnSpeed = 4.0f;
        [SerializeField] private GameObject tower;
        private const float MinTurnAngle = -90.0f;
        private float _maxTurnAngle;
        private float _rotX;

        private Transform _camTransform;

        public GameObject currentTarget;
        public GameObject previousTarget;

        private float _searchRadius;
        [SerializeField] private float crosshairRadius;

        private Vector3 _sphereGizmoPoint;

        [SerializeField] private Image reticle;

        [SerializeField] private List<GameObject> hitEnemies;

        private Camera _mainCamera;
        [SerializeField] private CinemachineCamera _currentCamera;

        private Tower _towerComp;

        public AudioListener mainCameraListener;
        public AudioListener towerAudioListener; 
        public GameObject _audio;
        private bool _isTowerCameraActive;
        
        private CinemachineBrain _cinemachineBrain;
        
        private void Start()
        {
            mainCameraListener.enabled = true;

            _abilityRange = GameObject.FindGameObjectWithTag("Range");
            _abilities = GetComponentInParent<AbilitiesSlots>();
            _searchRadius = GetComponentInParent<Tower>().attackRange;
            _camTransform = transform;
            
            _mainCamera = Camera.main;
            _currentCamera = GetComponent<CinemachineCamera>();

            _towerComp = gameObject.GetComponentInParent<Tower>();

            reticle = reticle.GetComponent<Image>();
            
            _cinemachineBrain = CinemachineBrain.GetActiveBrain(0);
        }
        
        private void OnEnable()
        {
            GameEvents.GamePause += OnGamePause;
            GameEvents.GameLost += DisableImage;
        }

        private void OnDisable()
        {
            GameEvents.GamePause -= OnGamePause;
            GameEvents.GameLost -= DisableImage;
        }
        
        private void Update()
        {
            if (Cursor.visible) // If game is paused/lost/won
            {
                DisableImage();
                return;
            }
            
            if (_currentCamera.IsLive && !_isTowerCameraActive)
            {
                ActivateTowerListener();
            }
            else if (!_currentCamera.IsLive && _isTowerCameraActive)
            {
                ActivateMainCameraListener();
            }

            if (!_currentCamera.IsLive)
            {
                if (_isAbilityActived)
                {
                    _isAbilityActived = false;
                    _abilityRange.transform.localScale /= _abilities.Ability.GetComponent<ActiveAbility>().RangeOfAction();
                }
                DisableImage();
                return;
            }
            
            MoveCamera();
            
            List<GameObject> enemies = _towerComp.enemiesInRange;
            
            Ray ray = _mainCamera.ViewportPointToRay(new Vector3 (0.5f, 0.5f, 0));
            
            if (_isAbilityActived)
            {
                DisableImage();
                if (Input.GetMouseButton(0))
                {
                    _isAbilityActived = false;
                    _abilityRange.transform.localScale /= _abilities.Ability.GetComponent<ActiveAbility>().RangeOfAction();
                    _abilityRange.transform.position = new Vector3(1000f, 1000f, 1000f);
                    return;
                }
                
                RaycastHit hit;

                Vector3 abilityUsePoint = new Vector3();

                if (Physics.Raycast(ray, out hit, _searchRadius + 9, 1 << 7))
                {
                    _abilities.Ability.GetComponent<ActiveAbility>().ActivateAbilityRadius(hit.point);
                    abilityUsePoint = hit.point;
                }
                else
                {
                    float x = ray.direction.x;
                    float z = ray.direction.z;

                    Vector3 temp = new Vector3();

                    if (z > 0)
                    {
                        temp.x = _towerComp.attackRange * Mathf.Sin(Mathf.Atan(x / z)) + _towerComp.gameObject.transform.position.x;

                        temp.y = _towerComp.gameObject.transform.position.y + 0.5f;
                    
                        temp.z = _towerComp.attackRange * Mathf.Cos(Mathf.Atan(x / z)) + _towerComp.gameObject.transform.position.z;
                    }
                    else
                    {
                        temp.x = -(_towerComp.attackRange * Mathf.Sin(Mathf.Atan(x / z))) + _towerComp.gameObject.transform.position.x;

                        temp.y = _towerComp.gameObject.transform.position.y + 1;
                    
                        temp.z = -(_towerComp.attackRange * Mathf.Cos(Mathf.Atan(x / z))) + _towerComp.gameObject.transform.position.z;
                    }

                    _abilities.Ability.GetComponent<ActiveAbility>()
                        .ActivateAbilityRadius(temp);
                    
                    abilityUsePoint = temp;
                }
                if (Input.GetKey(KeyCode.E))
                {
                    _abilities.Ability.GetComponent<ActiveAbility>().ActivateAbility(abilityUsePoint);
                    _isAbilityActived = false;
                    _abilityRange.transform.localScale /= _abilities.Ability.GetComponent<ActiveAbility>().RangeOfAction();
                    _abilityRange.transform.position = new Vector3(1000f, 1000f, 1000f);
                }
                return;
            }
            
            if (Input.GetMouseButton(1) && !_isAbilityActived)
            {
                if (_abilities.HasActiveAbility && !_abilities.Ability.GetComponent<ActiveAbility>().IsAbilityUsed())
                {
                    DisableImage();
                    _abilityRange.transform.localScale *= _abilities.Ability.GetComponent<ActiveAbility>().RangeOfAction();
                    _abilities.Ability.GetComponent<ActiveAbility>().ActionRadius(_abilityRange);
                    _isAbilityActived = true;
                    return;
                }
            }

            if (enemies.Count == 0)
            {
                DisableImage();
                return;
            }
            
            Vector3 center = new Vector3(Screen.width / 2, Screen.height / 2, 0);

            RaycastHit[] raycastHits = new RaycastHit[1000];

            int size = Physics.SphereCastNonAlloc(tower.transform.position, crosshairRadius, ray.direction, raycastHits,
                _searchRadius + 100);
            
            if (raycastHits.Length == 0)
            {
                return;
            }
            
            hitEnemies = new();
            for (int i = 0; i < size; ++i)
            {
                _sphereGizmoPoint = raycastHits[i].point;
                if (enemies.Contains(raycastHits[i].collider.gameObject))
                {
                    hitEnemies.Add(raycastHits[i].collider.gameObject);
                }
            }

            if (hitEnemies.Count > 0)
            {
                GameObject closestEnemyToCenter = hitEnemies[0];
                float minDistanceSqr = 1000 * 1000; // Random value squared
                foreach (var enemyHit in hitEnemies)
                {
                    Vector3 screenPos = _mainCamera.WorldToScreenPoint(enemyHit.transform.position);
                    
                    screenPos.z = 0;
                    float distanceSqr = Vector3.SqrMagnitude(screenPos - center);
                    if (distanceSqr < minDistanceSqr)
                    {
                        minDistanceSqr = distanceSqr;
                        closestEnemyToCenter = enemyHit;
                    }
                }

                currentTarget = closestEnemyToCenter;

                var targetPos = currentTarget.GetComponentInChildren<EnemyTarget>().transform.position;
                Vector3 imagePos = _mainCamera.WorldToScreenPoint(targetPos);

                reticle.rectTransform.transform.position = imagePos;

                if (_currentCamera.Priority > 0)
                {
                    reticle.enabled = true;
                }
                else
                {
                    DisableImage();
                }
            }
            else
            {
                DisableImage();
            }
        }

        private void ActivateTowerListener()
        {
            if (!towerAudioListener.enabled)
            {
                towerAudioListener.enabled = true;
                mainCameraListener.enabled = false;
                _isTowerCameraActive = true;
            }
        }

        private void ActivateMainCameraListener()
        {
            if (!mainCameraListener.enabled)
            {
                mainCameraListener.enabled = true;
                towerAudioListener.enabled = false;
                _isTowerCameraActive = false;
            }
        }

        private void MoveCamera()
        {
            if (_currentCamera.Priority == 0 || _cinemachineBrain.IsBlending)
            {
                return;
            }
            
            float y = Input.GetAxis("Mouse X") * turnSpeed;
            _rotX += Input.GetAxis("Mouse Y") * turnSpeed;
            
            _rotX = Mathf.Clamp(_rotX, MinTurnAngle, _maxTurnAngle);
            
            tower.transform.eulerAngles = new Vector3(-_rotX, _camTransform.eulerAngles.y + y, 0);
            _audio.transform.eulerAngles = tower.transform.eulerAngles;
        }

        private void DisableImage()
        {
            reticle.enabled = false;
        }
        
        private void OnDrawGizmos()
        {
            Gizmos.color=Color.red;
            Gizmos.DrawWireSphere(_sphereGizmoPoint, crosshairRadius);
        }

        private void OnGamePause(bool condition)
        {
            if (_isTowerCameraActive)
            {
                reticle.enabled = !condition;
            }
        }
    }
}
