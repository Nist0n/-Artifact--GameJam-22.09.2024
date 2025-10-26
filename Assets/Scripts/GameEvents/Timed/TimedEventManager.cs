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
			
			// Find BossChoiceManager if not assigned
			if (!bossChoiceManager)
			{
				bossChoiceManager = FindAnyObjectByType<BossChoiceManager>();
			}
		}

		private void Start()
		{
			if (autoStartOnAwake)
			{
				StartCoroutine(StartNextCycle());
			}
		}

		public IEnumerator StartNextCycle()
		{
			yield return new WaitForSeconds(intervalBetweenEvents);
			
			if (_runner != null)
			{
				StopCoroutine(_runner);
				_runner = null;
			}

			RefillQueue();
			if (debugLogs) Debug.Log($"[TimedEventManager] Starting cycle. Events queued: {_queue.Count}");
			_runner = StartCoroutine(RunCycle());
		}

		private void RefillQueue()
		{
			_queue.Clear();
			List<TimedEvent> candidates = allEvents
				.Where(e => e && e.IsEligible(_config))
				.ToList();
			if (debugLogs) Debug.Log($"[TimedEventManager] Eligible candidates: {candidates.Count} / {(allEvents != null ? allEvents.Count : 0)}");
			if (candidates.Count == 0) return;
			
			for (int i = 0; i < eventsPerCycle; i++)
			{
				TimedEvent picked = WeightedPick(candidates);
				if (!picked) break;
				_queue.Enqueue(picked);
				candidates.Remove(picked);
				if (candidates.Count == 0) break;
			}
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
			while (_queue.Count > 0)
			{
				TimedEvent next = _queue.Dequeue();
				var runtime = new TimedEventRuntime(gameObject, _config);
				if (debugLogs) Debug.Log($"[TimedEventManager] Executing event: {next?.name} ({next?.EventId})");
				yield return StartCoroutine(next.Execute(runtime));
				next.Revert(runtime);
				completedInCycle++;
				if (debugLogs) Debug.Log($"[TimedEventManager] Event completed: {next?.name}. Completed in cycle: {completedInCycle}");
				OnCycleProgress?.Invoke(completedInCycle);
				if (_queue.Count > 0)
				{
					yield return new WaitForSeconds(intervalBetweenEvents);
				}
			}
			OnCycleCompleted?.Invoke();
			if (debugLogs) Debug.Log("[TimedEventManager] Cycle completed");
			_runner = null;
			if (loopCycles)
			{
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
			StartCoroutine(StartNextCycle());
		}
	}
}


