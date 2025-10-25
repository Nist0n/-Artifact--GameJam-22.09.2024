using System.Collections.Generic;
using UnityEngine;

namespace GameEvents.Timed.Events.Fog
{
    public class FogRevealerManager : MonoBehaviour
    {
        [SerializeField] private Material fogMaterial;
        [SerializeField] private int maxTowers = 6;
        [SerializeField] private float softness = 2f;

        private static readonly List<TowerRevealer> Towers = new List<TowerRevealer>();
        private readonly Vector4[] _towerData = new Vector4[8];
        private int _limit;
        private int _count;

        private void Start()
        {
            _limit = Mathf.Clamp(maxTowers, 0, 6);
            _count = Mathf.Min(Towers.Count, _limit);
        }

        public static void Register(TowerRevealer t)
        {
            if (!Towers.Contains(t)) Towers.Add(t);
        }

        public static void Unregister(TowerRevealer t)
        {
            Towers.Remove(t);
        }
        
        private void LateUpdate()
        {
            if (!fogMaterial) return;
            
            for (int i = 0; i < _count; i++)
            {
                var t = Towers[i];
                Vector3 p = t.transform.position;
                float radius = t.GetEffectiveRadius();
                _towerData[i] = new Vector4(p.x, p.y, p.z, radius);
            }
            for (int i = _count; i < 8; i++) _towerData[i] = Vector4.zero;
            
            fogMaterial.SetFloat("_RevealCount", _count);
            fogMaterial.SetFloat("_Softness", softness);
            fogMaterial.SetVector("_RevealTower0", _towerData[0]);
            fogMaterial.SetVector("_RevealTower1", _towerData[1]);
            fogMaterial.SetVector("_RevealTower2", _towerData[2]);
            fogMaterial.SetVector("_RevealTower3", _towerData[3]);
            fogMaterial.SetVector("_RevealTower4", _towerData[4]);
            fogMaterial.SetVector("_RevealTower5", _towerData[5]);
        }
    }
}