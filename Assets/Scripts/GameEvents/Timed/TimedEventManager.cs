using System.Collections;
using System.Collections.Generic;
using System.Linq;
using GameConfiguration;
using UnityEngine;

namespace GameEvents.Timed
{
	public class TimedEventManager : MonoBehaviour
	{
		[SerializeField] private List<TimedEvent> allEvents;
		[SerializeField] private int eventsPerCycle = 4;
		[SerializeField] private float intervalBetweenEvents = 450f;
		[SerializeField] private bool autoStartOnAwake = true;
		[SerializeField] private bool loopCycles = true;
		[SerializeField] private bool debugLogs = true;
		[SerializeField] private BossChoiceManager bossChoiceManager;
		
		public int EventsPerCycle => eventsPerCycle;
		public float IntervalBetweenEvents => intervalBetweenEvents;
		public bool AutoStartOnAwake => autoStartOnAwake;
		public bool LoopCycles => loopCycles;
	
		private readonly Queue<TimedEvent> _queue = new Queue<TimedEvent>();
		private Coroutine _runner;
		private GameConfig _config;

		public System.Action<int> OnCycleProgress; // invoked with completed count in the current cycle
		public System.Action OnCycleCompleted;     // called after eventsPerCycle processed

		private void Awake()
		{
			_config = GameConfig.Instance;
			if (!_config)
			{
				_config = FindAnyObjectByType<GameConfig>();
				if (debugLogs) Debug.Log("[TimedEventManager] GameConfig resolved in Awake via FindAnyObjectByType: " + (_config));
			}
			
			if (!bossChoiceManager)
			{
				bossChoiceManager = FindAnyObjectByType<BossChoiceManager>();
			}
		}

		private void Start()
		{
			if (debugLogs) Debug.Log($"[TimedEventManager] Start() called. autoStartOnAwake: {autoStartOnAwake}, intervalBetweenEvents: {intervalBetweenEvents}s");
			if (autoStartOnAwake)
			{
				StartCoroutine(StartNextCycle());
			}
		}

		public IEnumerator StartNextCycle()
		{
			if (debugLogs) Debug.Log($"[TimedEventManager] StartNextCycle() called. Waiting {intervalBetweenEvents}s before starting cycle...");
			yield return new WaitForSeconds(intervalBetweenEvents);
			
			if (debugLogs) Debug.Log($"[TimedEventManager] Wait completed. Starting cycle preparation...");
			
			if (_runner != null)
			{
				StopCoroutine(_runner);
				_runner = null;
			}
			
			_queue.Clear();
			if (debugLogs) Debug.Log($"[TimedEventManager] Starting cycle with dynamic event selection");
			_runner = StartCoroutine(RunCycle());
		}

		private void RefillQueue()
		{
			_queue.Clear();
			if (debugLogs) Debug.Log($"[TimedEventManager] RefillQueue() - allEvents count: {(allEvents != null ? allEvents.Count : 0)}");
			
			if (allEvents == null)
			{
				if (debugLogs) Debug.LogError("[TimedEventManager] allEvents is NULL! Check inspector assignment.");
				return;
			}
			
			if (allEvents.Count == 0)
			{
				if (debugLogs) Debug.LogWarning("[TimedEventManager] allEvents is empty! Add events to the list in inspector.");
				return;
			}
			
			if (debugLogs)
			{
				Debug.Log($"[TimedEventManager] GameConfig: {_config}, GameTime: {_config?.GameTime}, GameDifficulty: {_config?.GameDifficulty}");
				for (int i = 0; i < allEvents.Count; i++)
				{
					var evt = allEvents[i];
					if (evt == null)
					{
						Debug.LogWarning($"[TimedEventManager] Event {i} is NULL!");
					}
					else
					{
						bool isEligible = evt.IsEligible(_config);
						Debug.Log($"[TimedEventManager] Event {i} ({evt.name}): Eligible={isEligible}, MinDiff={evt.MinDifficulty}, MaxDiff={evt.MaxDifficulty}, MinTime={evt.MinGameTimeMinutes}, MaxTime={evt.MaxGameTimeMinutes}");
					}
				}
			}
			
			List<TimedEvent> candidates = allEvents
				.Where(e => e && e.IsEligible(_config))
				.ToList();
			if (debugLogs) Debug.Log($"[TimedEventManager] Eligible candidates: {candidates.Count} / {(allEvents != null ? allEvents.Count : 0)}");
			
			if (candidates.Count == 0) 
			{
				if (debugLogs) Debug.LogWarning("[TimedEventManager] No eligible events found! Check event conditions and GameConfig.");
				return;
			}
			
			for (int i = 0; i < eventsPerCycle; i++)
			{
				TimedEvent picked = WeightedPick(candidates);
				if (!picked) 
				{
					if (debugLogs) Debug.LogWarning($"[TimedEventManager] Failed to pick event {i+1}/{eventsPerCycle}");
					break;
				}
				_queue.Enqueue(picked);
				if (debugLogs) Debug.Log($"[TimedEventManager] Queued event {i+1}: {picked.name} (weight: {picked.SelectionWeight})");
				candidates.Remove(picked);
				if (candidates.Count == 0) break;
			}
			
			if (debugLogs) Debug.Log($"[TimedEventManager] Queue filled with {_queue.Count} events");
		}

		private TimedEvent SelectEligibleEvent()
		{
			if (allEvents == null || allEvents.Count == 0)
			{
				if (debugLogs) Debug.LogWarning("[TimedEventManager] No events available for selection");
				return null;
			}
			
			List<TimedEvent> eligibleEvents = allEvents
				.Where(e => e && e.IsEligible(_config))
				.ToList();
			
			if (debugLogs) Debug.Log($"[TimedEventManager] Found {eligibleEvents.Count} eligible events for current time");
			
			if (eligibleEvents.Count == 0)
			{
				if (debugLogs) Debug.LogWarning("[TimedEventManager] No eligible events found for current time and difficulty");
				return null;
			}
			
			return WeightedPick(eligibleEvents);
		}
		
		private static TimedEvent WeightedPick(List<TimedEvent> list)
		{
			float total = 0f;
			for (int i = 0; i < list.Count; i++) total += Mathf.Max(0.0001f, list[i].SelectionWeight);
			float r = Random.value * total;
			foreach (var e in list)
			{
				r -= Mathf.Max(0.0001f, e.SelectionWeight);
				if (r <= 0f) return e;
			}
			return list.Count > 0 ? list[0] : null;
		}

		private IEnumerator RunCycle()
		{
			int completedInCycle = 0;
			if (debugLogs) Debug.Log($"[TimedEventManager] RunCycle() started - will select {eventsPerCycle} events dynamically");
			
			for (int i = 0; i < eventsPerCycle; i++)
			{
				TimedEvent selectedEvent = SelectEligibleEvent();
				
				if (!selectedEvent)
				{
					if (debugLogs) Debug.LogWarning($"[TimedEventManager] No eligible events found for event {i + 1}/{eventsPerCycle}. Skipping...");
					continue;
				}
				
				var runtime = new TimedEventRuntime(gameObject, _config);
				if (debugLogs) Debug.Log($"[TimedEventManager] Executing event {i + 1}/{eventsPerCycle}: {selectedEvent.name} ({selectedEvent.EventId})");
				yield return StartCoroutine(selectedEvent.Execute(runtime));
				selectedEvent.Revert(runtime);
				
				completedInCycle++;
				if (debugLogs) Debug.Log($"[TimedEventManager] Event completed: {selectedEvent.name}. Completed in cycle: {completedInCycle}");
				OnCycleProgress?.Invoke(completedInCycle);
				
				if (i < eventsPerCycle - 1)
				{
					if (debugLogs) Debug.Log($"[TimedEventManager] Waiting {intervalBetweenEvents}s before next event...");
					yield return new WaitForSeconds(intervalBetweenEvents);
				}
			}
			
			OnCycleCompleted?.Invoke();
			if (debugLogs) Debug.Log("[TimedEventManager] Cycle completed");
			_runner = null;
			if (loopCycles)
			{
				if (debugLogs) Debug.Log("[TimedEventManager] Showing boss choice...");
				ShowBossChoice();
			}
		}
		
		private void ShowBossChoice()
		{
			if (bossChoiceManager)
			{
				bossChoiceManager.ShowBossChoice();
			}
			else
			{
				Debug.LogWarning("[TimedEventManager] BossChoiceManager not found! Cannot show boss choice.");
			}
		}
		
		private void OnEnable()
		{
			if (bossChoiceManager)
			{
				bossChoiceManager.OnBossSpawned += OnBossSpawned;
				bossChoiceManager.OnEventsContinued += OnEventsContinued;
			}
		}
		
		private void OnDisable()
		{
			if (bossChoiceManager)
			{
				bossChoiceManager.OnBossSpawned -= OnBossSpawned;
				bossChoiceManager.OnEventsContinued -= OnEventsContinued;
			}
		}
		
		private void OnBossSpawned()
		{
			if (debugLogs) Debug.Log("[TimedEventManager] Boss spawned - stopping event cycles");
			loopCycles = false;
		}
		
		private void OnEventsContinued()
		{
			if (debugLogs) Debug.Log("[TimedEventManager] Events continued - starting next cycle");
			loopCycles = true; 
			StartCoroutine(StartNextCycle());
		}
	}
}


