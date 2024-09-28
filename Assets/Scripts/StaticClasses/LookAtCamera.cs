using System;
using UnityEngine;

public class LookAtCamera : MonoBehaviour
{
    void Update()
    {
        this.transform.LookAt(Camera.main.transform);
    }
}
