using UnityEngine;

namespace VFX
{
    public class VFXClear : MonoBehaviour
    {
        void Start()
        {
            Destroy(gameObject, 4.7f);
        }
    }
}
