using UnityEngine;

namespace GameEvents.Timed
{
    public class TimedEventDebugSetup : MonoBehaviour
    {
        [SerializeField] private bool autoSetupOnStart = true;
        [SerializeField] private bool createDebugUI = true;
        
        private void Start()
        {
            if (autoSetupOnStart && createDebugUI)
            {
                SetupDebugUI();
            }
        }
        
        [ContextMenu("Setup Debug UI")]
        public void SetupDebugUI()
        {
            TimedEventDebugUI existingDebugUI = FindAnyObjectByType<TimedEventDebugUI>();
            if (existingDebugUI)
            {
                Debug.Log("[TimedEventDebugSetup] Debug UI already exists!");
                return;
            }
            
            GameObject debugGO = new GameObject("TimedEventDebugUI");
            TimedEventDebugUI debugUI = debugGO.AddComponent<TimedEventDebugUI>();
            
            Debug.Log("[TimedEventDebugSetup] Debug UI created! Press F1 to toggle visibility.");
        }
        
        [ContextMenu("Remove Debug UI")]
        public void RemoveDebugUI()
        {
            TimedEventDebugUI existingDebugUI = FindAnyObjectByType<TimedEventDebugUI>();
            if (existingDebugUI)
            {
                DestroyImmediate(existingDebugUI.gameObject);
                Debug.Log("[TimedEventDebugSetup] Debug UI removed!");
            }
            else
            {
                Debug.Log("[TimedEventDebugSetup] No debug UI found to remove.");
            }
        }
    }
}
