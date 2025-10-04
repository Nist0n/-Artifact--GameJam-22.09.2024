using UnityEngine;
using UnityEngine.Serialization;

namespace UI.MainMenu
{
    public class MouseParallax : MonoBehaviour
    {
        [Header("Position Parallax")]
        public float PositionParallax = 1.0f;
        public Vector2 PositionParallaxScale = Vector2.one;

        [Space]
        
        public float PositionLerpSpeed = 10.0f;
        
        [Header("Rotation Parallax")]
        [Range(0.0f, 180.0f)] public float RotationParallax = 45.0f;
        public Vector2 RotationParallaxScale = Vector2.one;

        [Space]
        
        public float RotationLerpSpeed = 10.0f;

        void Update()
        {
            Vector2 normalizedMousePosition = new(

                Mathf.Clamp01(Input.mousePosition.x / Screen.width),
                Mathf.Clamp01(Input.mousePosition.y / Screen.height));

            normalizedMousePosition -= Vector2.one * 0.5f;
            normalizedMousePosition *= 2.0f;

            Vector2 targetPosition = -normalizedMousePosition * (PositionParallaxScale * PositionParallax);

            transform.localPosition = Vector3.Lerp(transform.localPosition, targetPosition, PositionLerpSpeed * Time.deltaTime);

            Quaternion targetRotation = Quaternion.Euler(

                -normalizedMousePosition.y * (RotationParallaxScale.y * RotationParallax),
                +normalizedMousePosition.x * (RotationParallaxScale.x * RotationParallax),

                0.0f);

            transform.localRotation = Quaternion.Slerp(transform.localRotation, targetRotation, RotationLerpSpeed * Time.deltaTime);
        }
    }
}
