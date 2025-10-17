using System.Collections.Generic;
using UnityEngine;

namespace GameEvents.Timed.Events
{
    public class FogRevealerManager : MonoBehaviour
    {
        [SerializeField] private Material fogMaterial;
        [SerializeField] private int maxTowers = 8;
        [SerializeField] private float softness = 2f;

        private static readonly List<TowerRevealer> towers = new List<TowerRevealer>();
        private readonly Vector4[] towerData = new Vector4[8];

        public static void Register(TowerRevealer t)
        {
            if (!towers.Contains(t)) towers.Add(t);
        }

        public static void Unregister(TowerRevealer t)
        {
            towers.Remove(t);
        }

        private void LateUpdate()
        {
            if (!fogMaterial) return;

            int limit = Mathf.Clamp(maxTowers, 0, 8);
            int count = Mathf.Min(towers.Count, limit);
            for (int i = 0; i < count; i++)
            {
                var t = towers[i];
                Vector3 p = t.transform.position;
                towerData[i] = new Vector4(p.x, p.y, p.z, Mathf.Max(t.radius, 0f));
            }
            for (int i = count; i < 8; i++) towerData[i] = Vector4.zero;

            fogMaterial.SetFloat("_RevealCount", count);
            fogMaterial.SetFloat("_Softness", softness);
            fogMaterial.SetVector("_RevealTower0", towerData[0]);
            fogMaterial.SetVector("_RevealTower1", towerData[1]);
            fogMaterial.SetVector("_RevealTower2", towerData[2]);
            fogMaterial.SetVector("_RevealTower3", towerData[3]);
            fogMaterial.SetVector("_RevealTower4", towerData[4]);
            fogMaterial.SetVector("_RevealTower5", towerData[5]);
            fogMaterial.SetVector("_RevealTower6", towerData[6]);
            fogMaterial.SetVector("_RevealTower7", towerData[7]);
        }
    }
}