using System.Collections.Generic;
using UnityEngine;

namespace Towers
{
    public class TowerCamera : MonoBehaviour
    {
        [SerializeField] private Camera camComponent;
        
        [SerializeField] private float turnSpeed = 4.0f;
        [SerializeField] private GameObject target;
        private float _targetDistance;
        private const float MinTurnAngle = -90.0f;
        private float _maxTurnAngle;
        private float _rotX;

        private Transform _camTransform;

        public GameObject currentTarget;

        [SerializeField] private float maxDistance;
        [SerializeField] private float searchRadius;
        [SerializeField] private float sphereRadius;

        private Vector3 _sphereGizmoPoint;
        
        private void Start()
        {
            _camTransform = transform;
            var position = _camTransform.position;
            _targetDistance = Vector3.Distance(position, target.transform.position);
            camComponent = GetComponent<Camera>();
        }
        
        private void Update()
        {
            if (!camComponent.enabled)
            {
                return;
            }
            
            float y = Input.GetAxis("Mouse X") * turnSpeed;
            _rotX += Input.GetAxis("Mouse Y") * turnSpeed;
            
            _rotX = Mathf.Clamp(_rotX, MinTurnAngle, _maxTurnAngle);
            
            _camTransform.eulerAngles = new Vector3(-_rotX, _camTransform.eulerAngles.y + y, 0);
            _camTransform.position = target.transform.position - _camTransform.forward * _targetDistance - _camTransform.right + 2 * Vector3.up;

            Vector3 center = new Vector3(Screen.width / 2, Screen.height / 2, 0);
            // Ray ray = camComponent.ScreenPointToRay(center);
            // if (Physics.SphereCast(ray, radius, out RaycastHit hit, maxDistance))
            // {
            //     _sphereGizmoPoint = hit.point;
            //     if (hit.collider.gameObject.CompareTag("Enemy"))
            //     {
            //         GameObject hitEnemy = hit.collider.gameObject;
            //         if (!enemies.Contains(hitEnemy))
            //         {
            //             enemies.Add(hitEnemy);
            //         }
            //     }
            // }
            Ray ray = camComponent.ScreenPointToRay(center);
            RaycastHit[] raycastHits = Physics.SphereCastAll(ray, sphereRadius, maxDistance);
            foreach (var raycastHit in raycastHits)
            {
                GameObject colliderObject = raycastHit.collider.gameObject;
                _sphereGizmoPoint = raycastHit.point;

                if (colliderObject.CompareTag("Enemy"))
                {
                    Collider[] colliders = Physics.OverlapSphere(target.transform.position, searchRadius);
                    for (int i = 0; i < colliders.Length; ++i)
                    {
                        if (colliderObject == colliders[i].gameObject)
                        {
                            currentTarget = colliderObject;
                        }
                    }
                }
            }
        }
        
        void OnDrawGizmos()
        {
            Gizmos.color=Color.red;
            Gizmos.DrawSphere(_sphereGizmoPoint, sphereRadius);
        }
    }
}
