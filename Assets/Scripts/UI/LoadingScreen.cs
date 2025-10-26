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
        [SerializeField] private float progressUpdateSpeed = 1f;
        
        private float _currentProgress = 0f;
        private bool _isLoading = false;
        private CanvasGroup _canvasGroup;
        
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
            }
        }

        private void Start()
        {
            _canvasGroup = loadingCanvas.GetComponent<CanvasGroup>();
            InitializeLoadingScreen();
            StartLoading();
        }

        private void InitializeLoadingScreen()
        {
            if (loadingCanvas)
            {
                loadingCanvas.gameObject.SetActive(true);
                _canvasGroup.DOFade(1, 1);
            }

            _currentProgress = 0f;
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
                    var progress = Mathf.Clamp01(loadOperation.progress / 0.9f);
                    await UpdateProgressBar(progress);

                    var elapsedTime = Time.time - startTime;
                    if (elapsedTime >= minimumLoadingTime && progress >= 0.9f)
                    {
                        loadOperation.allowSceneActivation = true;
                        break;
                    }

                    await Task.Yield();
                }
            }

            await UpdateProgressBar(1f);
            
            _isLoading = false;
            
            _canvasGroup.DOFade(0, 2);

            await Task.Delay(2000);
            
            loadingCanvas.gameObject.SetActive(false);
        }

        private async Task UpdateProgressBar(float targetProgress)
        {
            while (_currentProgress < targetProgress && _isLoading)
            {
                _currentProgress = Mathf.MoveTowards(_currentProgress, targetProgress, 
                    progressUpdateSpeed * Time.deltaTime);

                if (fillImage)
                {
                    fillImage.fillAmount = _currentProgress;
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
            if (_isLoading) return;
            
            nextSceneName = sceneName;
            InitializeLoadingScreen();
            await LoadSceneAsync(sceneName);
        }
    }
}
