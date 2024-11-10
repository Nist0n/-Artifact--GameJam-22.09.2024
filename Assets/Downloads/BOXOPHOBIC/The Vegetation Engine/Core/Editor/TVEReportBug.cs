// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using Boxophobic.StyledGUI;
using Boxophobic.Utils;
using UnityEngine.Rendering;
//using UnityEditorInternal;
//using System.IO;

namespace TheVegetationEngine
{
    public class TVEReportBug : EditorWindow
    {
        string reportProject = "";
        string reportDetails = "";

        GUIStyle styleLabel;

        Color bannerColor;
        string bannerText;
        static TVEReportBug window;
        Vector2 scrollPosition = Vector2.zero;

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine/Report Bug", false, 8004)]
        public static void ShowWindow()
        {
            window = GetWindow<TVEReportBug>(false, "Report Bug", true);
            window.minSize = new Vector2(400, 300);
        }

        void OnEnable()
        {
            reportProject = "";

            string unityPipeline = "Standard";

            if (GraphicsSettings.defaultRenderPipeline != null)
            {
                if (GraphicsSettings.defaultRenderPipeline.GetType().ToString().Contains("Universal"))
                {
                    unityPipeline = "Universal";
                }

                if (GraphicsSettings.defaultRenderPipeline.GetType().ToString().Contains("HD"))
                {
                    unityPipeline = "High Definition";
                }
            }

            var assetFolder = TVEUtils.FindAsset("The Vegetation Engine.pdf");
            assetFolder = assetFolder.Replace("/The Vegetation Engine.pdf", "");

            var userFolder = TVEUtils.GetUserFolder();

            var assetVersion = SettingsUtils.LoadSettingsData(assetFolder + "/Core/Editor/Version.asset", -99);
            var stringVersion = assetVersion.ToString();
            stringVersion = stringVersion.Insert(2, ".");
            stringVersion = stringVersion.Insert(4, ".");

            var pipelinePath = userFolder + "/Pipeline.asset";
            var pipelineCurrent = SettingsUtils.LoadSettingsData(pipelinePath, "Standard");

            reportProject += "TVE Version: " + stringVersion + "\n";
            reportProject += "TVE Pipeline: " + pipelineCurrent + "\n";

            reportProject += "\n";

            reportProject += "Unity Version: " + Application.unityVersion + "\n";
            reportProject += "Unity Pipeline: " + unityPipeline + "\n";
            reportProject += "Unity Platform: " + Application.platform + "\n";
            reportProject += "Unity Color Space: " + QualitySettings.activeColorSpace + "\n";
            reportProject += "Unity Graphics API: " + SystemInfo.graphicsDeviceType + "\n";

            reportProject += "\n";

            reportProject += "OS: " + SystemInfo.operatingSystem + "\n";
            reportProject += "Graphics: " + SystemInfo.graphicsDeviceName + "\n";

            reportProject += "\n";

            reportProject += "Additional Details";

            bannerColor = new Color(0.890f, 0.745f, 0.309f);
            bannerText = "Report Details";
        }

        void OnGUI()
        {
            SetGUIStyles();

            StyledGUI.DrawWindowBanner(bannerColor, bannerText);

            GUILayout.Space(-2);

            GUILayout.BeginHorizontal();
            GUILayout.Space(15);

            GUILayout.BeginVertical();

            scrollPosition = GUILayout.BeginScrollView(scrollPosition, false, false, GUILayout.Width(this.position.width - 28), GUILayout.Height(this.position.height - 80));

            GUILayout.Label(reportProject, styleLabel);

            reportDetails = GUILayout.TextArea(reportDetails);

            //if (GUILayout.Button("Take Editor Screensshot", GUILayout.Height(24)))
            //{
            //    var vec2Position = Vector2.zero;
            //    var sizeX = Screen.currentResolution.width;
            //    var sizeY = Screen.currentResolution.height;

            //    var colors = InternalEditorUtility.ReadScreenPixel(vec2Position, (int)sizeX, (int)sizeY);

            //    var result = new Texture2D((int)sizeX, (int)sizeY);
            //    result.SetPixels(colors);

            //    var bytes = result.EncodeToPNG();

            //    File.WriteAllBytes("Assets/Editor Screenshot.png", bytes);

            //    Object.DestroyImmediate(result);

            //    AssetDatabase.Refresh();

            //    EditorGUIUtility.PingObject(AssetDatabase.LoadAssetAtPath<UnityEngine.Object>("Assets/Editor Screenshot.png"));
            //}

            GUILayout.Space(15);

            if (GUILayout.Button("Copy Details To Clipboard", GUILayout.Height(24)))
            {
                var copyData = reportProject + reportDetails;

                GUIUtility.systemCopyBuffer = copyData;
            }

            GUILayout.FlexibleSpace();

            GUILayout.Space(20);

            GUILayout.EndScrollView();

            GUILayout.EndVertical();

            GUILayout.Space(13);
            GUILayout.EndHorizontal();
        }

        void SetGUIStyles()
        {
            styleLabel = new GUIStyle(EditorStyles.label)
            {
                richText = true,
            };
        }
    }
}


