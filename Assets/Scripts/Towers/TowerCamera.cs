using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.UI;

namespace Towers
{
    public class TowerCamera : MonoBehaviour
    {
        [SerializeField] private Camera camComponent;
        
        [SerializeField] private float turnSpeed = 4.0f;
        [SerializeField] private GameObject tower;
        private float _targetDistance;
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

        [SerializeField] private List<Collider> colliders;
        [SerializeField] private List<GameObject> hitEnemies;

        private void Start()
        {
            _searchRadius = GetComponentInParent<Tower>().attackRange + 5;
            _camTransform = transform;
            var position = _camTransform.position;
            _targetDistance = Vector3.Distance(position, tower.transform.position);
            camComponent = GetComponent<Camera>();
        }
        
        private void Update()
        {
            MoveCamera();
            
            Vector3 center = new Vector3(Screen.width / 2, Screen.height / 2, 0);
            Ray ray = camComponent.ScreenPointToRay(center);
            List<RaycastHit> raycastHits = Physics.SphereCastAll(ray, crosshairRadius, _searchRadius).ToList();
            
            colliders = Physics.OverlapSphere(tower.transform.position, _searchRadius).ToList();
            List<GameObject> enemies = new();
            foreach (var col in colliders)
            {
                GameObject colliderObject = col.gameObject;
                
                if (colliderObject.CompareTag("Enemy"))
                {
                    enemies.Add(colliderObject);
                }
            }

            if (raycastHits.Count == 0)
            {
                return;
            }
            
            hitEnemies = new();
            foreach (var hit in raycastHits)
            {
                _sphereGizmoPoint = hit.point;
                if (enemies.Contains(hit.collider.gameObject))
                {
                    hitEnemies.Add(hit.collider.gameObject);
                }
            }

            if (hitEnemies.Count > 0)
            {
                GameObject closestEnemyToCenter = hitEnemies[0];
                float minDistance = 1000; // Diameter
                foreach (var enemyHit in hitEnemies)
                {
                    RaycastHit hit = raycastHits.Find(x => x.collider.gameObject == enemyHit);
                    Vector3 screenPos = camComponent.WorldToScreenPoint(enemyHit.transform.position);
                    
                    screenPos.z = 0;
                    float distance = Vector3.Distance(screenPos, center);
                    Debug.Log(screenPos);
                    if (distance < minDistance)
                    {
                        minDistance = distance;
                        closestEnemyToCenter = enemyHit;
                    }
                }

                currentTarget = closestEnemyToCenter;
                var targetPos = currentTarget.transform.position;
                Vector3 imagePos = camComponent.WorldToScreenPoint(targetPos);

                float worldDistance = Vector3.Distance(_camTransform.position, targetPos);
                float distanceT = Mathf.InverseLerp(maxScaleAtDistance, minScaleAtDistance, worldDistance);
                float scale = Mathf.Lerp(minScale, maxScale, distanceT);
                
                reticle.rectTransform.transform.position = imagePos;
                reticle.rectTransform.localScale = new Vector3(scale, scale, scale);
                reticle.GetComponent<Image>().enabled = true;
            }
            else
            {
                reticle.GetComponent<Image>().enabled = false;
            }
        }

        private void MoveCamera()
        {
            if (!camComponent.enabled)
            {
                return;
            }
            
            float y = Input.GetAxis("Mouse X") * turnSpeed;
            _rotX += Input.GetAxis("Mouse Y") * turnSpeed;
            
            _rotX = Mathf.Clamp(_rotX, MinTurnAngle, _maxTurnAngle);
            
            _camTransform.eulerAngles = new Vector3(-_rotX, _camTransform.eulerAngles.y + y, 0);
            _camTransform.position = tower.transform.position - _camTransform.forward * _targetDistance - _camTransform.right + 2 * Vector3.up;
        }
        
        private void OnDrawGizmos()
        {
            Gizmos.color=Color.red;
            Gizmos.DrawWireSphere(_sphereGizmoPoint, crosshairRadius);
        }
    }
}
