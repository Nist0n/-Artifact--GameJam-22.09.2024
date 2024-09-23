using System.Collections;
using UnityEngine;
using Enemies;
using UnityEngine.EventSystems;

namespace Towers
{
    public class Tower : MonoBehaviour
    {
        [SerializeField] protected int damage;
        [SerializeField] private float attackRange;
        [SerializeField] private float fireRate; // Time between shots
        
        [SerializeField] private GameObject projectilePrefab;
        
        [SerializeField] private Camera towerCamera;
        
        private AttackType _attackType;
        protected GameObject CurrentTarget;

        private bool _canShoot = true;

        private Camera _mainCamera;
        
        private void Awake()
        {
            _mainCamera = Camera.main;
            towerCamera.enabled = false;
        }

        private void Update()
        {
            if (Input.GetMouseButtonDown(0))
            {
                EnterTower();
            }

            if (Input.GetKeyDown(KeyCode.Escape))
            {
                ExitTower();
            }
        }

        private void EnterTower()
        {
            if (towerCamera.enabled) // If we are already looking through the tower's camera
            {
                return;
            }
            
            if (EventSystem.current.IsPointerOverGameObject())
            {
                return;
            }
            
            Ray ray = _mainCamera.ScreenPointToRay(Input.mousePosition);
            if (Physics.Raycast(ray, out RaycastHit hit))
            {
                if (hit.collider.gameObject == gameObject)
                {
                    _mainCamera.enabled = false;
                    towerCamera.enabled = true;
                }
            }
        }

        private void ExitTower()
        {
            if (_mainCamera.enabled)
            {
                return;
            }
            
            foreach (Camera enabledCamera in Camera.allCameras)
            {
                enabledCamera.enabled = false;
            }
            
            _mainCamera.enabled = true;
        }

        private void OnTriggerEnter(Collider other)
        {
            CurrentTarget = other.gameObject;
        }

        private void OnTriggerStay(Collider other)
        {
            // Maybe check for collider type
            Vector3 currentPos = transform.position;
            Vector3 enemyPos = other.transform.position;
            
            float distance = Vector3.Distance(currentPos, enemyPos);
            if (distance <= attackRange)
            {
                Enemy enemy = CurrentTarget.GetComponent<Enemy>();
                if (_canShoot)
                {
                    StartCoroutine(Shoot(currentPos, enemyPos, enemy));
                }
            }
        }

        private void OnTriggerExit(Collider other)
        {
            CurrentTarget = null;
            _canShoot = true;
            StopAllCoroutines();
        }

        private IEnumerator Shoot(Vector3 currentPos, Vector3 enemyPos, Enemy enemy)
        {
            _canShoot = false;
            
            Vector3 projectilePos =
                new Vector3(currentPos.x, currentPos.y + 4, currentPos.z);
            Projectile projectile = Instantiate(projectilePrefab, projectilePos, Quaternion.identity).GetComponent<Projectile>();
            projectile.damage = damage;
            // projectile.towerCamera = _mainCamera; // So Unity doesn't go insane, might need a proper fix
            if (CurrentTarget is not null)
            {
                projectile.CurrentTarget = CurrentTarget;
            }
            
            yield return new WaitForSeconds(fireRate);
            _canShoot = true;
        }
    }

    enum AttackType
    {
        
    }
}
