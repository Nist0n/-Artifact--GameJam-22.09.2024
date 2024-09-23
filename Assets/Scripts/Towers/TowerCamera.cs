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
            
            // get the mouse inputs
            float y = Input.GetAxis("Mouse X") * turnSpeed;
            _rotX += Input.GetAxis("Mouse Y") * turnSpeed;
            // clamp the vertical rotation
            _rotX = Mathf.Clamp(_rotX, MinTurnAngle, _maxTurnAngle);
            // rotate the camera
            _camTransform.eulerAngles = new Vector3(-_rotX, _camTransform.eulerAngles.y + y, 0);
            // move the camera position
            _camTransform.position = target.transform.position - _camTransform.forward * _targetDistance - _camTransform.right + Vector3.up;
        }
    }
}
