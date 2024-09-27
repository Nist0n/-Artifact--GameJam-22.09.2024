using UnityEngine;

public class Levitation : MonoBehaviour
{
    public float amplitude = 0.5f;  // ��������� ���������
    public float frequency = 1f;    // ������� ���������

    private Vector3 startPos;

    void Start()
    {
        // ���������� ��������� ��������� �������
        startPos = transform.position;
    }

    void Update()
    {
        // ��������� ����� ��������� � ������� �������������� �������
        float newY = Mathf.Sin(Time.time * frequency) * amplitude;

        // ��������� �������� � ���������� ��������� �������
        transform.position = new Vector3(startPos.x, startPos.y + newY, startPos.z);
    }
}
