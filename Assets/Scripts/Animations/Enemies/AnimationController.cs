using UnityEngine;

public class AnimationController : EnemyState
{
    private float _animInterpolX;
    private float _animInterpolY;
    private readonly float _timeMultiply = 5;
    private bool first = true;
    private bool second;
    private bool third;
    
    public void Run()
    {
        _animInterpolX = Mathf.Lerp(_animInterpolX, 0f, Time.deltaTime * _timeMultiply);
        _animInterpolY = Mathf.Lerp(_animInterpolY, 0f, Time.deltaTime * _timeMultiply);
        animator.SetFloat("x", _animInterpolX);
        animator.SetFloat("y", _animInterpolY);
    }

    public void TakeDamage()
    {
        _animInterpolX = Mathf.Lerp(_animInterpolX, -1f, Time.deltaTime * _timeMultiply);
        _animInterpolY = Mathf.Lerp(_animInterpolY, 0f, Time.deltaTime * _timeMultiply);
        animator.SetFloat("x", _animInterpolX);
        animator.SetFloat("y", _animInterpolY);
    }
    
    public void Death()
    {
        _animInterpolX = Mathf.Lerp(_animInterpolX, 0f, Time.deltaTime * _timeMultiply);
        _animInterpolY = Mathf.Lerp(_animInterpolY, 1f, Time.deltaTime * _timeMultiply);
        animator.SetFloat("x", _animInterpolX);
        animator.SetFloat("y", _animInterpolY);
    }
    
    public void Attacking()
    {
        _animInterpolX = Mathf.Lerp(_animInterpolX, 1f, Time.deltaTime * _timeMultiply);
        _animInterpolY = Mathf.Lerp(_animInterpolY, 0f, Time.deltaTime * _timeMultiply);
        animator.SetFloat("x", _animInterpolX);
        animator.SetFloat("y", _animInterpolY);
    }

    public void Celebrating1()
    {
        _animInterpolX = Mathf.Lerp(_animInterpolX, -0.5f, Time.deltaTime * _timeMultiply);
        _animInterpolY = Mathf.Lerp(_animInterpolY, -1f, Time.deltaTime * _timeMultiply);
        animator.SetFloat("x", _animInterpolX);
        animator.SetFloat("y", _animInterpolY);
    }
    
    public void Celebrating2()
    {
        _animInterpolX = Mathf.Lerp(_animInterpolX, 0.5f, Time.deltaTime * _timeMultiply);
        _animInterpolY = Mathf.Lerp(_animInterpolY, -1f, Time.deltaTime * _timeMultiply);
        animator.SetFloat("x", _animInterpolX);
        animator.SetFloat("y", _animInterpolY);
    }
}
