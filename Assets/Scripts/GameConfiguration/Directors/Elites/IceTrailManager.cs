using System.Collections;
using System.Collections.Generic;
using Enemies;
using UnityEngine;

namespace GameConfiguration.Directors.Elites
{
    public class IceTrailManager : MonoBehaviour
    {
        private static IceTrailManager _instance;
        public static IceTrailManager Instance
        {
            get
            {
                if (!_instance)
                {
                    GameObject go = new GameObject("IceTrailManager");
                    _instance = go.AddComponent<IceTrailManager>();
                    DontDestroyOnLoad(go);
                }
                return _instance;
            }
        }
        
        private List<IceTrailSegment> _allTrails = new List<IceTrailSegment>();
        private Dictionary<GameObject, float> _originalSpeeds = new Dictionary<GameObject, float>();
        private Dictionary<GameObject, int> _boostCount = new Dictionary<GameObject, int>();
        private List<GameObject> _enemiesOnIce = new List<GameObject>();
        
        private void Update()
        {
            UpdateTrails();
            CheckEnemiesOnIce();
        }
        
        private void UpdateTrails()
        {
            for (int i = _allTrails.Count - 1; i >= 0; i--)
            {
                var trail = _allTrails[i];
                trail.Lifetime -= Time.deltaTime;
                
                if (trail.Lifetime <= 0f)
                {
                    DestroyTrail(trail);
                    _allTrails.RemoveAt(i);
                }
            }
        }
        
        private void CheckEnemiesOnIce()
        {
            foreach (var enemy in _enemiesOnIce)
            {
                if (enemy)
                {
                    RemoveSpeedBoost(enemy);
                }
            }
            _enemiesOnIce.Clear();
            
            GameObject[] enemies = GameObject.FindGameObjectsWithTag("Enemy");
            
            foreach (var enemy in enemies)
            {
                if (IsEnemyOnIce(enemy))
                {
                    _enemiesOnIce.Add(enemy);
                    ApplySpeedBoost(enemy, 1.5f);
                }
            }
        }
        
        public void CheckNewEnemy(GameObject enemy)
        {
            if (IsEnemyOnIce(enemy))
            {
                _enemiesOnIce.Add(enemy);
                ApplySpeedBoost(enemy, 1.5f);
            }
        }
        
        private bool IsEnemyOnIce(GameObject enemy)
        {
            Vector3 enemyPos = enemy.transform.position;
            
            foreach (var trail in _allTrails)
            {
                if (!trail.GameObject) continue;
                
                Vector3 trailPos = trail.GameObject.transform.position;
                Vector3 trailScale = trail.GameObject.transform.localScale;
                
                float distance = Vector3.Distance(enemyPos, trailPos);
                if (distance <= trailScale.x / 2f)
                {
                    return true;
                }
            }
            
            return false;
        }
        
        public void AddTrail(IceTrailSegment trail)
        {
            _allTrails.Add(trail);
        }
        
        public void MeltTrails(Vector3 position, float radius)
        {
            List<IceTrailSegment> trailsToMelt = new List<IceTrailSegment>();
            
            for (int i = 0; i < _allTrails.Count; i++)
            {
                var trail = _allTrails[i];
                if (!trail.GameObject) continue;
                
                float distance = Vector3.Distance(position, trail.GameObject.transform.position);
                
                if (distance <= radius)
                {
                    trailsToMelt.Add(trail);
                }
            }
            
            if (trailsToMelt.Count > 0)
            {
                MeltEntirePath(trailsToMelt);
            }
        }
        
        private void MeltEntirePath(List<IceTrailSegment> initialTrails)
        {
            HashSet<int> trailIdsToMelt = new HashSet<int>();
            foreach (var trail in initialTrails)
            {
                trailIdsToMelt.Add(trail.TrailId);
            }
            
            List<IceTrailSegment> allSegmentsToMelt = new List<IceTrailSegment>();
            
            for (int i = _allTrails.Count - 1; i >= 0; i--)
            {
                var trail = _allTrails[i];
                if (trailIdsToMelt.Contains(trail.TrailId))
                {
                    allSegmentsToMelt.Add(trail);
                    _allTrails.RemoveAt(i);
                }
            }
            
            foreach (var segment in allSegmentsToMelt)
            {
                StartCoroutine(MeltTrail(segment));
            }
        }
        
        private IEnumerator MeltTrail(IceTrailSegment trail)
        {
            if (!trail.GameObject) yield break;
            
            float meltTimer = 0f;
            float meltTime = 2f;
            Vector3 originalScale = trail.GameObject.transform.localScale;
            
            while (meltTimer < meltTime && trail.GameObject)
            {
                meltTimer += Time.deltaTime;
                float meltProgress = meltTimer / meltTime;
                
                trail.GameObject.transform.localScale = Vector3.Lerp(originalScale, Vector3.zero, meltProgress);
                
                var renderer = trail.GameObject.GetComponent<Renderer>();
                if (renderer && renderer.material.HasProperty("_Color"))
                {
                    Color color = renderer.material.color;
                    color.a = Mathf.Lerp(1f, 0f, meltProgress);
                    renderer.material.color = color;
                }
                
                yield return null;
            }
            
            DestroyTrail(trail);
        }
        
        private void DestroyTrail(IceTrailSegment trail)
        {
            if (trail.GameObject)
            {
                Destroy(trail.GameObject);
            }
        }
        
        private void ApplySpeedBoost(GameObject enemy, float boostMultiplier)
        {
            var enemyCore = enemy.GetComponent<Enemy>();
            if (!enemyCore) return;
            
            if (!_originalSpeeds.ContainsKey(enemy))
            {
                _originalSpeeds[enemy] = enemyCore.Speed;
                _boostCount[enemy] = 0;
            }
            
            if (_boostCount[enemy] == 0)
            {
                enemyCore.Speed = _originalSpeeds[enemy] * boostMultiplier;
            }
            
            _boostCount[enemy]++;
        }
        
        private void RemoveSpeedBoost(GameObject enemy)
        {
            if (!_originalSpeeds.ContainsKey(enemy)) return;
            
            _boostCount[enemy]--;
            
            if (_boostCount[enemy] <= 0)
            {
                var enemyCore = enemy.GetComponent<Enemy>();
                if (enemyCore)
                {
                    enemyCore.Speed = _originalSpeeds[enemy];
                }
                
                _originalSpeeds.Remove(enemy);
                _boostCount.Remove(enemy);
            }
        }
        
        public void CleanupEnemy(GameObject enemy)
        {
            if (_originalSpeeds.ContainsKey(enemy))
            {
                _originalSpeeds.Remove(enemy);
                _boostCount.Remove(enemy);
            }
        }
        
        private void OnDestroy()
        {
            foreach (var trail in _allTrails)
            {
                if (trail.GameObject)
                {
                    Destroy(trail.GameObject);
                }
            }
            _allTrails.Clear();
        }
    }
}
