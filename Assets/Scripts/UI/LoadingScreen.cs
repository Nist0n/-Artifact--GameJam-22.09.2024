using System;
using System.Threading.Tasks;
using DG.Tweening;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

namespace UI
{
    public class LoadingScreen : MonoBehaviour
    {
        public static LoadingScreen Instance;
        
        [SerializeField] private Image fillImage;
        [SerializeField] private Canvas loadingCanvas;
        [SerializeField] private string nextSceneName = "MenuScene";
        [SerializeField] private float minimumLoadingTime = 2f;
        [SerializeField] private float progressUpdateSpeed = 2f;
        [SerializeField] private bool autoLoadOnStart = false;
        
        private float _currentProgress = 0f;
        private bool _isLoading = false;
        private CanvasGroup _canvasGroup;
        private bool _isInitialized = false;
        
        private void Awake()
        {
            if (!Instance)
            {
                Instance = this;
                DontDestroyOnLoad(gameObject);
            }
            else
            {
                Destroy(gameObject);
                return;
            }
        }

        private void Start()
        {
            InitializeComponents();
            
            if (fillImage)
            {
                fillImage.fillAmount = 0f;
            }
            
            if (loadingCanvas)
            {
                loadingCanvas.gameObject.SetActive(false);
            }
            
            if (autoLoadOnStart)
            {
                StartAutoLoad();
            }
        }

        private void InitializeComponents()
        {
            if (loadingCanvas && !_isInitialized)
            {
                _canvasGroup = loadingCanvas.GetComponent<CanvasGroup>();
                if (!_canvasGroup)
                {
                    _canvasGroup = loadingCanvas.gameObject.AddComponent<CanvasGroup>();
                }
                _isInitialized = true;
            }
        }

        private void StartAutoLoad()
        {
            if (string.IsNullOrEmpty(nextSceneName)) return;
            
            InitializeLoadingScreen();
            StartLoading();
        }

        private void InitializeLoadingScreen()
        {
            InitializeComponents();
            
            if (loadingCanvas)
            {
                loadingCanvas.gameObject.SetActive(true);
                if (_canvasGroup)
                {
                    _canvasGroup.alpha = 0f;
                    _canvasGroup.DOFade(1, 1);
                }
            }
            
            _currentProgress = 0f;
            if (fillImage)
            {
                fillImage.fillAmount = 0f;
            }
            _isLoading = true;
        }

        private async void StartLoading()
        {
            try
            {
                await LoadSceneAsync(nextSceneName);
            }
            catch (Exception e)
            {
                Debug.LogError($"Error loading scene: {e.Message}");
            }
        }

        private async Task LoadSceneAsync(string sceneName)
        {
            var startTime = Time.time;
            var loadOperation = SceneManager.LoadSceneAsync(sceneName);
            if (loadOperation != null)
            {
                loadOperation.allowSceneActivation = false;

                while (!loadOperation.isDone)
                {
                    var rawProgress = loadOperation.progress;
                    var progress = Mathf.Clamp01(rawProgress / 0.9f);
                    
                    await UpdateProgressBar(progress);

                    var elapsedTime = Time.time - startTime;
                    if (elapsedTime >= minimumLoadingTime && progress >= 0.9f)
                    {
                        await UpdateProgressBar(0.9f);
                        loadOperation.allowSceneActivation = true;
                        break;
                    }

                    await Task.Yield();
                }
            }
            
            await UpdateProgressBar(1f);
            
            _isLoading = false;
            
            if (_canvasGroup)
            {
                _canvasGroup.DOFade(0, 2);
            }

            await Task.Delay(2000);
            
            if (loadingCanvas)
            {
                loadingCanvas.gameObject.SetActive(false);
            }
        }

        private async Task UpdateProgressBar(float targetProgress)
        {
            if (targetProgress <= _currentProgress) return;
            
            float lastFrameTime = Time.time;
            
            while (_currentProgress < targetProgress && _isLoading)
            {
                float currentTime = Time.time;
                float deltaTime = currentTime - lastFrameTime;
                lastFrameTime = currentTime;
                
                if (deltaTime > 0.1f) deltaTime = 0.016f;
                if (deltaTime <= 0f) deltaTime = 0.016f;
                
                float step = progressUpdateSpeed * deltaTime;
                _currentProgress = Mathf.MoveTowards(_currentProgress, targetProgress, step);
                
                if (fillImage)
                {
                    fillImage.fillAmount = Mathf.Clamp01(_currentProgress);
                }
                
                if (Mathf.Approximately(_currentProgress, targetProgress) || _currentProgress >= targetProgress)
                {
                    _currentProgress = targetProgress;
                    if (fillImage)
                    {
                        fillImage.fillAmount = Mathf.Clamp01(targetProgress);
                    }
                    break;
                }

                await Task.Yield();
            }
        }

        private void OnDestroy()
        {
            _isLoading = false;
        }
        
        public async void LoadScene(string sceneName)
        {
            if (_isLoading || string.IsNullOrEmpty(sceneName)) 
            {
                Debug.LogWarning($"LoadingScreen: Cannot load scene. IsLoading: {_isLoading}, SceneName: {sceneName}");
                return;
            }
            
            nextSceneName = sceneName;
            InitializeLoadingScreen();
            await LoadSceneAsync(sceneName);
        }
    }
}
