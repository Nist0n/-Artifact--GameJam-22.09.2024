using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace GameConfiguration.Directors.Elites
{
    public class HockeyPlayerElite : EliteAbility
    {
        public float TrailWidth = 1.8f;
        public float SpeedBoost = 1.5f;
        public float IceLifetime = 20f;
        public GameObject IceTrailPrefab;
        
        private Transform _enemyTransform;
        private Vector3 _lastTrailPosition;
        private float _trailUpdateTimer;
        private const float TrailUpdateInterval = 0.5f;
        private int _trailId;
        private static int _nextTrailId = 1;
        
        public override void Initialize(GameObject enemyRoot)
        {
            _enemyTransform = enemyRoot.transform;
            _lastTrailPosition = _enemyTransform.position;
            _trailId = _nextTrailId++;
            StartCoroutine(UpdateTrail());
        }
        
        private IEnumerator UpdateTrail()
        {
            while (_enemyTransform)
            {
                _trailUpdateTimer += Time.deltaTime;
                
                if (_trailUpdateTimer >= TrailUpdateInterval)
                {
                    CreateTrailSegment();
                    _trailUpdateTimer = 0f;
                }
                
                yield return null;
            }
        }
        
        private void CreateTrailSegment()
        {
            Vector3 currentPos = _enemyTransform.position;
            float distance = Vector3.Distance(_lastTrailPosition, currentPos);
            
            if (distance > 0.5f)
            {
                Vector3 direction = (currentPos - _lastTrailPosition).normalized;
                Vector3 segmentCenter = (_lastTrailPosition + currentPos) * 0.5f;
                
                var segment = new IceTrailSegment
                {
                    Position = segmentCenter,
                    Lifetime = IceLifetime,
                    GameObject = CreateTrailVisual(segmentCenter, direction, distance),
                    TrailId = _trailId,
                    Owner = this
                };
                
                IceTrailManager.Instance.AddTrail(segment);
                _lastTrailPosition = currentPos;
            }
        }
        
        private GameObject CreateTrailVisual(Vector3 position, Vector3 direction, float length)
        {
            if (IceTrailPrefab)
            {
                GameObject trailObj = Instantiate(IceTrailPrefab, position, Quaternion.LookRotation(direction));
                trailObj.transform.localScale = new Vector3(TrailWidth, 0.1f, length);
                return trailObj;
            }

            return null;
        }
    }
    
    [System.Serializable]
    public class IceTrailSegment
    {
        public Vector3 Position;
        public float Lifetime;
        public GameObject GameObject;
        public int TrailId;
        public HockeyPlayerElite Owner;
    }
}
