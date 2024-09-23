using UnityEngine;

public class AnimationController : EnemyState
{
    private float _animInterpolX;
    private float _animInterpolY;
    private readonly float _timeMultiply = 5;
    
    public void Run()
    {
        _animInterpolX = Mathf.Lerp(_animInterpolX, -1f, Time.deltaTime * _timeMultiply);
        _animInterpolY = Mathf.Lerp(_animInterpolY, 1f, Time.deltaTime * _timeMultiply);
        animator.SetFloat("x", _animInterpolX);
        animator.SetFloat("y", _animInterpolY);
    }
}
