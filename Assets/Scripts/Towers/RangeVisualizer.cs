using UnityEngine;

namespace Towers
{
    [RequireComponent(typeof(LineRenderer))]
    public class RangeVisualizer : MonoBehaviour
    {
        [SerializeField] private Tower tower;
        [SerializeField] private LayerMask groundMask;
        [SerializeField] private int segments = 64;
        [SerializeField] private float yOffset = 0.05f;
        [SerializeField] private Color lineColor = new Color(0f, 0.8f, 1f, 0.6f);
        [SerializeField] private float lineWidth = 0.15f;

        private LineRenderer _line;
        private float _lastRange;
        private Vector3 _lastPosition;

        private void Awake()
        {
            _line = GetComponent<LineRenderer>();
            _line.useWorldSpace = true;
            _line.loop = true;
            _line.positionCount = segments;
            _line.widthMultiplier = lineWidth;
            _line.startColor = lineColor;
            _line.endColor = lineColor;

            if (!tower)
            {
                tower = GetComponentInParent<Tower>();
            }
            SetVisible(false);
        }

        private void Update()
        {
            if (!tower) return;

            if (!Mathf.Approximately(_lastRange, tower.attackRange) || (transform.position != _lastPosition))
            {
                Redraw();
            }
        }

        public void SetVisible(bool visible)
        {
            if (_line)
            {
                _line.enabled = visible;
            }
        }

        public void Redraw()
        {
            _lastRange = tower.attackRange;
            _lastPosition = transform.position;

            float angleStep = 360f / segments;
            Vector3 center = tower.transform.position;

            for (int i = 0; i < segments; i++)
            {
                float angle = Mathf.Deg2Rad * (i * angleStep);
                Vector3 dir = new Vector3(Mathf.Cos(angle), 0f, Mathf.Sin(angle));
                Vector3 worldPoint = center + dir * _lastRange + Vector3.up * 50f;

                if (Physics.Raycast(worldPoint, Vector3.down, out RaycastHit hit, 200f, groundMask))
                {
                    _line.SetPosition(i, hit.point + Vector3.up * yOffset);
                }
                else
                {
                    _line.SetPosition(i, center + dir * _lastRange + Vector3.up * yOffset);
                }
            }
        }
    }
}


