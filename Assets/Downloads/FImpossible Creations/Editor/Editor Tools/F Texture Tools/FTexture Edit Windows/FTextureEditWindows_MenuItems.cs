﻿using UnityEditor;

namespace FIMSpace.FTextureTools
{
    public static class FTextureEditWindows_MenuItems
    {
        [MenuItem("Assets/FImpossible Creations/Texture Tools/Seamless Generator Window", false, -102)]
        public static void OpenSeamlessLooperWindow()
        {
            FSeamlessWindow.Init();
        }

        [MenuItem("Assets/FImpossible Creations/Texture Tools/Texture Equalize Window",false,  -101)]
        public static void OpenEqualizeTextureWindow()
        {
            FTexEqualizeWindow.Init();
        }

        [MenuItem("Assets/FImpossible Creations/Texture Tools/Color Replacer Window", false, -100)]
        public static void OpenColorReplacerWindow()
        {
            FColorReplacerWindow.Init();
        }
    }
}