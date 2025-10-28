using UnityEngine;
using TMPro;
using UnityEngine.UI;
using System.Collections.Generic;

namespace GameEvents.Timed
{
    public class TimedEventDebugUI : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI debugText;
        [SerializeField] private bool showDebugUI = true;
        [SerializeField] private float updateInterval = 1f;
        [SerializeField] private KeyCode toggleKey = KeyCode.F1;
        
        private TimedEventManager _eventManager;
        private float _lastUpdateTime;
        private string _debugInfo = "";
        
        private void Awake()
        {
            _eventManager = FindAnyObjectByType<TimedEventManager>();
            if (!debugText)
            {
                CreateDebugText();
            }
        }
        
        private void CreateDebugText()
        {
            Canvas canvas = FindAnyObjectByType<Canvas>();
            if (!canvas)
            {
                GameObject canvasGO = new GameObject("DebugCanvas");
                canvas = canvasGO.AddComponent<Canvas>();
                canvas.renderMode = RenderMode.ScreenSpaceOverlay;
                canvas.sortingOrder = 1000;
                canvasGO.AddComponent<CanvasScaler>();
                canvasGO.AddComponent<GraphicRaycaster>();
            }
            
            GameObject textGO = new GameObject("DebugText");
            textGO.transform.SetParent(canvas.transform, false);
            
            debugText = textGO.AddComponent<TextMeshProUGUI>();
            debugText.text = "Debug Info Loading...";
            debugText.fontSize = 16;
            debugText.color = Color.yellow;
            
            RectTransform rectTransform = debugText.GetComponent<RectTransform>();
            rectTransform.anchorMin = new Vector2(0, 1);
            rectTransform.anchorMax = new Vector2(0, 1);
            rectTransform.pivot = new Vector2(0, 1);
            rectTransform.anchoredPosition = new Vector2(10, -10);
            rectTransform.sizeDelta = new Vector2(400, 200);
        }
        
        private void Update()
        {
            if (Input.GetKeyDown(toggleKey))
            {
                ToggleDebugUI();
            }
            
            if (!showDebugUI || !debugText || !_eventManager) return;
            
            if (Time.time - _lastUpdateTime >= updateInterval)
            {
                UpdateDebugInfo();
                _lastUpdateTime = Time.time;
            }
        }
        
        private void UpdateDebugInfo()
        {
            if (!_eventManager) return;
            
            var gameTime = GameConfiguration.GameConfig.Instance?.GameTime ?? 0f;
            var timeMinutes = Mathf.Floor(gameTime / 60);
            var timeSeconds = gameTime % 60;
            
            _debugInfo = $"=== TIMED EVENT DEBUG ===\n";
            _debugInfo += $"Game Time: {timeMinutes}:{timeSeconds:00}\n";
            _debugInfo += $"Game Difficulty: {GameConfiguration.GameConfig.Instance?.GameDifficulty:F2}\n";
            _debugInfo += $"Event Manager Active: {_eventManager}\n";
            _debugInfo += $"Auto Start: {_eventManager.AutoStartOnAwake}\n";
            _debugInfo += $"Loop Cycles: {_eventManager.LoopCycles}\n";
            _debugInfo += $"Interval: {_eventManager.IntervalBetweenEvents}s\n";
            _debugInfo += $"Events Per Cycle: {_eventManager.EventsPerCycle}\n";
            _debugInfo += $"Selection Mode: DYNAMIC\n";
            
            var queueField = typeof(TimedEventManager).GetField("_queue", 
                System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
            var runnerField = typeof(TimedEventManager).GetField("_runner", 
                System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
            
            if (queueField != null)
            {
                var queue = queueField.GetValue(_eventManager) as Queue<TimedEvent>;
                _debugInfo += $"Queue Count: {queue?.Count ?? 0}\n";
            }
            
            if (runnerField != null)
            {
                var runner = runnerField.GetValue(_eventManager) as Coroutine;
                _debugInfo += $"Runner Active: {runner != null}\n";
            }
            
            var allEventsField = typeof(TimedEventManager).GetField("allEvents", 
                System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
            if (allEventsField != null)
            {
                var allEvents = allEventsField.GetValue(_eventManager) as List<TimedEvent>;
                if (allEvents != null)
                {
                    int eligibleCount = 0;
                    int nullCount = 0;
                    _debugInfo += $"All Events: {allEvents.Count}\n";
                    
                    for (int i = 0; i < allEvents.Count; i++)
                    {
                        var evt = allEvents[i];
                        if (evt == null)
                        {
                            nullCount++;
                            _debugInfo += $"Event {i}: NULL\n";
                        }
                        else
                        {
                            bool isEligible = evt.IsEligible(GameConfiguration.GameConfig.Instance);
                            if (isEligible) eligibleCount++;
                            
                            _debugInfo += $"Event {i}: {evt.name}\n";
                            _debugInfo += $"  - Eligible: {isEligible}\n";
                            _debugInfo += $"  - MinDiff: {evt.MinDifficulty}, MaxDiff: {evt.MaxDifficulty}\n";
                            _debugInfo += $"  - MinTime: {evt.MinGameTimeMinutes}, MaxTime: {evt.MaxGameTimeMinutes}\n";
                            _debugInfo += $"  - Weight: {evt.SelectionWeight}\n";
                        }
                    }
                    
                    _debugInfo += $"Eligible: {eligibleCount}, Null: {nullCount}\n";
                }
            }
            
            _debugInfo += $"========================\n";
            
            debugText.text = _debugInfo;
        }
        
        public void ToggleDebugUI()
        {
            showDebugUI = !showDebugUI;
            if (debugText)
            {
                debugText.gameObject.SetActive(showDebugUI);
            }
        }
    }
}
