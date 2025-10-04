using System.Collections.Generic;
using Enemies;
using GameConfiguration;
using StaticClasses;
using Towers.Abilities.Active;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.Serialization;
using UnityEngine.UI;

namespace Towers
{
    public class TowerCamera : MonoBehaviour
    {
        [SerializeField] private bool isAbilityActived;
        [SerializeField] private float turnSpeed = 4.0f;
        [SerializeField] private GameObject tower;
        [SerializeField] private CinemachineCamera currentCamera;
        [SerializeField] private float crosshairRadius;
        [SerializeField] private Image reticle;
        
        private readonly List<GameObject> _cachedHitEnemies = new List<GameObject>();
        private readonly RaycastHit[] _cachedRaycastHits = new RaycastHit[1000];
        private const float MinTurnAngle = -90.0f;
        
        private GameObject _abilityRange;
        private AbilitiesSlots _abilities;
        private float _maxTurnAngle;
        private float _rotX;
        private Transform _camTransform;
        private float _searchRadius;
        private Vector3 _sphereGizmoPoint;
        private Camera _mainCamera;
        private Tower _towerComp;
        private bool _isTowerCameraActive;
        private CinemachineBrain _cinemachineBrain;
        private Vector3 _cachedCenter;
        private Ray _cachedRay;
        
        public GameObject CurrentTarget;
        public AudioListener mainCameraListener;
        public AudioListener towerAudioListener; 
        public GameObject _audio;
        
        private void Start()
        {
            mainCameraListener.enabled = true;

            _abilityRange = GameObject.FindGameObjectWithTag("Range");
            _abilities = GetComponentInParent<AbilitiesSlots>();
            _searchRadius = GetComponentInParent<Tower>().attackRange;
            _camTransform = transform;
            
            _mainCamera = Camera.main;
            currentCamera = GetComponent<CinemachineCamera>();

            _towerComp = gameObject.GetComponentInParent<Tower>();

            reticle = reticle.GetComponent<Image>();
            
            _cinemachineBrain = CinemachineBrain.GetActiveBrain(0);
            
            _cachedCenter = new Vector3(Screen.width / 2, Screen.height / 2, 0);
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

            if (!currentCamera.IsLive)
            {
                if (isAbilityActived)
                {
                    isAbilityActived = false;
                    _abilityRange.transform.localScale /= _abilities.Ability.GetComponent<ActiveAbility>().RangeOfAction();
                }
                DisableImage();
                return;
            }
            
            MoveCamera();
            
            if (isAbilityActived)
            {
                HandleAbilityMode();
                return;
            }
            
            if (Input.GetMouseButton(1) && !isAbilityActived)
            {
                HandleAbilityActivation();
                return;
            }
            
            UpdateTarget();
        }
        
        private void HandleAbilityMode()
        {
            DisableImage();
            if (Input.GetMouseButton(0))
            {
                isAbilityActived = false;
                _abilityRange.transform.localScale /= _abilities.Ability.GetComponent<ActiveAbility>().RangeOfAction();
                _abilityRange.transform.position = new Vector3(1000f, 1000f, 1000f);
                return;
            }
            
            _cachedRay = _mainCamera.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0));
            RaycastHit hit;
            Vector3 abilityUsePoint = new Vector3();

            if (Physics.Raycast(_cachedRay, out hit, _searchRadius + 9, 1 << 7))
            {
                _abilities.Ability.GetComponent<ActiveAbility>().ActivateAbilityRadius(hit.point);
                abilityUsePoint = hit.point;
            }
            else
            {
                abilityUsePoint = CalculateAbilityPoint();
                _abilities.Ability.GetComponent<ActiveAbility>().ActivateAbilityRadius(abilityUsePoint);
            }
            
            if (Input.GetKey(KeyCode.E))
            {
                _abilities.Ability.GetComponent<ActiveAbility>().ActivateAbility(abilityUsePoint);
                isAbilityActived = false;
                _abilityRange.transform.localScale /= _abilities.Ability.GetComponent<ActiveAbility>().RangeOfAction();
                _abilityRange.transform.position = new Vector3(1000f, 1000f, 1000f);
            }
        }
        
        private Vector3 CalculateAbilityPoint()
        {
            float x = _cachedRay.direction.x;
            float z = _cachedRay.direction.z;
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
            
            return temp;
        }
        
        private void HandleAbilityActivation()
        {
            if (_abilities.HasActiveAbility && !_abilities.Ability.GetComponent<ActiveAbility>().IsAbilityUsed())
            {
                DisableImage();
                _abilityRange.transform.localScale *= _abilities.Ability.GetComponent<ActiveAbility>().RangeOfAction();
                _abilities.Ability.GetComponent<ActiveAbility>().ActionRadius(_abilityRange);
                isAbilityActived = true;
            }
        }
        
        private void UpdateTarget()
        {
            List<GameObject> enemies = _towerComp.enemiesInRange;
            
            if (enemies.Count == 0)
            {
                DisableImage();
                return;
            }
            
            _cachedRay = _mainCamera.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0));

            int size = Physics.SphereCastNonAlloc(tower.transform.position, crosshairRadius, _cachedRay.direction, _cachedRaycastHits,
                _searchRadius + 100);
            
            if (size == 0)
            {
                DisableImage();
                return;
            }
            
            _cachedHitEnemies.Clear();
            
            for (int i = 0; i < size; ++i)
            {
                _sphereGizmoPoint = _cachedRaycastHits[i].point;
                if (enemies.Contains(_cachedRaycastHits[i].collider.gameObject))
                {
                    _cachedHitEnemies.Add(_cachedRaycastHits[i].collider.gameObject);
                }
            }

            if (_cachedHitEnemies.Count > 0)
            {
                UpdateReticlePosition();
            }
            else
            {
                DisableImage();
            }
        }
        
        private void UpdateReticlePosition()
        {
            GameObject closestEnemyToCenter = _cachedHitEnemies[0];
            float minDistanceSqr = 1000 * 1000; // Random value squared
            
            foreach (var enemyHit in _cachedHitEnemies)
            {
                Vector3 screenPos = _mainCamera.WorldToScreenPoint(enemyHit.transform.position);
                screenPos.z = 0;
                float distanceSqr = Vector3.SqrMagnitude(screenPos - _cachedCenter);
                
                if (distanceSqr < minDistanceSqr)
                {
                    minDistanceSqr = distanceSqr;
                    closestEnemyToCenter = enemyHit;
                }
            }

            CurrentTarget = closestEnemyToCenter;

            var targetPos = CurrentTarget.GetComponentInChildren<EnemyTarget>().transform.position;
            Vector3 imagePos = _mainCamera.WorldToScreenPoint(targetPos);

            reticle.rectTransform.transform.position = imagePos;

            if (currentCamera.Priority > 0)
            {
                reticle.enabled = true;
            }
            else
            {
                DisableImage();
            }
        }

        public void ActivateTowerListener()
        {
            if (!towerAudioListener.enabled)
            {
                towerAudioListener.enabled = true;
                mainCameraListener.enabled = false;
                _isTowerCameraActive = true;
            }
        }

        public void ActivateMainCameraListener()
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
            if (currentCamera.Priority == 0 || _cinemachineBrain.IsBlending)
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
