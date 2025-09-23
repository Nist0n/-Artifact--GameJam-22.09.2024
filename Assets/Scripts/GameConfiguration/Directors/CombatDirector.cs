using System;
using GameConfiguration.Cards;
using GameConfiguration.Directors.Functions;
using UnityEngine;
using UnityEngine.Serialization;
using Random = UnityEngine.Random;

namespace GameConfiguration.Directors
{
    public class CombatDirector : MonoBehaviour
    {
        [SerializeField] private WeightSelection category;
        [SerializeField] private float monsterCredit;
        [SerializeField] private RangeFloat[] moneyWaveIntervals;
    
        private const float MinSeriesSpawnInterval = 0.1f;
        private const float MaxSeriesSpawnInterval = 1f;
        [SerializeField] private float minRerollSpawnInterval;
        [SerializeField] private float maxRerollSpawnInterval;
        private const int MaxConsecutiveCheapSkips = int.MaxValue;
        private const int MaximumNumberToSpawnBeforeSkipping = 12;
    
        private bool _shouldSpawnOneWave;
        private bool _hasStartedWave;
        private DirectorCard _currentMonsterCard;
        private int _consecutiveCheapSkips;
        private int _spawnCountInCurrentWave;
        private DirectorMoneyWave[] _moneyWaves;

        private float monsterSpawnTimer { get; set; }

        public DirectorCard lastAttemptedMonsterCard { get; set; }
        
        private int mostExpensiveMonsterCostInDeck
        {
            get
            {
                int a = 0;
                for (int i = 0; i < category.cards.Length; ++i)
                {
                    DirectorCard directorCard = category.GetChoice(i);
                    int b = directorCard.Cost;
                    a = Mathf.Max(a, b);
                }
                return a;
            }
        }
    
        private void Awake()
        {
            _moneyWaves = new DirectorMoneyWave[moneyWaveIntervals.Length];
            for (int index = 0; index < moneyWaveIntervals.Length; ++index)
                _moneyWaves[index] = new DirectorMoneyWave
                {
                    Interval = Random.Range(moneyWaveIntervals[index].Min, moneyWaveIntervals[index].Max),
                };
        }
        
        private void PrepareNewMonsterWave(DirectorCard monsterCard)
        {
            _currentMonsterCard = monsterCard;
            lastAttemptedMonsterCard = _currentMonsterCard;
            _spawnCountInCurrentWave = 0;
        }

        private bool AttemptSpawnOnTarget()
        {
            if (!_currentMonsterCard)
            {
                PrepareNewMonsterWave(category.Evaluate(Random.value));
            }
      
            int num1 = _currentMonsterCard.Cost;
      
            if (_spawnCountInCurrentWave >= MaximumNumberToSpawnBeforeSkipping)
            {
                _spawnCountInCurrentWave = 0;
                return false;
            }
      
            if (_consecutiveCheapSkips < MaxConsecutiveCheapSkips)
            {
                if (mostExpensiveMonsterCostInDeck > num1)
                {
                    ++_consecutiveCheapSkips;
                }
            }
            SpawnCard spawnCard = _currentMonsterCard.spawnCard;

            if (num1 > monsterCredit)
            {
                return false;
            }
      
            Transform spawnTarget1 = TakeRandomPositionToSpawn();
      
            if (!Spawn(spawnCard, spawnTarget1)) return false;
            monsterCredit -= num1;
            ++_spawnCountInCurrentWave;
            _consecutiveCheapSkips = 0;
            return true;
        }
        
        public bool Spawn(SpawnCard spawnCard, Transform spawnTarget)
        {
            DirectorCore.instance.TrySpawnObjectWithEffect(new DirectorSpawnRequest(spawnCard), spawnTarget, this, null);
            return true;
        }
    
        private void FixedUpdate()
        {
            float difficultyCoefficient = GameConfig.Instance.GameDifficulty;
            for (int index = 0; index < _moneyWaves.Length; ++index)
                monsterCredit += _moneyWaves[index].Update(Time.fixedDeltaTime, difficultyCoefficient);
            Simulate(Time.deltaTime);
        }
    
        private void Simulate(float deltaTime)
        {
            monsterSpawnTimer -= deltaTime;
            if (monsterSpawnTimer > 0.0)
                return;
            if (AttemptSpawnOnTarget())
            {
                if (_shouldSpawnOneWave) _hasStartedWave = true;
                monsterSpawnTimer += Random.Range(MinSeriesSpawnInterval, MaxSeriesSpawnInterval);
            }
            else
            {
                monsterSpawnTimer += Random.Range(minRerollSpawnInterval, maxRerollSpawnInterval);
                _currentMonsterCard = null;
                if (!_shouldSpawnOneWave || !_hasStartedWave)
                    return;
                enabled = false;
            }
        }
        
        private Transform TakeRandomPositionToSpawn()
        {
            int rand = Random.Range(0, GameConfig.Instance.Spawners.Count);

            return GameConfig.Instance.Spawners[rand].transform;
        }

        public void ResetGame()
        {
            monsterCredit = 0;
            _consecutiveCheapSkips = 0;
            _spawnCountInCurrentWave = 0;
            _hasStartedWave = false;
        }
        
        private class DirectorMoneyWave
        {
            public float Interval;
            private float _timer;
            private float _accumulatedAward;

            public float Update(float deltaTime, float difficultyCoefficient)
            {
                _timer += deltaTime;
                if (_timer > Interval)
                {
                    float num = 0.5f;
                    _timer -= Interval;
                    _accumulatedAward += Interval * (1.0f + 0.4f * difficultyCoefficient) * num;
                }
                float num1 = Mathf.FloorToInt(_accumulatedAward);
                _accumulatedAward -= num1;
                return num1;
            }
        }
    }
    
    [Serializable]
    public struct RangeFloat
    {
        public float Min;
        public float Max;
    }
}
