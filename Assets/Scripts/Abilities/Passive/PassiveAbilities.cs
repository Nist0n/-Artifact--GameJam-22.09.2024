using Towers;
using UnityEngine;
using UnityEngine.UIElements;

public abstract class PassiveAbilities : MonoBehaviour
{
    public Image image;
    
    protected Tower tower;

    public float Cost;

    public void SetTower(Tower tower)
    {
        this.tower = tower;
    }
}
