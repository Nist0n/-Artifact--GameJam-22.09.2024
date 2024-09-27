using UnityEngine;

public class Levitation : MonoBehaviour
{
    public float amplitude = 0.5f;  // Амплитуда колебаний
    public float frequency = 1f;    // Частота колебаний

    private Vector3 startPos;

    void Start()
    {
        // Запоминаем начальное положение объекта
        startPos = transform.position;
    }

    void Update()
    {
        // Вычисляем новое положение с помощью синусоидальной функции
        float newY = Mathf.Sin(Time.time * frequency) * amplitude;

        // Применяем смещение к начальному положению объекта
        transform.position = new Vector3(startPos.x, startPos.y + newY, startPos.z);
    }
}
