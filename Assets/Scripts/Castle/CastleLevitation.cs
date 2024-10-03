using UnityEngine;

namespace Castle {
    public class CastleLevitation : MonoBehaviour
    {
        public float amplitude = 0.5f;
        public float frequency = 1f;

        private Vector3 _startPos;

        void Start()
        {
            _startPos = transform.position;
        }

        void Update()
        {
            float newY = Mathf.Sin(Time.time * frequency) * amplitude;

            transform.position = new Vector3(_startPos.x, _startPos.y + newY, _startPos.z);
        }
    }
}
