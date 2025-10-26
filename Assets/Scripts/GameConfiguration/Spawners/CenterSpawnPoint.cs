using UnityEngine;

namespace GameConfiguration.Spawners
{
    /// <summary>
    /// Marks a transform as the center spawn point for bosses
    /// This should be placed at the center of the map where bosses should spawn
    /// </summary>
    public class CenterSpawnPoint : MonoBehaviour
    {
        [Header("Spawn Point Settings")]
        [SerializeField] private bool isActive = true;
        [SerializeField] private string spawnPointName = "Center Spawn Point";
        
        public bool IsActive => isActive;
        public string SpawnPointName => spawnPointName;
        
        private void OnDrawGizmos()
        {
            if (!isActive) return;
            
            // Draw a red sphere to show the spawn point
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(transform.position, 2f);
            
            // Draw an arrow pointing up
            Gizmos.color = Color.yellow;
            Gizmos.DrawLine(transform.position, transform.position + Vector3.up * 3f);
            Gizmos.DrawLine(transform.position + Vector3.up * 3f, transform.position + Vector3.up * 2.5f + Vector3.right * 0.5f);
            Gizmos.DrawLine(transform.position + Vector3.up * 3f, transform.position + Vector3.up * 2.5f + Vector3.left * 0.5f);
        }
        
        private void OnDrawGizmosSelected()
        {
            if (!isActive) return;
            
            // Draw a larger sphere when selected
            Gizmos.color = Color.red;
            Gizmos.DrawSphere(transform.position, 2f);
        }
        
        public void SetActive(bool active)
        {
            isActive = active;
        }
        
        public void SetSpawnPointName(string name)
        {
            spawnPointName = name;
        }
    }
}
