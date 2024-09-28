using System.Collections.Generic;
using Unity.Cinemachine;
using UnityEngine;
using UnityEngine.UI;

namespace Towers
{
    public class TowerCamera : MonoBehaviour
    {
        private GameObject _abilityRange;
        private AbilitiesSlots _abilities;
        [SerializeField] private bool _isAbilityActived = false;
        [SerializeField] private float turnSpeed = 4.0f;
        [SerializeField] private GameObject tower;
        private const float MinTurnAngle = -90.0f;
        private float _maxTurnAngle;
        private float _rotX;

        private Transform _camTransform;

        public GameObject currentTarget;

        private float _searchRadius;
        [SerializeField] private float crosshairRadius;

        private Vector3 _sphereGizmoPoint;

        [SerializeField] private float minScale = 0.2f;
        [SerializeField] private float maxScale = 3f;
        [SerializeField] private float maxScaleAtDistance = 2;
        [SerializeField] private float minScaleAtDistance = 20;

        [SerializeField] private Image reticle;

        [SerializeField] private List<GameObject> hitEnemies;

        private Camera _mainCamera;
        private CinemachineCamera _currentCamera;

        private Tower _towerComp;
        
        private void Start()
        {
            _abilityRange = GameObject.FindGameObjectWithTag("Range");
            _abilities = GetComponentInParent<AbilitiesSlots>();
            _searchRadius = GetComponentInParent<Tower>().attackRange;
            _camTransform = transform;
            
            _mainCamera = Camera.main;
            _currentCamera = GetComponent<CinemachineCamera>();

            _towerComp = gameObject.GetComponentInParent<Tower>();
        }
        
        private void Update()
        {
            /*(if (GamePause.Instance.gameIsPaused) // If game is paused
            {
                return;
            } */
            
            if (!_currentCamera.IsLive)
            {
                return;
            }
            
            MoveCamera();
            
            Vector3 center = new Vector3(Screen.width / 2, Screen.height / 2, 0);
            Ray ray = _mainCamera.ViewportPointToRay(new Vector3 (0.5f, 0.5f, 0));;
            
            RaycastHit[] raycastHits = new RaycastHit[1000];
            
            if (_isAbilityActived)
            {
                reticle.enabled = false;
                if (Input.GetMouseButton(0))
                {
                    _isAbilityActived = false;
                    _abilityRange.transform.localScale /= _abilities.Ability.GetComponent<ActiveAbility>().RangeOfAction;
                    _abilityRange.transform.position = new Vector3(1000f, 1000f, 1000f);
                    return;
                }
                RaycastHit hit;
                if (Physics.Raycast(ray, out hit, _searchRadius + 7, 1 << 0)) _abilities.Ability.GetComponent<ActiveAbility>().ActivateAbilityRadius(hit.point);
                if (Input.GetKey(KeyCode.E))
                {
                    _abilities.Ability.GetComponent<ActiveAbility>().ActivateAbility(hit.point);
                    _isAbilityActived = false;
                    _abilityRange.transform.localScale /= _abilities.Ability.GetComponent<ActiveAbility>().RangeOfAction;
                    _abilityRange.transform.position = new Vector3(1000f, 1000f, 1000f);
                }
                return;
            }
            
            if (Input.GetMouseButton(1) && !_isAbilityActived)
            {
                if (_abilities.HasActiveAbility && !_abilities.Ability.GetComponent<ActiveAbility>().IsAbilityUsed)
                {
                    reticle.enabled = false;
                    _abilityRange.transform.localScale *= _abilities.Ability.GetComponent<ActiveAbility>().RangeOfAction;
                    _abilities.Ability.GetComponent<ActiveAbility>().ActionRadius = _abilityRange;
                    _isAbilityActived = true;
                    return;
                }
            }

            int size = Physics.SphereCastNonAlloc(tower.transform.position, crosshairRadius, ray.direction, raycastHits,
                _searchRadius + 3, 1 << 3);
            
            List<GameObject> enemies = _towerComp.enemiesInRange;

            if (enemies.Count == 0)
            {
                return;
            }
            
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

                // float worldDistance = Vector3.Distance(_camTransform.position, targetPos);
                // float distanceT = Mathf.InverseLerp(maxScaleAtDistance, minScaleAtDistance, worldDistance);
                // float scale = Mathf.Lerp(minScale, maxScale, distanceT);
                
                reticle.rectTransform.transform.position = imagePos;
                // reticle.rectTransform.localScale = new Vector3(scale, scale, scale);

                if (_currentCamera.IsLive)
                {
                    reticle.GetComponent<Image>().enabled = true;
                }
            }
            else
            {
                DisableImage();
            }
        }

        private void MoveCamera()
        {
            float y = Input.GetAxis("Mouse X") * turnSpeed;
            _rotX += Input.GetAxis("Mouse Y") * turnSpeed;
            
            _rotX = Mathf.Clamp(_rotX, MinTurnAngle, _maxTurnAngle);
            
            tower.transform.eulerAngles = new Vector3(-_rotX, _camTransform.eulerAngles.y + y, 0);
        }

        public void DisableImage()
        {
            reticle.GetComponent<Image>().enabled = false;
        }
        
        private void OnDrawGizmos()
        {
            Gizmos.color=Color.red;
            Gizmos.DrawWireSphere(_sphereGizmoPoint, crosshairRadius);
        }
    }
}
