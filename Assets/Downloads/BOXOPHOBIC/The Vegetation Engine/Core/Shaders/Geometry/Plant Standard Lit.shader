// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Geometry/Plant Standard Lit"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[StyledCategory(Render Settings, 5, 10)]_CategoryRender("[ Category Render ]", Float) = 1
		[Enum(Opaque,0,Transparent,1)]_RenderMode("Render Mode", Float) = 0
		[Enum(Off,0,On,1)]_RenderZWrite("Render ZWrite", Float) = 1
		[Enum(Both,0,Back,1,Front,2)]_RenderCull("Render Faces", Float) = 0
		[Enum(Flip,0,Mirror,1,Same,2)]_RenderNormals("Render Normals", Float) = 0
		[HideInInspector]_RenderQueue("Render Queue", Float) = 0
		[HideInInspector]_RenderPriority("Render Priority", Float) = 0
		[Enum(Off,0,On,1)]_RenderSpecular("Render Specular", Float) = 1
		[Enum(Off,0,On,1)]_RenderDecals("Render Decals", Float) = 0
		[Enum(Off,0,On,1)]_RenderSSR("Render SSR", Float) = 0
		[Space(10)]_RenderDirect("Render Lighting", Range( 0 , 1)) = 1
		_RenderAmbient("Render Ambient", Range( 0 , 1)) = 1
		_RenderShadow("Render Shadow", Range( 0 , 1)) = 1
		[Enum(Off,0,On,1)][Space(10)]_RenderClip("Alpha Clipping", Float) = 1
		[Enum(Off,0,On,1)]_RenderCoverage("Alpha To Mask", Float) = 0
		_AlphaClipValue("Alpha Treshold", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_SpaceRenderFade("# Space Render Fade", Float) = 0
		_FadeConstantValue("Fade Constant", Range( 0 , 1)) = 0
		_FadeCameraValue("Fade Proximity", Range( 0 , 1)) = 1
		_FadeGlancingValue("Fade Glancing", Range( 0 , 1)) = 0
		[StyledCategory(Global Settings)]_CategoryGlobals("[ Category Globals ]", Float) = 1
		[StyledMessage(Info, Procedural Variation in use. The Variation might not work as expected when switching from one LOD to another., 0, 10)]_MessageGlobalsVariation("# Message Globals Variation", Float) = 0
		[StyledEnum(TVEColorsLayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerColorsValue("Layer Colors", Float) = 0
		[StyledEnum(TVEExtrasLayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerExtrasValue("Layer Extras", Float) = 0
		[StyledEnum(TVEMotionLayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerMotionValue("Layer Motion", Float) = 0
		[StyledEnum(TVEVertexLayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerVertexValue("Layer Vertex", Float) = 0
		[StyledSpace(10)]_SpaceGlobalLayers("# Space Global Layers", Float) = 0
		_GlobalColors("Global Color", Range( 0 , 1)) = 1
		_GlobalAlpha("Global Alpha", Range( 0 , 1)) = 1
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalEmissive("Global Emissive", Range( 0 , 1)) = 1
		_GlobalSize("Global Size Fade", Range( 0 , 1)) = 1
		[StyledSpace(10)]_SpaceGlobalLocals("# Space Global Locals", Float) = 0
		_ColorsIntensityValue("Color Intensity", Range( 0 , 2)) = 1
		_ColorsVariationValue("Color Variation", Range( 0 , 1)) = 0.5
		_ColorsMaskValue("Color Use Mask", Range( 0 , 1)) = 1
		_AlphaVariationValue("Alpha Variation", Range( 0 , 1)) = 0.5
		_OverlayVariationValue("Overlay Variation", Range( 0 , 1)) = 0.5
		_OverlayProjectionValue("Overlay Projection", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_SpaceGlobalOptions("# Space Global Options", Float) = 0
		[StyledToggle]_ColorsPositionMode("Use Pivot Position for Colors", Float) = 0
		[StyledToggle]_ExtrasPositionMode("Use Pivot Position for Extras", Float) = 0
		[StyledCategory(Main Settings)]_CategoryMain("[Category Main ]", Float) = 1
		[StyledMessage(Info, Use the Main Mask remap sliders to control the mask for Global Color__ Main Colors__ Gradient Tinting and Subsurface Scattering when available. The mask is stored in Main Mask Blue channel. , 0, 10)]_MessageMainMask("# Message Main Mask", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_MainAlbedoTex("Main Albedo", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainNormalTex("Main Normal", 2D) = "bump" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainMaskTex("Main Mask", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		[Enum(Constant,0,Dual Color,1)]_MainColorMode("Main Color", Float) = 0
		[HDR]_MainColor("Main Color", Color) = (1,1,1,1)
		[HDR]_MainColorTwo("Main ColorB", Color) = (1,1,1,1)
		_MainAlbedoValue("Main Albedo", Range( 0 , 1)) = 1
		_MainNormalValue("Main Normal", Range( -8 , 8)) = 1
		_MainOcclusionValue("Main Occlusion", Range( 0 , 1)) = 0
		_MainSmoothnessValue("Main Smoothness", Range( 0 , 1)) = 0
		[StyledRemapSlider(_MainMaskMinValue, _MainMaskMaxValue, 0, 1, 0, 0)]_MainMaskRemap("Main Mask Remap", Vector) = (0,0,0,0)
		[HideInInspector]_MainMaskMinValue("Main Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_MainMaskMaxValue("Main Mask Max", Range( 0 , 1)) = 0
		[StyledCategory(Detail Settings)]_CategoryDetail("[ Category Detail ]", Float) = 1
		[StyledMessage(Info, Use the Detail Mask remap sliders to control the mask for Global Color__ Detail Colors__ Gradient Tinting and Subsurface Scattering when available. The mask is stored in Detail Mask Blue channel., 0, 10)]_MessageSecondMask("# Message Second Mask", Float) = 0
		[Enum(Off,0,On,1)]_DetailMode("Detail Mode", Float) = 0
		[Enum(Overlay,0,Replace,1)]_DetailBlendMode("Detail Blend", Float) = 1
		[Enum(Overlay,0,Replace,1)]_DetailAlphaMode("Detail Alpha", Float) = 1
		[Space(10)][StyledToggle]_DetailFadeMode("Use Global Alpha and Fade", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_SecondAlbedoTex("Detail Albedo", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_SecondNormalTex("Detail Normal", 2D) = "bump" {}
		[NoScaleOffset][StyledTextureSingleLine]_SecondMaskTex("Detail Mask", 2D) = "white" {}
		[Enum(Main UVs,0,Detail UVs,1,Planar UVs,2)][Space(10)]_SecondUVsMode("Detail UVs", Float) = 0
		[StyledVector(9)]_SecondUVs("Detail UVs", Vector) = (1,1,0,0)
		[StyledToggle]_SecondUVsScaleMode("Use Inverted Tilling Mode", Float) = 0
		[Enum(Constant,0,Dual Color,1)][Space(10)]_SecondColorMode("Detail Color", Float) = 0
		[HDR]_SecondColor("Detail Color", Color) = (1,1,1,1)
		[HDR]_SecondColorTwo("Detail ColorB", Color) = (1,1,1,1)
		_SecondAlbedoValue("Detail Albedo", Range( 0 , 1)) = 1
		_SecondNormalValue("Detail Normal", Range( -8 , 8)) = 1
		_SecondOcclusionValue("Detail Occlusion", Range( 0 , 1)) = 0
		_SecondSmoothnessValue("Detail Smoothness", Range( 0 , 1)) = 0
		[StyledRemapSlider(_SecondMaskMinValue, _SecondMaskMaxValue, 0, 1, 0, 0)]_SecondMaskRemap("Detail Mask Remap", Vector) = (0,0,0,0)
		[HideInInspector]_SecondMaskMinValue("Detail Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_SecondMaskMaxValue("Detail Mask Max", Range( 0 , 1)) = 0
		[Space(10)]_DetailValue("Detail Blend Intensity", Range( 0 , 1)) = 1
		_DetailNormalValue("Detail Blend Normals", Range( 0 , 1)) = 1
		[StyledRemapSlider(_DetailBlendMinValue, _DetailBlendMaxValue,0,1)]_DetailBlendRemap("Detail Blend Remap", Vector) = (0,0,0,0)
		[HideInInspector]_DetailBlendMinValue("Detail Blend Min", Range( 0 , 1)) = 0.4
		[HideInInspector]_DetailBlendMaxValue("Detail Blend Max", Range( 0 , 1)) = 0.6
		[Enum(Vertex Blue,0,Projection,1)][Space(10)]_DetailMeshMode("Detail Surface Mask", Float) = 0
		[StyledRemapSlider(_DetailMeshMinValue, _DetailMeshMaxValue,0,1)]_DetailMeshRemap("Detail Surface Remap", Vector) = (0,0,0,0)
		[HideInInspector]_DetailMeshMinValue("Detail Surface Min", Range( 0 , 1)) = 0
		[HideInInspector]_DetailMeshMaxValue("Detail Surface Max", Range( 0 , 1)) = 1
		[Enum(Main Mask,0,Detail Mask,1)]_DetailMaskMode("Detail Texture Mask", Float) = 0
		[StyledRemapSlider(_DetailMaskMinValue, _DetailMaskMaxValue,0,1)]_DetailMaskRemap("Detail Texture Remap", Vector) = (0,0,0,0)
		[HideInInspector]_DetailMaskMinValue("Detail Texture Min", Range( 0 , 1)) = 0
		[HideInInspector]_DetailMaskMaxValue("Detail Texture Max", Range( 0 , 1)) = 1
		[HideInInspector]_second_uvs_mode("_second_uvs_mode", Vector) = (0,0,0,0)
		[StyledCategory(Occlusion Settings)]_CategoryOcclusion("[ Category Occlusion ]", Float) = 1
		[StyledMessage(Info, Use the Occlusion Color for tinting and the Occlusion Alpha as Global Color and Global Overlay mask control. The mask is stored in Vertex Green channel. , 0, 10)]_MessageOcclusion("# Message Occlusion", Float) = 0
		[HDR]_VertexOcclusionColor("Occlusion Color", Color) = (1,1,1,0.5019608)
		[StyledRemapSlider(_VertexOcclusionMinValue, _VertexOcclusionMaxValue, 0, 1, 0, 0)]_VertexOcclusionRemap("Occlusion Remap", Vector) = (0,0,0,0)
		[HideInInspector]_VertexOcclusionMinValue("Occlusion Min", Range( 0 , 1)) = 0
		[HideInInspector]_VertexOcclusionMaxValue("Occlusion Max", Range( 0 , 1)) = 1
		[Space(10)][StyledToggle]_VertexOcclusionColorsMode("Use Inverted Mask for Colors", Float) = 0
		[StyledToggle]_VertexOcclusionOverlayMode("Use Inverted Mask for Overlay", Float) = 0
		[StyledCategory(Gradient Settings)]_CategoryGradient("[ Category Gradient ]", Float) = 1
		[HDR]_GradientColorOne("Gradient ColorA", Color) = (1,1,1,1)
		[HDR]_GradientColorTwo("Gradient ColorB", Color) = (1,1,1,1)
		[StyledRemapSlider(_GradientMinValue, _GradientMaxValue, 0, 1)]_GradientMaskRemap("Gradient Remap", Vector) = (0,0,0,0)
		[HideInInspector]_GradientMinValue("Gradient Min", Range( 0 , 1)) = 0
		[HideInInspector]_GradientMaxValue("Gradient Max ", Range( 0 , 1)) = 1
		[StyledCategory(Noise Settings)]_CategoryNoise("[ Category Noise ]", Float) = 1
		[StyledRemapSlider(_NoiseMinValue, _NoiseMaxValue, 0, 1)]_NoiseMaskRemap("Noise Remap", Vector) = (0,0,0,0)
		[StyledCategory(Subsurface Settings)]_CategorySubsurface("[ Category Subsurface ]", Float) = 1
		[StyledMessage(Info, In HDRP__ the Subsurface Color and Power are fake effects used for artistic control. For physically correct subsurface scattering the Power slider need to be set to 0., 0, 10)]_MessageSubsurface("# Message Subsurface", Float) = 0
		[DiffusionProfile]_SubsurfaceDiffusion("Subsurface Diffusion", Float) = 0
		[HideInInspector]_SubsurfaceDiffusion_Asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[StyledSpace(10)]_SpaceSubsurface("# SpaceSubsurface", Float) = 0
		_SubsurfaceValue("Subsurface Intensity", Range( 0 , 1)) = 1
		[HDR]_SubsurfaceColor("Subsurface Color", Color) = (1,1,1,1)
		_SubsurfaceScatteringValue("Subsurface Power", Range( 0 , 16)) = 2
		_SubsurfaceAngleValue("Subsurface Angle", Range( 1 , 16)) = 8
		_SubsurfaceDirectValue("Subsurface Direct", Range( 0 , 1)) = 1
		_SubsurfaceNormalValue("Subsurface Normal", Range( 0 , 1)) = 0
		_SubsurfaceAmbientValue("Subsurface Ambient", Range( 0 , 1)) = 0.2
		_SubsurfaceShadowValue("Subsurface Shadow", Range( 0 , 1)) = 1
		_SubsurfaceMaskValue("Subsurface Use Mask", Range( 0 , 1)) = 1
		[StyledCategory(Matcap Settings)]_CategoryMatcap("[ Category Matcap ]", Float) = 1
		[StyledCategory(Rim Light Settings)]_CategoryRimLight("[ Category Rim Light ]", Float) = 1
		[StyledRemapSlider(_RimLightMinValue, _RimLightMaxValue, 0, 1, 0, 0)]_RimLightRemap("Rim Light Remap", Vector) = (0,0,0,0)
		[StyledCategory(Emissive Settings)]_CategoryEmissive("[ Category Emissive]", Float) = 1
		[Enum(Off,0,On,1)]_EmissiveMode("Emissive Mode", Float) = 0
		[Enum(None,0,Any,1,Baked,2,Realtime,3)]_EmissiveFlagMode("Emissive GI", Float) = 0
		[NoScaleOffset][Space(10)][StyledTextureSingleLine]_EmissiveTex("Emissive Texture", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_EmissiveUVs("Emissive UVs", Vector) = (1,1,0,0)
		[HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		[Enum(Nits,0,EV100,1)]_EmissiveIntensityMode("Emissive Power", Float) = 0
		_EmissiveIntensityValue("Emissive Power", Float) = 1
		_EmissivePhaseValue("Emissive Phase", Range( 0 , 1)) = 1
		[StyledRemapSlider(_EmissiveTexMinValue, _EmissiveTexMaxValue,0,1)]_EmissiveTexRemap("Emissive Remap", Vector) = (0,0,0,0)
		[HideInInspector]_EmissiveTexMinValue("Emissive Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_EmissiveTexMaxValue("Emissive Mask Max", Range( 0 , 1)) = 1
		[HideInInspector]_emissive_intensity_value("_emissive_intensity_value", Float) = 1
		[StyledCategory(Perspective Settings)]_CategoryPerspective("[ Category Perspective ]", Float) = 1
		_PerspectivePushValue("Perspective Push", Range( 0 , 4)) = 0
		_PerspectiveNoiseValue("Perspective Noise", Range( 0 , 4)) = 0
		_PerspectiveAngleValue("Perspective Angle", Range( 0 , 8)) = 1
		[StyledCategory(Size Fade Settings)]_CategorySizeFade("[ Category Size Fade ]", Float) = 1
		_SizeFadeStartValue("Size Fade Start", Range( 0 , 1000)) = 0
		_SizeFadeEndValue("Size Fade End", Range( 0 , 1000)) = 0
		[StyledCategory(Motion Settings)]_CategoryMotion("[ Category Motion ]", Float) = 1
		[StyledMessage(Info, Procedural variation in use. Use the Scale settings if the Variation is splitting the mesh., 0, 10)]_MessageMotionVariation("# Message Motion Variation", Float) = 0
		[HDR]_MotionHighlightColor("Motion Highlight Color", Color) = (0,0,0,0)
		_MotionFacingValue("Motion Direction Mask", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_SpaceMotionGlobals("# SpaceMotionGlobals", Float) = 0
		_MotionAmplitude_10("Motion Bending", Range( 0 , 2)) = 0.2
		_MotionPosition_10("Motion Rigidity", Range( 0 , 1)) = 0.5
		[IntRange]_MotionSpeed_10("Motion Speed", Range( 0 , 40)) = 2
		_MotionScale_10("Motion Scale", Range( 0 , 20)) = 1
		_MotionVariation_10("Motion Variation", Range( 0 , 20)) = 0
		[Space(10)]_MotionAmplitude_20("Motion Squash", Range( 0 , 2)) = 0.2
		_MotionAmplitude_22("Motion Rolling", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_20("Motion Speed", Range( 0 , 40)) = 6
		_MotionScale_20("Motion Scale", Range( 0 , 20)) = 3
		_MotionVariation_20("Motion Variation", Range( 0 , 20)) = 0
		[Space(10)]_MotionAmplitude_32("Motion Flutter", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_32("Motion Speed", Range( 0 , 40)) = 20
		_MotionScale_32("Motion Scale", Range( 0 , 20)) = 10
		_MotionVariation_32("Motion Variation", Range( 0 , 20)) = 0
		[Space(10)]_InteractionAmplitude("Interaction Amplitude", Range( 0 , 2)) = 1
		_InteractionMaskValue("Interaction Use Mask", Range( 0 , 1)) = 0
		[HideInInspector][StyledToggle]_VertexPivotMode("Enable Pre Baked Pivots", Float) = 0
		[HideInInspector][StyledToggle]_VertexDynamicMode("Enable Dynamic Support", Float) = 0
		[HideInInspector]_render_normals("_render_normals", Vector) = (1,1,1,0)
		[HideInInspector]_Cutoff("Legacy Cutoff", Float) = 0.5
		[HideInInspector]_Color("Legacy Color", Color) = (0,0,0,0)
		[HideInInspector]_MainTex("Legacy MainTex", 2D) = "white" {}
		[HideInInspector]_BumpMap("Legacy BumpMap", 2D) = "white" {}
		[HideInInspector]_MaxBoundsInfo("_MaxBoundsInfo", Vector) = (1,1,1,1)
		[HideInInspector]_MotionValue_30("_MotionValue_30", Float) = 1
		[HideInInspector]_MotionValue_20("_MotionValue_20", Float) = 1
		[HideInInspector]_ColorsMaskMinValue("_ColorsMaskMinValue", Range( 0 , 1)) = 1
		[HideInInspector]_ColorsMaskMaxValue("_ColorsMaskMaxValue", Range( 0 , 1)) = 0
		[HideInInspector]_DetailTypeMode("_DetailTypeMode", Float) = 2
		[HideInInspector]_DetailCoordMode("_DetailCoordMode", Float) = 0
		[HideInInspector]_DetailOpaqueMode("_DetailOpaqueMode", Float) = 0
		[HideInInspector]_DetailMeshInvertMode("_DetailMeshInvertMode", Float) = 0
		[HideInInspector]_DetailMaskInvertMode("_DetailMaskInvertMode", Float) = 0
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_IsIdentifier("_IsIdentifier", Float) = 0
		[HideInInspector]_IsCollected("_IsCollected", Float) = 0
		[HideInInspector]_IsCustomShader("_IsCustomShader", Float) = 0
		[HideInInspector]_IsShared("_IsShared", Float) = 0
		[HideInInspector]_HasEmissive("_HasEmissive", Float) = 0
		[HideInInspector]_HasGradient("_HasGradient", Float) = 0
		[HideInInspector]_HasOcclusion("_HasOcclusion", Float) = 0
		[HideInInspector]_VertexVariationMode("_VertexVariationMode", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 1230
		[HideInInspector]_IsCoreShader("_IsCoreShader", Float) = 1
		[HideInInspector]_render_cull("_render_cull", Float) = 0
		[HideInInspector]_render_src("_render_src", Float) = 1
		[HideInInspector]_render_dst("_render_dst", Float) = 0
		[HideInInspector]_render_zw("_render_zw", Float) = 1
		[HideInInspector]_render_coverage("_render_coverage", Float) = 0
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_IsPlantShader("_IsPlantShader", Float) = 1


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		//[HideInInspector][ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull [_render_cull]
		ZWrite [_render_zw]
		ZTest LEqual
		Offset 0,0
		AlphaToMask [_render_coverage]

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }

			Blend [_render_src] [_render_dst], One Zero
			ZWrite On
			ZTest LEqual
			Offset 0,0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
            #pragma multi_compile _ EVALUATE_SH_MIXED EVALUATE_SH_VERTEX
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _FORWARD_PLUS

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ USE_LEGACY_LIGHTMAPS
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_FORWARD

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ProbeVolumeVariants.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#if !defined( OUTPUT_SH4 )
				#define OUTPUT_SH4 OUTPUT_SH
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_DETAIL
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_color : COLOR;
				float4 ase_texcoord10 : TEXCOORD10;
				float4 ase_texcoord11 : TEXCOORD11;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SecondColor;
			half4 _MotionHighlightColor;
			half4 _SubsurfaceColor;
			half4 _NoiseMaskRemap;
			half4 _MainColorTwo;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColorTwo;
			half4 _MainUVs;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _DetailMeshRemap;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half4 _DetailMaskRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _RimLightRemap;
			half4 _MainColor;
			half3 _render_normals;
			half _SecondColorMode;
			half _DetailBlendMode;
			half _DetailMaskMode;
			half _DetailMaskMinValue;
			half _DetailMaskMaxValue;
			half _MainNormalValue;
			half _DetailMeshMode;
			half _DetailMeshMinValue;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _MainMaskMaxValue;
			half _SecondAlbedoValue;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			half _GlobalSize;
			half _SizeFadeEndValue;
			half _SizeFadeStartValue;
			half _MainAlbedoValue;
			half _MainMaskMinValue;
			half _DetailMeshMaxValue;
			half _MainColorMode;
			half _SecondUVsScaleMode;
			half _SecondMaskMinValue;
			half _DetailBlendMinValue;
			half _GradientMaxValue;
			half _DetailMode;
			half _SubsurfaceValue;
			half _SubsurfaceMaskValue;
			half _EmissiveTexMinValue;
			half _EmissiveTexMaxValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _FadeGlancingValue;
			half _SecondSmoothnessValue;
			half _DetailBlendMaxValue;
			half _VertexOcclusionOverlayMode;
			half _SecondNormalValue;
			half _DetailValue;
			half _GradientMinValue;
			half _MotionAmplitude_20;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _ColorsIntensityValue;
			half _OverlayProjectionValue;
			half _ColorsMaskValue;
			half _ColorsVariationValue;
			half _VertexOcclusionColorsMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _OverlayVariationValue;
			half _DetailNormalValue;
			half _SecondUVsMode;
			half _GlobalColors;
			half _MotionFacingValue;
			half _LayerMotionValue;
			half _MotionVariation_20;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _RenderDirect;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _Cutoff;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _IsVersion;
			half _HasEmissive;
			half _render_src;
			half _render_zw;
			half _render_dst;
			half _render_coverage;
			half _IsStandardShader;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageGlobalsVariation;
			half _IsTVEShader;
			half _HasOcclusion;
			half _IsIdentifier;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _VertexVariationMode;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MessageMotionVariation;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _MessageOcclusion;
			half _EmissiveMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_20;
			half _DetailMaskInvertMode;
			half _CategoryMotion;
			half _ColorsMaskMaxValue;
			half _RenderCoverage;
			half _MessageSubsurface;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderZWrite;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderClip;
			half _ColorsMaskMinValue;
			half _FadeConstantValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			float TVE_ColorsUsage[10];
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			half4 TVE_ColorsParams;
			half4 TVE_OverlayColor;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_SecondNormalTex);
			half TVE_WetnessContrast;
			half TVE_SubsurfaceValue;
			half TVE_OverlaySubsurface;
			half3 TVE_MainLightDirection;
			half TVE_OverlayNormalValue;
			half TVE_WetnessNormalValue;
			TEXTURE2D(_EmissiveTex);
			half TVE_OverlaySmoothness;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g76351 = v.positionOS.xyz;
				float3 appendResult60_g76361 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76351 = ( appendResult60_g76361 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76351 = Mesh_PivotsData2831_g76351;
				float3 temp_output_2283_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				half3 VertexPos40_g76486 = temp_output_2283_0_g76351;
				half3 VertexPos40_g76487 = VertexPos40_g76486;
				float3 appendResult74_g76487 = (float3(VertexPos40_g76487.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76487 = appendResult74_g76487;
				float3 break84_g76487 = VertexPos40_g76487;
				float3 appendResult81_g76487 = (float3(0.0 , break84_g76487.y , break84_g76487.z));
				half3 VertexPosOtherAxis82_g76487 = appendResult81_g76487;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g76351 = ase_worldPos;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 WorldPosition_Shifted7477_g76351 = ( WorldPosition3905_g76351 - TVE_WorldOrigin );
				float4x4 break19_g76407 = GetObjectToWorldMatrix();
				float3 appendResult20_g76407 = (float3(break19_g76407[ 0 ][ 3 ] , break19_g76407[ 1 ][ 3 ] , break19_g76407[ 2 ][ 3 ]));
				float3 temp_output_122_0_g76407 = Mesh_PivotsData2831_g76351;
				float3 PivotsOnly105_g76407 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76407 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g76409 = ( appendResult20_g76407 + PivotsOnly105_g76407 );
				half3 WorldData19_g76409 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76409 = WorldData19_g76409;
				#else
				float3 staticSwitch14_g76409 = ObjectData20_g76409;
				#endif
				float3 temp_output_114_0_g76407 = staticSwitch14_g76409;
				float3 vertexToFrag4224_g76351 = temp_output_114_0_g76407;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				float3 lerpResult6766_g76351 = lerp( WorldPosition_Shifted7477_g76351 , ObjectPosition_Shifted7481_g76351 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76351 = lerpResult6766_g76351;
				half3 Input_Position419_g76527 = Motion_10_Position6738_g76351;
				float Input_MotionScale287_g76527 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76527 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76527 = (( Input_Position419_g76527 * Input_MotionScale287_g76527 * NoiseTex_Tilling735_g76527 * 0.0075 )).xz;
				float2 temp_output_447_0_g76356 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76351 = temp_output_447_0_g76356;
				half2 Input_DirectionWS423_g76527 = Global_Wind_DirectionWS4683_g76351;
				float lerpResult128_g76528 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76527 = _MotionSpeed_10;
				half Input_MotionVariation284_g76527 = _MotionVariation_10;
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = v.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				half Input_GlobalMeshVariation569_g76527 = Global_MeshVariation5104_g76351;
				float temp_output_630_0_g76527 = ( ( ( lerpResult128_g76528 * Input_MotionSpeed62_g76527 ) + ( Input_MotionVariation284_g76527 * Input_GlobalMeshVariation569_g76527 ) ) * 0.03 );
				float temp_output_607_0_g76527 = frac( temp_output_630_0_g76527 );
				float4 lerpResult590_g76527 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * temp_output_607_0_g76527 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * frac( ( temp_output_630_0_g76527 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76527 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76527 = lerpResult590_g76527;
				float2 temp_output_645_0_g76527 = ((Noise_Complex703_g76527).rg*2.0 + -1.0);
				float2 break650_g76527 = temp_output_645_0_g76527;
				float3 appendResult649_g76527 = (float3(break650_g76527.x , 0.0 , break650_g76527.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76527 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76510 = Global_Noise_OS5548_g76351;
				float2 break448_g76356 = temp_output_447_0_g76356;
				float3 appendResult452_g76356 = (float3(break448_g76356.x , 0.0 , break448_g76356.y));
				half2 Global_Wind_DirectionOS5692_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76510 = Global_Wind_DirectionOS5692_g76351;
				float temp_output_84_0_g76362 = _LayerMotionValue;
				float temp_output_19_0_g76366 = TVE_MotionUsage[(int)temp_output_84_0_g76362];
				float4 temp_output_91_19_g76362 = TVE_MotionCoords;
				half2 UV94_g76362 = ( (temp_output_91_19_g76362).zw + ( (temp_output_91_19_g76362).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76362 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76362,temp_output_84_0_g76362, 0.0 );
				float4 temp_output_17_0_g76366 = tex2DArrayNode50_g76362;
				float4 temp_output_112_19_g76362 = TVE_MotionParams;
				float4 temp_output_3_0_g76366 = temp_output_112_19_g76362;
				float4 ifLocalVar18_g76366 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76366 >= 0.5 )
				ifLocalVar18_g76366 = temp_output_17_0_g76366;
				else
				ifLocalVar18_g76366 = temp_output_3_0_g76366;
				float4 lerpResult22_g76366 = lerp( temp_output_3_0_g76366 , temp_output_17_0_g76366 , temp_output_19_0_g76366);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76366 = lerpResult22_g76366;
				#else
				float4 staticSwitch24_g76366 = ifLocalVar18_g76366;
				#endif
				half4 Global_Motion_Params3909_g76351 = staticSwitch24_g76366;
				float4 break322_g76356 = Global_Motion_Params3909_g76351;
				float lerpResult457_g76356 = lerp( break322_g76356.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76356 = ( 1.0 - lerpResult457_g76356 );
				half Global_Wind_Power2223_g76351 = ( 1.0 - ( temp_output_459_0_g76356 * temp_output_459_0_g76356 ) );
				half Input_WindPower449_g76510 = Global_Wind_Power2223_g76351;
				float2 lerpResult516_g76510 = lerp( Input_Noise_DirectionOS487_g76510 , Input_Wind_DirectionOS458_g76510 , ( Input_WindPower449_g76510 * 0.6 ));
				half Mesh_Motion_107572_g76351 = v.ase_color.a;
				half Input_MeshHeight388_g76510 = Mesh_Motion_107572_g76351;
				half ObjectData20_g76511 = Input_MeshHeight388_g76510;
				float enc62_g76576 = v.texcoord.w;
				float2 localDecodeFloatToVector262_g76576 = DecodeFloatToVector2( enc62_g76576 );
				float2 break63_g76576 = ( localDecodeFloatToVector262_g76576 * 100.0 );
				float Bounds_Height5230_g76351 = break63_g76576.x;
				half Input_BoundsHeight390_g76510 = Bounds_Height5230_g76351;
				half WorldData19_g76511 = ( Input_MeshHeight388_g76510 * Input_MeshHeight388_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76511 = WorldData19_g76511;
				#else
				float staticSwitch14_g76511 = ObjectData20_g76511;
				#endif
				half Final_Motion10_Mask321_g76510 = ( staticSwitch14_g76511 * 2.0 );
				half Input_BendingAmplitude376_g76510 = _MotionAmplitude_10;
				half Global_MotionValue640_g76510 = TVE_MotionValue_10;
				half2 Final_Bending631_g76510 = ( lerpResult516_g76510 * ( Final_Motion10_Mask321_g76510 * Input_BendingAmplitude376_g76510 * Input_WindPower449_g76510 * Input_WindPower449_g76510 * Global_MotionValue640_g76510 ) );
				float2 appendResult433_g76356 = (float2(break322_g76356.x , break322_g76356.y));
				float2 temp_output_436_0_g76356 = (appendResult433_g76356*2.0 + -1.0);
				float2 break441_g76356 = temp_output_436_0_g76356;
				float3 appendResult440_g76356 = (float3(break441_g76356.x , 0.0 , break441_g76356.y));
				half2 Global_React_DirectionOS39_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76510 = Global_React_DirectionOS39_g76351;
				float clampResult17_g76513 = clamp( Input_MeshHeight388_g76510 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76512 = 0.0;
				half Input_InteractionUseMask62_g76510 = _InteractionMaskValue;
				float temp_output_10_0_g76512 = ( Input_InteractionUseMask62_g76510 - temp_output_7_0_g76512 );
				half Final_InteractionRemap594_g76510 = saturate( ( ( clampResult17_g76513 - temp_output_7_0_g76512 ) / ( temp_output_10_0_g76512 + 0.0001 ) ) );
				half ObjectData20_g76514 = Final_InteractionRemap594_g76510;
				half WorldData19_g76514 = ( Final_InteractionRemap594_g76510 * Final_InteractionRemap594_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76514 = WorldData19_g76514;
				#else
				float staticSwitch14_g76514 = ObjectData20_g76514;
				#endif
				half Final_InteractionMask373_g76510 = ( staticSwitch14_g76514 * 2.0 );
				half Input_InteractionAmplitude58_g76510 = _InteractionAmplitude;
				half2 Final_Interaction632_g76510 = ( Input_React_DirectionOS358_g76510 * Final_InteractionMask373_g76510 * Input_InteractionAmplitude58_g76510 );
				half Global_Interaction_Mask66_g76351 = ( break322_g76356.w * break322_g76356.w * break322_g76356.w * break322_g76356.w );
				float Input_InteractionGlobalMask330_g76510 = Global_Interaction_Mask66_g76351;
				half Final_InteractionValue525_g76510 = saturate( ( Input_InteractionAmplitude58_g76510 * Input_InteractionGlobalMask330_g76510 ) );
				float2 lerpResult551_g76510 = lerp( Final_Bending631_g76510 , Final_Interaction632_g76510 , Final_InteractionValue525_g76510);
				float2 break364_g76510 = lerpResult551_g76510;
				float3 appendResult638_g76510 = (float3(break364_g76510.x , 0.0 , break364_g76510.y));
				half3 Motion_10_Interaction7519_g76351 = appendResult638_g76510;
				half3 Angle44_g76486 = Motion_10_Interaction7519_g76351;
				half Angle44_g76487 = (Angle44_g76486).z;
				half3 VertexPos40_g76488 = ( VertexPosRotationAxis50_g76487 + ( VertexPosOtherAxis82_g76487 * cos( Angle44_g76487 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76487 ) * sin( Angle44_g76487 ) ) );
				float3 appendResult74_g76488 = (float3(0.0 , 0.0 , VertexPos40_g76488.z));
				half3 VertexPosRotationAxis50_g76488 = appendResult74_g76488;
				float3 break84_g76488 = VertexPos40_g76488;
				float3 appendResult81_g76488 = (float3(break84_g76488.x , break84_g76488.y , 0.0));
				half3 VertexPosOtherAxis82_g76488 = appendResult81_g76488;
				half Angle44_g76488 = -(Angle44_g76486).x;
				half3 Input_Position419_g76566 = WorldPosition_Shifted7477_g76351;
				float3 break459_g76566 = Input_Position419_g76566;
				float Sum_Position446_g76566 = ( break459_g76566.x + break459_g76566.y + break459_g76566.z );
				half Input_MotionScale321_g76566 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76566 = _MotionVariation_20;
				half Input_GlobalVariation400_g76566 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76567 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76566 = _MotionSpeed_20;
				float temp_output_404_0_g76566 = ( lerpResult128_g76567 * Input_MotionSpeed62_g76566 );
				half Motion_SineA450_g76566 = sin( ( ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) + ( Input_MotionVariation330_g76566 * Input_GlobalVariation400_g76566 ) + temp_output_404_0_g76566 ) );
				half Motion_SineB395_g76566 = sin( ( ( temp_output_404_0_g76566 * 0.6842 ) + ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) ) );
				half3 Input_Position419_g76585 = VertexPosition3588_g76351;
				float3 normalizeResult518_g76585 = normalize( Input_Position419_g76585 );
				half2 Input_DirectionOS423_g76585 = Global_React_DirectionOS39_g76351;
				float2 break521_g76585 = -Input_DirectionOS423_g76585;
				float3 appendResult522_g76585 = (float3(break521_g76585.x , 0.0 , break521_g76585.y));
				float dotResult519_g76585 = dot( normalizeResult518_g76585 , appendResult522_g76585 );
				half Input_Value62_g76585 = _MotionFacingValue;
				float lerpResult524_g76585 = lerp( 1.0 , (dotResult519_g76585*0.5 + 0.5) , Input_Value62_g76585);
				half ObjectData20_g76586 = max( lerpResult524_g76585 , 0.001 );
				half WorldData19_g76586 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76586 = WorldData19_g76586;
				#else
				float staticSwitch14_g76586 = ObjectData20_g76586;
				#endif
				half Motion_FacingMask5214_g76351 = staticSwitch14_g76586;
				half Motion_20_Amplitude4381_g76351 = Motion_FacingMask5214_g76351;
				half Input_MotionAmplitude384_g76566 = Motion_20_Amplitude4381_g76351;
				half Input_GlobalWind407_g76566 = Global_Wind_Power2223_g76351;
				float4 break638_g76527 = abs( Noise_Complex703_g76527 );
				half Global_Noise_B5526_g76351 = break638_g76527.b;
				half Input_GlobalNoise411_g76566 = Global_Noise_B5526_g76351;
				float lerpResult413_g76566 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76566);
				half Motion_Amplitude418_g76566 = ( Input_MotionAmplitude384_g76566 * Input_GlobalWind407_g76566 * pow( Input_GlobalNoise411_g76566 , lerpResult413_g76566 ) );
				half Input_Squash58_g76566 = _MotionAmplitude_20;
				float enc59_g76576 = v.texcoord.z;
				float2 localDecodeFloatToVector259_g76576 = DecodeFloatToVector2( enc59_g76576 );
				float2 break61_g76576 = localDecodeFloatToVector259_g76576;
				half Mesh_Motion_2060_g76351 = break61_g76576.x;
				half Input_MeshMotion_20388_g76566 = Mesh_Motion_2060_g76351;
				float Bounds_Radius5231_g76351 = break63_g76576.y;
				half Input_BoundsRadius390_g76566 = Bounds_Radius5231_g76351;
				half Global_MotionValue462_g76566 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76566 = Global_React_DirectionOS39_g76351;
				float2 break371_g76566 = Input_DirectionOS366_g76566;
				float3 appendResult372_g76566 = (float3(break371_g76566.x , ( Motion_SineA450_g76566 * 0.3 ) , break371_g76566.y));
				half3 Motion_20_Squash4418_g76351 = ( ( (max( Motion_SineA450_g76566 , Motion_SineB395_g76566 )*0.5 + 0.5) * Motion_Amplitude418_g76566 * Input_Squash58_g76566 * Input_MeshMotion_20388_g76566 * Input_BoundsRadius390_g76566 * Global_MotionValue462_g76566 ) * appendResult372_g76566 );
				half3 VertexPos40_g76472 = ( ( VertexPosRotationAxis50_g76488 + ( VertexPosOtherAxis82_g76488 * cos( Angle44_g76488 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76488 ) * sin( Angle44_g76488 ) ) ) + Motion_20_Squash4418_g76351 );
				float3 appendResult74_g76472 = (float3(0.0 , VertexPos40_g76472.y , 0.0));
				float3 VertexPosRotationAxis50_g76472 = appendResult74_g76472;
				float3 break84_g76472 = VertexPos40_g76472;
				float3 appendResult81_g76472 = (float3(break84_g76472.x , 0.0 , break84_g76472.z));
				float3 VertexPosOtherAxis82_g76472 = appendResult81_g76472;
				half Input_Rolling379_g76566 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76351 = ( Motion_SineA450_g76566 * Motion_Amplitude418_g76566 * Input_Rolling379_g76566 * Input_MeshMotion_20388_g76566 * Global_MotionValue462_g76566 );
				half Angle44_g76472 = Motion_20_Rolling5257_g76351;
				half3 Input_Position500_g76523 = WorldPosition_Shifted7477_g76351;
				half Input_MotionScale321_g76523 = _MotionScale_32;
				half Input_MotionVariation330_g76523 = _MotionVariation_32;
				half Input_GlobalVariation372_g76523 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76524 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76523 = _MotionSpeed_32;
				float4 tex2DNode460_g76523 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76523).xz * Input_MotionScale321_g76523 * 0.03 ) + ( Input_MotionVariation330_g76523 * Input_GlobalVariation372_g76523 ) + ( lerpResult128_g76524 * Input_MotionSpeed62_g76523 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76523 = (float3(tex2DNode460_g76523.r , tex2DNode460_g76523.g , tex2DNode460_g76523.b));
				half3 Flutter_Texture489_g76523 = (appendResult462_g76523*2.0 + -1.0);
				float temp_output_7_0_g76401 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76401 = ( TVE_MotionFadeStart - temp_output_7_0_g76401 );
				half Motion_FadeOut4005_g76351 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76401 ) / ( temp_output_10_0_g76401 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76351 = ( _MotionAmplitude_32 * Motion_FacingMask5214_g76351 * Motion_FadeOut4005_g76351 );
				half Input_MotionAmplitude58_g76523 = Motion_30_Amplitude4960_g76351;
				half Mesh_Motion_30144_g76351 = break61_g76576.y;
				half Input_MeshMotion_30374_g76523 = Mesh_Motion_30144_g76351;
				half Input_GlobalWind471_g76523 = Global_Wind_Power2223_g76351;
				half Global_MotionValue503_g76523 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g76523 = Global_Noise_B5526_g76351;
				float lerpResult466_g76523 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76523);
				half Flutter_Amplitude491_g76523 = ( Input_MotionAmplitude58_g76523 * Input_MeshMotion_30374_g76523 * Input_GlobalWind471_g76523 * Global_MotionValue503_g76523 * pow( Input_GlobalNoise472_g76523 , lerpResult466_g76523 ) );
				half3 Motion_30_Flutter263_g76351 = ( Flutter_Texture489_g76523 * Flutter_Amplitude491_g76523 );
				float3 Vertex_Motion_Object833_g76351 = ( ( VertexPosRotationAxis50_g76472 + ( VertexPosOtherAxis82_g76472 * cos( Angle44_g76472 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76472 ) * sin( Angle44_g76472 ) ) ) + Motion_30_Flutter263_g76351 );
				half3 ObjectData20_g76419 = Vertex_Motion_Object833_g76351;
				float3 temp_output_3474_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				float3 Vertex_Motion_World1118_g76351 = ( ( ( temp_output_3474_0_g76351 + Motion_10_Interaction7519_g76351 ) + Motion_20_Squash4418_g76351 ) + Motion_30_Flutter263_g76351 );
				half3 WorldData19_g76419 = Vertex_Motion_World1118_g76351;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76419 = WorldData19_g76419;
				#else
				float3 staticSwitch14_g76419 = ObjectData20_g76419;
				#endif
				float3 temp_output_7495_0_g76351 = staticSwitch14_g76419;
				float3 Vertex_Motion7493_g76351 = temp_output_7495_0_g76351;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 break2709_g76351 = cross( ViewDirection3963_g76351 , half3(0,1,0) );
				float3 appendResult2710_g76351 = (float3(-break2709_g76351.z , 0.0 , break2709_g76351.x));
				float3 appendResult2667_g76351 = (float3(Global_MeshVariation5104_g76351 , 0.5 , Global_MeshVariation5104_g76351));
				half Mesh_Height1524_g76351 = v.ase_color.a;
				float dotResult2212_g76351 = dot( ViewDirection3963_g76351 , float3(0,1,0) );
				half Mask_HView2656_g76351 = dotResult2212_g76351;
				float saferPower2652_g76351 = abs( Mask_HView2656_g76351 );
				half3 Grass_Perspective2661_g76351 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76351 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76351*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76351 * pow( saferPower2652_g76351 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76383 = _LayerVertexValue;
				float temp_output_19_0_g76387 = TVE_VertexUsage[(int)temp_output_84_0_g76383];
				float4 temp_output_94_19_g76383 = TVE_VertexCoords;
				half2 UV97_g76383 = ( (temp_output_94_19_g76383).zw + ( (temp_output_94_19_g76383).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76383 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76383,temp_output_84_0_g76383, 0.0 );
				float4 temp_output_17_0_g76387 = tex2DArrayNode50_g76383;
				float4 temp_output_111_19_g76383 = TVE_VertexParams;
				float4 temp_output_3_0_g76387 = temp_output_111_19_g76383;
				float4 ifLocalVar18_g76387 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76387 >= 0.5 )
				ifLocalVar18_g76387 = temp_output_17_0_g76387;
				else
				ifLocalVar18_g76387 = temp_output_3_0_g76387;
				float4 lerpResult22_g76387 = lerp( temp_output_3_0_g76387 , temp_output_17_0_g76387 , temp_output_19_0_g76387);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76387 = lerpResult22_g76387;
				#else
				float4 staticSwitch24_g76387 = ifLocalVar18_g76387;
				#endif
				half4 Global_Vertex_Params4173_g76351 = staticSwitch24_g76387;
				float4 break322_g76388 = Global_Vertex_Params4173_g76351;
				half Global_VertexSize174_g76351 = saturate( break322_g76388.w );
				float lerpResult346_g76351 = lerp( 1.0 , Global_VertexSize174_g76351 , _GlobalSize);
				float3 appendResult3480_g76351 = (float3(lerpResult346_g76351 , lerpResult346_g76351 , lerpResult346_g76351));
				half3 ObjectData20_g76416 = appendResult3480_g76351;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76416 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76416 = WorldData19_g76416;
				#else
				float3 staticSwitch14_g76416 = ObjectData20_g76416;
				#endif
				half3 Vertex_Size1741_g76351 = staticSwitch14_g76416;
				float temp_output_7_0_g76417 = _SizeFadeEndValue;
				float temp_output_10_0_g76417 = ( _SizeFadeStartValue - temp_output_7_0_g76417 );
				float temp_output_7453_0_g76351 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76351 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76417 ) / ( temp_output_10_0_g76417 + 0.0001 ) ) );
				float3 appendResult3482_g76351 = (float3(temp_output_7453_0_g76351 , temp_output_7453_0_g76351 , temp_output_7453_0_g76351));
				half3 ObjectData20_g76415 = appendResult3482_g76351;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76415 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76415 = WorldData19_g76415;
				#else
				float3 staticSwitch14_g76415 = ObjectData20_g76415;
				#endif
				float3 Vertex_SizeFade1740_g76351 = staticSwitch14_g76415;
				float3 lerpResult16_g76420 = lerp( VertexPosition3588_g76351 , ( ( ( Vertex_Motion7493_g76351 + Grass_Perspective2661_g76351 ) * Vertex_Size1741_g76351 * Vertex_SizeFade1740_g76351 ) + Mesh_PivotsOS2291_g76351 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76351 = lerpResult16_g76420;
				float3 Final_VertexPosition890_g76351 = ( temp_output_4912_0_g76351 + _DisableSRPBatcher );
				
				float4 break33_g76581 = _second_uvs_mode;
				float2 temp_output_30_0_g76581 = ( v.texcoord.xy * break33_g76581.x );
				float2 appendResult21_g76576 = (float2(v.texcoord1.z , v.texcoord1.w));
				float2 Mesh_DetailCoord3_g76351 = appendResult21_g76576;
				float2 temp_output_29_0_g76581 = ( Mesh_DetailCoord3_g76351 * break33_g76581.y );
				float2 temp_output_31_0_g76581 = ( (WorldPosition_Shifted7477_g76351).xz * break33_g76581.z );
				half2 Second_UVs_Tilling7609_g76351 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7610_g76351 = ( 1.0 / Second_UVs_Tilling7609_g76351 );
				float2 lerpResult7614_g76351 = lerp( Second_UVs_Tilling7609_g76351 , Second_UVs_Scale7610_g76351 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7605_g76351 = (_SecondUVs).zw;
				float2 vertexToFrag11_g76377 = ( ( ( temp_output_30_0_g76581 + temp_output_29_0_g76581 + temp_output_31_0_g76581 ) * lerpResult7614_g76351 ) + Second_UVs_Offset7605_g76351 );
				o.ase_texcoord9.xy = vertexToFrag11_g76377;
				o.ase_texcoord10.xyz = vertexToFrag3890_g76351;
				o.ase_texcoord11.xyz = vertexToFrag4224_g76351;
				half Global_Noise_A4860_g76351 = break638_g76527.a;
				half Tint_Highlight_Value3231_g76351 = ( Global_Noise_A4860_g76351 * Global_Wind_Power2223_g76351 * Motion_FadeOut4005_g76351 * Mesh_Height1524_g76351 );
				float vertexToFrag11_g76392 = Tint_Highlight_Value3231_g76351;
				o.ase_texcoord9.z = vertexToFrag11_g76392;
				
				o.ase_texcoord8 = v.texcoord;
				o.ase_color = v.ase_color;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.w = 0;
				o.ase_texcoord10.w = 0;
				o.ase_texcoord11.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76351;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif
				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x );
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y );
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z );

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				OUTPUT_SH4( vertexInput.positionWS, normalInput.normalWS.xyz, GetWorldSpaceNormalizeViewDir( vertexInput.positionWS ), o.lightmapUVOrVertexSH.xyz );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.texcoord = v.texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						, bool ase_vface : SV_IsFrontFace ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				half2 Main_UVs15_g76351 = ( ( IN.ase_texcoord8.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76351 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76351 );
				float3 lerpResult6223_g76351 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76351).rgb , _MainAlbedoValue);
				float4 tex2DNode35_g76351 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				half Main_Mask57_g76351 = tex2DNode35_g76351.b;
				float clampResult17_g76560 = clamp( Main_Mask57_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76561 = _MainMaskMinValue;
				float temp_output_10_0_g76561 = ( _MainMaskMaxValue - temp_output_7_0_g76561 );
				half Main_Mask_Remap5765_g76351 = saturate( ( ( clampResult17_g76560 - temp_output_7_0_g76561 ) / ( temp_output_10_0_g76561 + 0.0001 ) ) );
				float lerpResult7671_g76351 = lerp( 1.0 , Main_Mask_Remap5765_g76351 , _MainColorMode);
				float4 lerpResult7654_g76351 = lerp( _MainColorTwo , _MainColor , lerpResult7671_g76351);
				half3 Main_Color_RGB7657_g76351 = (lerpResult7654_g76351).rgb;
				half3 Main_Albedo99_g76351 = ( lerpResult6223_g76351 * Main_Color_RGB7657_g76351 );
				float2 vertexToFrag11_g76377 = IN.ase_texcoord9.xy;
				half2 Second_UVs17_g76351 = vertexToFrag11_g76377;
				float4 tex2DNode89_g76351 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76351 );
				float3 lerpResult6225_g76351 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76351).rgb , _SecondAlbedoValue);
				float4 tex2DNode33_g76351 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				half Second_Mask81_g76351 = tex2DNode33_g76351.b;
				float clampResult17_g76563 = clamp( Second_Mask81_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76564 = _SecondMaskMinValue;
				float temp_output_10_0_g76564 = ( _SecondMaskMaxValue - temp_output_7_0_g76564 );
				half Second_Mask_Remap6130_g76351 = saturate( ( ( clampResult17_g76563 - temp_output_7_0_g76564 ) / ( temp_output_10_0_g76564 + 0.0001 ) ) );
				float lerpResult7672_g76351 = lerp( 1.0 , Second_Mask_Remap6130_g76351 , _SecondColorMode);
				float4 lerpResult7662_g76351 = lerp( _SecondColorTwo , _SecondColor , lerpResult7672_g76351);
				half3 Second_Color_RGB7663_g76351 = (lerpResult7662_g76351).rgb;
				half3 Second_Albedo153_g76351 = ( lerpResult6225_g76351 * Second_Color_RGB7663_g76351 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g76393 = 2.0;
				#else
				float staticSwitch1_g76393 = 4.594794;
				#endif
				float3 lerpResult4834_g76351 = lerp( ( Main_Albedo99_g76351 * Second_Albedo153_g76351 * staticSwitch1_g76393 ) , Second_Albedo153_g76351 , _DetailBlendMode);
				float lerpResult6885_g76351 = lerp( Main_Mask57_g76351 , Second_Mask81_g76351 , _DetailMaskMode);
				float clampResult17_g76483 = clamp( lerpResult6885_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76482 = _DetailMaskMinValue;
				float temp_output_10_0_g76482 = ( _DetailMaskMaxValue - temp_output_7_0_g76482 );
				half Blend_Mask_Texture6794_g76351 = saturate( ( ( clampResult17_g76483 - temp_output_7_0_g76482 ) / ( temp_output_10_0_g76482 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76351 = IN.ase_color.b;
				half4 Normal_Packed45_g76559 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				float2 appendResult58_g76559 = (float2(( (Normal_Packed45_g76559).x * (Normal_Packed45_g76559).w ) , (Normal_Packed45_g76559).y));
				half2 Normal_Default50_g76559 = appendResult58_g76559;
				half2 Normal_ASTC41_g76559 = (Normal_Packed45_g76559).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76559 = Normal_ASTC41_g76559;
				#else
				float2 staticSwitch38_g76559 = Normal_Default50_g76559;
				#endif
				half2 Normal_NO_DTX544_g76559 = (Normal_Packed45_g76559).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76559 = Normal_NO_DTX544_g76559;
				#else
				float2 staticSwitch37_g76559 = staticSwitch38_g76559;
				#endif
				float2 temp_output_6555_0_g76351 = ( (staticSwitch37_g76559*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76351 = (float3(temp_output_6555_0_g76351 , 1.0));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal7389_g76351 = appendResult7388_g76351;
				float3 worldNormal7389_g76351 = float3(dot(tanToWorld0,tanNormal7389_g76351), dot(tanToWorld1,tanNormal7389_g76351), dot(tanToWorld2,tanNormal7389_g76351));
				half3 Main_NormalWS7390_g76351 = worldNormal7389_g76351;
				float lerpResult6884_g76351 = lerp( Mesh_DetailMask90_g76351 , ((Main_NormalWS7390_g76351).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76481 = clamp( lerpResult6884_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76480 = _DetailMeshMinValue;
				float temp_output_10_0_g76480 = ( _DetailMeshMaxValue - temp_output_7_0_g76480 );
				half Blend_Mask_Mesh1540_g76351 = saturate( ( ( clampResult17_g76481 - temp_output_7_0_g76480 ) / ( temp_output_10_0_g76480 + 0.0001 ) ) );
				float clampResult17_g76504 = clamp( ( Blend_Mask_Texture6794_g76351 * Blend_Mask_Mesh1540_g76351 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76552 = _DetailBlendMinValue;
				float temp_output_10_0_g76552 = ( _DetailBlendMaxValue - temp_output_7_0_g76552 );
				half Blend_Mask147_g76351 = ( saturate( ( ( clampResult17_g76504 - temp_output_7_0_g76552 ) / ( temp_output_10_0_g76552 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g76351 = lerp( Main_Albedo99_g76351 , lerpResult4834_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float3 staticSwitch255_g76351 = lerpResult235_g76351;
				#else
				float3 staticSwitch255_g76351 = Main_Albedo99_g76351;
				#endif
				half3 Blend_Albedo265_g76351 = staticSwitch255_g76351;
				half Mesh_Height1524_g76351 = IN.ase_color.a;
				float temp_output_7_0_g76402 = _GradientMinValue;
				float temp_output_10_0_g76402 = ( _GradientMaxValue - temp_output_7_0_g76402 );
				half Tint_Gradient_Value2784_g76351 = saturate( ( ( Mesh_Height1524_g76351 - temp_output_7_0_g76402 ) / ( temp_output_10_0_g76402 + 0.0001 ) ) );
				float3 lerpResult2779_g76351 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Tint_Gradient_Value2784_g76351);
				float lerpResult6617_g76351 = lerp( Main_Mask_Remap5765_g76351 , Second_Mask_Remap6130_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6623_g76351 = lerpResult6617_g76351;
				#else
				float staticSwitch6623_g76351 = Main_Mask_Remap5765_g76351;
				#endif
				half Blend_Mask_Remap6621_g76351 = staticSwitch6623_g76351;
				half Tint_Gradient_Mask6207_g76351 = Blend_Mask_Remap6621_g76351;
				float3 lerpResult6208_g76351 = lerp( float3( 1,1,1 ) , lerpResult2779_g76351 , Tint_Gradient_Mask6207_g76351);
				half3 Tint_Gradient_Color5769_g76351 = lerpResult6208_g76351;
				half3 Tint_Noise_Color5770_g76351 = float3(1,1,1);
				half3 Tint_User_Color7335_g76351 = float3(1,1,1);
				float Mesh_Occlusion318_g76351 = IN.ase_color.g;
				float clampResult17_g76399 = clamp( Mesh_Occlusion318_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76405 = _VertexOcclusionMinValue;
				float temp_output_10_0_g76405 = ( _VertexOcclusionMaxValue - temp_output_7_0_g76405 );
				half Occlusion_Mask6432_g76351 = saturate( ( ( clampResult17_g76399 - temp_output_7_0_g76405 ) / ( temp_output_10_0_g76405 + 0.0001 ) ) );
				float3 lerpResult2945_g76351 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g76351);
				half3 Occlusion_Color648_g76351 = lerpResult2945_g76351;
				half3 Matcap_Color7428_g76351 = half3(0,0,0);
				half3 Blend_Albedo_Tinted2808_g76351 = ( ( Blend_Albedo265_g76351 * Tint_Gradient_Color5769_g76351 * Tint_Noise_Color5770_g76351 * Tint_User_Color7335_g76351 * Occlusion_Color648_g76351 ) + Matcap_Color7428_g76351 );
				float3 temp_output_3_0_g76397 = Blend_Albedo_Tinted2808_g76351;
				float dotResult20_g76397 = dot( temp_output_3_0_g76397 , float3(0.2126,0.7152,0.0722) );
				half Blend_Albedo_Grayscale5939_g76351 = dotResult20_g76397;
				float3 temp_cast_1 = (Blend_Albedo_Grayscale5939_g76351).xxx;
				float temp_output_82_0_g76372 = _LayerColorsValue;
				float temp_output_19_0_g76376 = TVE_ColorsUsage[(int)temp_output_82_0_g76372];
				float4 temp_output_91_19_g76372 = TVE_ColorsCoords;
				float3 vertexToFrag3890_g76351 = IN.ase_texcoord10.xyz;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 vertexToFrag4224_g76351 = IN.ase_texcoord11.xyz;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 lerpResult4822_g76351 = lerp( WorldPosition3905_g76351 , ObjectPosition4223_g76351 , _ColorsPositionMode);
				half2 UV94_g76372 = ( (temp_output_91_19_g76372).zw + ( (temp_output_91_19_g76372).xy * (lerpResult4822_g76351).xz ) );
				float4 tex2DArrayNode83_g76372 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, UV94_g76372,temp_output_82_0_g76372, 0.0 );
				float4 temp_output_17_0_g76376 = tex2DArrayNode83_g76372;
				float4 temp_output_92_86_g76372 = TVE_ColorsParams;
				float4 temp_output_3_0_g76376 = temp_output_92_86_g76372;
				float4 ifLocalVar18_g76376 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76376 >= 0.5 )
				ifLocalVar18_g76376 = temp_output_17_0_g76376;
				else
				ifLocalVar18_g76376 = temp_output_3_0_g76376;
				float4 lerpResult22_g76376 = lerp( temp_output_3_0_g76376 , temp_output_17_0_g76376 , temp_output_19_0_g76376);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76376 = lerpResult22_g76376;
				#else
				float4 staticSwitch24_g76376 = ifLocalVar18_g76376;
				#endif
				half4 Global_Colors_Params5434_g76351 = staticSwitch24_g76376;
				float4 temp_output_346_0_g76358 = Global_Colors_Params5434_g76351;
				half Global_Colors_A1701_g76351 = saturate( (temp_output_346_0_g76358).w );
				half Colors_Influence3668_g76351 = Global_Colors_A1701_g76351;
				float temp_output_6306_0_g76351 = ( 1.0 - Colors_Influence3668_g76351 );
				float3 lerpResult3618_g76351 = lerp( Blend_Albedo_Tinted2808_g76351 , temp_cast_1 , ( 1.0 - ( temp_output_6306_0_g76351 * temp_output_6306_0_g76351 ) ));
				half3 Global_Colors_RGB1700_g76351 = (temp_output_346_0_g76358).xyz;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g76389 = 2.0;
				#else
				float staticSwitch1_g76389 = 4.594794;
				#endif
				half3 Colors_RGB1954_g76351 = ( Global_Colors_RGB1700_g76351 * staticSwitch1_g76389 * _ColorsIntensityValue );
				float lerpResult7679_g76351 = lerp( 1.0 , Blend_Mask_Remap6621_g76351 , _ColorsMaskValue);
				half Colors_Value3692_g76351 = ( lerpResult7679_g76351 * _GlobalColors );
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = IN.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				float lerpResult3870_g76351 = lerp( 1.0 , Global_MeshVariation5104_g76351 , _ColorsVariationValue);
				half Colors_Variation3650_g76351 = lerpResult3870_g76351;
				half Occlusion_Alpha6463_g76351 = _VertexOcclusionColor.a;
				float lerpResult6459_g76351 = lerp( Occlusion_Mask6432_g76351 , ( 1.0 - Occlusion_Mask6432_g76351 ) , _VertexOcclusionColorsMode);
				float lerpResult6461_g76351 = lerp( Occlusion_Alpha6463_g76351 , 1.0 , lerpResult6459_g76351);
				half Occlusion_Colors6450_g76351 = lerpResult6461_g76351;
				float3 temp_output_3_0_g76398 = ( Blend_Albedo265_g76351 * Tint_Gradient_Color5769_g76351 * Tint_Noise_Color5770_g76351 );
				float dotResult20_g76398 = dot( temp_output_3_0_g76398 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g76351 = clamp( saturate( ( dotResult20_g76398 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g76351 = clampResult6740_g76351;
				float temp_output_7_0_g76489 = 0.1;
				float temp_output_10_0_g76489 = ( 0.2 - temp_output_7_0_g76489 );
				float lerpResult16_g76390 = lerp( 0.0 , saturate( ( ( ( Colors_Value3692_g76351 * Colors_Influence3668_g76351 * Colors_Variation3650_g76351 * Occlusion_Colors6450_g76351 * Blend_Albedo_Globals6410_g76351 ) - temp_output_7_0_g76489 ) / ( temp_output_10_0_g76489 + 0.0001 ) ) ) , TVE_IsEnabled);
				float3 lerpResult3628_g76351 = lerp( Blend_Albedo_Tinted2808_g76351 , ( lerpResult3618_g76351 * Colors_RGB1954_g76351 ) , lerpResult16_g76390);
				half3 Blend_Albedo_Colored_High6027_g76351 = lerpResult3628_g76351;
				half3 Blend_Albedo_Colored863_g76351 = Blend_Albedo_Colored_High6027_g76351;
				half3 Global_OverlayColor1758_g76351 = (TVE_OverlayColor).rgb;
				float temp_output_84_0_g76367 = _LayerExtrasValue;
				float temp_output_19_0_g76371 = TVE_ExtrasUsage[(int)temp_output_84_0_g76367];
				float4 temp_output_93_19_g76367 = TVE_ExtrasCoords;
				float3 lerpResult4827_g76351 = lerp( WorldPosition3905_g76351 , ObjectPosition4223_g76351 , _ExtrasPositionMode);
				half2 UV96_g76367 = ( (temp_output_93_19_g76367).zw + ( (temp_output_93_19_g76367).xy * (lerpResult4827_g76351).xz ) );
				float4 tex2DArrayNode48_g76367 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76367,temp_output_84_0_g76367, 0.0 );
				float4 temp_output_17_0_g76371 = tex2DArrayNode48_g76367;
				float4 temp_output_94_85_g76367 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76371 = temp_output_94_85_g76367;
				float4 ifLocalVar18_g76371 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76371 >= 0.5 )
				ifLocalVar18_g76371 = temp_output_17_0_g76371;
				else
				ifLocalVar18_g76371 = temp_output_3_0_g76371;
				float4 lerpResult22_g76371 = lerp( temp_output_3_0_g76371 , temp_output_17_0_g76371 , temp_output_19_0_g76371);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76371 = lerpResult22_g76371;
				#else
				float4 staticSwitch24_g76371 = ifLocalVar18_g76371;
				#endif
				half4 Global_Extras_Params5440_g76351 = staticSwitch24_g76371;
				float4 break456_g76381 = Global_Extras_Params5440_g76351;
				half Global_Extras_Overlay156_g76351 = break456_g76381.z;
				float lerpResult1065_g76351 = lerp( 1.0 , Global_MeshVariation5104_g76351 , _OverlayVariationValue);
				half Overlay_Variation4560_g76351 = lerpResult1065_g76351;
				half Overlay_Value5738_g76351 = ( _GlobalOverlay * Global_Extras_Overlay156_g76351 * Overlay_Variation4560_g76351 );
				half2 Main_Normal137_g76351 = temp_output_6555_0_g76351;
				float2 lerpResult3372_g76351 = lerp( float2( 0,0 ) , Main_Normal137_g76351 , _DetailNormalValue);
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				half4 Normal_Packed45_g76562 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				float2 appendResult58_g76562 = (float2(( (Normal_Packed45_g76562).x * (Normal_Packed45_g76562).w ) , (Normal_Packed45_g76562).y));
				half2 Normal_Default50_g76562 = appendResult58_g76562;
				half2 Normal_ASTC41_g76562 = (Normal_Packed45_g76562).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76562 = Normal_ASTC41_g76562;
				#else
				float2 staticSwitch38_g76562 = Normal_Default50_g76562;
				#endif
				half2 Normal_NO_DTX544_g76562 = (Normal_Packed45_g76562).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76562 = Normal_NO_DTX544_g76562;
				#else
				float2 staticSwitch37_g76562 = staticSwitch38_g76562;
				#endif
				float2 temp_output_6560_0_g76351 = ( (staticSwitch37_g76562*2.0 + -1.0) * _SecondNormalValue );
				half2 Normal_Planar45_g76565 = temp_output_6560_0_g76351;
				float2 break64_g76565 = Normal_Planar45_g76565;
				float3 appendResult65_g76565 = (float3(break64_g76565.x , 0.0 , break64_g76565.y));
				float2 temp_output_7603_0_g76351 = (mul( ase_worldToTangent, appendResult65_g76565 )).xy;
				float2 ifLocalVar7604_g76351 = 0;
				if( _SecondUVsMode >= 2.0 )
				ifLocalVar7604_g76351 = temp_output_7603_0_g76351;
				else
				ifLocalVar7604_g76351 = temp_output_6560_0_g76351;
				half2 Second_Normal179_g76351 = ifLocalVar7604_g76351;
				float2 temp_output_36_0_g76394 = ( lerpResult3372_g76351 + Second_Normal179_g76351 );
				float2 lerpResult3376_g76351 = lerp( Main_Normal137_g76351 , temp_output_36_0_g76394 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float2 staticSwitch267_g76351 = lerpResult3376_g76351;
				#else
				float2 staticSwitch267_g76351 = Main_Normal137_g76351;
				#endif
				half2 Blend_Normal312_g76351 = staticSwitch267_g76351;
				float3 appendResult7377_g76351 = (float3(Blend_Normal312_g76351 , 1.0));
				float3 tanNormal7376_g76351 = appendResult7377_g76351;
				float3 worldNormal7376_g76351 = float3(dot(tanToWorld0,tanNormal7376_g76351), dot(tanToWorld1,tanNormal7376_g76351), dot(tanToWorld2,tanNormal7376_g76351));
				half3 Blend_NormalWS7375_g76351 = worldNormal7376_g76351;
				float lerpResult7446_g76351 = lerp( (Blend_NormalWS7375_g76351).y , IN.ase_normal.y , Vertex_DynamicMode5112_g76351);
				float lerpResult6757_g76351 = lerp( 1.0 , saturate( lerpResult7446_g76351 ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g76351 = lerpResult6757_g76351;
				half Overlay_Shading6688_g76351 = Blend_Albedo_Globals6410_g76351;
				half Overlay_Custom6707_g76351 = 1.0;
				float lerpResult7693_g76351 = lerp( Occlusion_Mask6432_g76351 , ( 1.0 - Occlusion_Mask6432_g76351 ) , _VertexOcclusionOverlayMode);
				float lerpResult6467_g76351 = lerp( Occlusion_Alpha6463_g76351 , 1.0 , lerpResult7693_g76351);
				half Occlusion_Overlay6471_g76351 = lerpResult6467_g76351;
				float temp_output_7_0_g76403 = 0.1;
				float temp_output_10_0_g76403 = ( 0.2 - temp_output_7_0_g76403 );
				half Overlay_Mask_High6064_g76351 = saturate( ( ( ( Overlay_Value5738_g76351 * Overlay_Projection6081_g76351 * Overlay_Shading6688_g76351 * Overlay_Custom6707_g76351 * Occlusion_Overlay6471_g76351 ) - temp_output_7_0_g76403 ) / ( temp_output_10_0_g76403 + 0.0001 ) ) );
				half Overlay_Mask269_g76351 = Overlay_Mask_High6064_g76351;
				float3 lerpResult336_g76351 = lerp( Blend_Albedo_Colored863_g76351 , Global_OverlayColor1758_g76351 , Overlay_Mask269_g76351);
				half3 Blend_Albedo_Overlay359_g76351 = lerpResult336_g76351;
				half Global_WetnessContrast6502_g76351 = TVE_WetnessContrast;
				half Global_Extras_Wetness305_g76351 = break456_g76381.y;
				half Wetness_Value6343_g76351 = ( Global_Extras_Wetness305_g76351 * _GlobalWetness );
				float3 lerpResult6367_g76351 = lerp( Blend_Albedo_Overlay359_g76351 , ( Blend_Albedo_Overlay359_g76351 * Blend_Albedo_Overlay359_g76351 ) , ( Global_WetnessContrast6502_g76351 * Wetness_Value6343_g76351 ));
				half3 Blend_Albedo_Wetness6351_g76351 = lerpResult6367_g76351;
				float vertexToFrag11_g76392 = IN.ase_texcoord9.z;
				half3 Tint_Highlight_Color5771_g76351 = ( ( (_MotionHighlightColor).rgb * vertexToFrag11_g76392 ) + float3( 1,1,1 ) );
				float3 temp_output_6309_0_g76351 = ( Blend_Albedo_Wetness6351_g76351 * Tint_Highlight_Color5771_g76351 );
				half3 Subsurface_Color1722_g76351 = ( (_SubsurfaceColor).rgb * Blend_Albedo_Wetness6351_g76351 );
				half Global_Subsurface4041_g76351 = TVE_SubsurfaceValue;
				half Global_OverlaySubsurface5667_g76351 = TVE_OverlaySubsurface;
				float lerpResult7362_g76351 = lerp( 1.0 , Global_OverlaySubsurface5667_g76351 , Overlay_Value5738_g76351);
				half Overlay_Subsurface7361_g76351 = lerpResult7362_g76351;
				half Subsurface_Intensity1752_g76351 = ( _SubsurfaceValue * Global_Subsurface4041_g76351 * Overlay_Subsurface7361_g76351 );
				float lerpResult7680_g76351 = lerp( 1.0 , Blend_Mask_Remap6621_g76351 , _SubsurfaceMaskValue);
				half Subsurface_Mask1557_g76351 = lerpResult7680_g76351;
				half3 MainLight_Direction3926_g76351 = TVE_MainLightDirection;
				float3 normalizeResult2169_g76351 = normalize( WorldViewDirection );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float dotResult785_g76351 = dot( -MainLight_Direction3926_g76351 , ViewDirection3963_g76351 );
				float saferPower1624_g76351 = abs( saturate( dotResult785_g76351 ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g76351 = 0.0;
				#else
				float staticSwitch1602_g76351 = ( pow( saferPower1624_g76351 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
				#endif
				half Mask_Subsurface_View782_g76351 = staticSwitch1602_g76351;
				half3 Subsurface_Approximation1693_g76351 = ( Subsurface_Color1722_g76351 * Subsurface_Intensity1752_g76351 * Subsurface_Mask1557_g76351 * Mask_Subsurface_View782_g76351 );
				half3 Blend_Albedo_Subsurface149_g76351 = ( temp_output_6309_0_g76351 + Subsurface_Approximation1693_g76351 );
				half3 Blend_Albedo_RimLight7316_g76351 = Blend_Albedo_Subsurface149_g76351;
				
				half Global_OverlayNormalScale6581_g76351 = TVE_OverlayNormalValue;
				float lerpResult6585_g76351 = lerp( 1.0 , Global_OverlayNormalScale6581_g76351 , Overlay_Mask269_g76351);
				half2 Blend_Normal_Overlay366_g76351 = ( Blend_Normal312_g76351 * lerpResult6585_g76351 );
				half Global_WetnessNormalScale6571_g76351 = TVE_WetnessNormalValue;
				float lerpResult6579_g76351 = lerp( 1.0 , Global_WetnessNormalScale6571_g76351 , ( Wetness_Value6343_g76351 * Wetness_Value6343_g76351 ));
				half2 Blend_Normal_Wetness6372_g76351 = ( Blend_Normal_Overlay366_g76351 * lerpResult6579_g76351 );
				float3 appendResult6568_g76351 = (float3(Blend_Normal_Wetness6372_g76351 , 1.0));
				float3 temp_output_13_0_g76382 = appendResult6568_g76351;
				float3 temp_output_33_0_g76382 = ( temp_output_13_0_g76382 * _render_normals );
				float3 switchResult12_g76382 = (((ase_vface>0)?(temp_output_13_0_g76382):(temp_output_33_0_g76382)));
				
				float3 temp_cast_11 = (0.0).xxx;
				float3 temp_output_7161_0_g76351 = (_EmissiveColor).rgb;
				half3 Emissive_Color7162_g76351 = temp_output_7161_0_g76351;
				half2 Emissive_UVs2468_g76351 = ( ( IN.ase_texcoord8.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float temp_output_7_0_g76582 = _EmissiveTexMinValue;
				float3 temp_cast_12 = (temp_output_7_0_g76582).xxx;
				float temp_output_10_0_g76582 = ( _EmissiveTexMaxValue - temp_output_7_0_g76582 );
				half3 Emissive_Texture7022_g76351 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g76351 )).rgb - temp_cast_12 ) / ( temp_output_10_0_g76582 + 0.0001 ) ) );
				half Global_Extras_Emissive4203_g76351 = break456_g76381.x;
				float lerpResult4206_g76351 = lerp( 1.0 , Global_Extras_Emissive4203_g76351 , _GlobalEmissive);
				half Emissive_Value7024_g76351 = ( ( lerpResult4206_g76351 * _EmissivePhaseValue ) - 1.0 );
				half3 Emissive_Mask6968_g76351 = saturate( ( Emissive_Texture7022_g76351 + Emissive_Value7024_g76351 ) );
				float3 temp_output_3_0_g76584 = ( Emissive_Color7162_g76351 * Emissive_Mask6968_g76351 );
				float temp_output_15_0_g76584 = _emissive_intensity_value;
				float3 temp_output_23_0_g76584 = ( temp_output_3_0_g76584 * temp_output_15_0_g76584 );
				#ifdef TVE_EMISSIVE
				float3 staticSwitch7687_g76351 = temp_output_23_0_g76584;
				#else
				float3 staticSwitch7687_g76351 = temp_cast_11;
				#endif
				half3 Final_Emissive2476_g76351 = staticSwitch7687_g76351;
				
				half Render_Specular4861_g76351 = _RenderSpecular;
				float3 temp_cast_13 = (( 0.04 * Render_Specular4861_g76351 )).xxx;
				
				half Main_Smoothness227_g76351 = ( tex2DNode35_g76351.a * _MainSmoothnessValue );
				half Second_Smoothness236_g76351 = ( tex2DNode33_g76351.a * _SecondSmoothnessValue );
				float lerpResult266_g76351 = lerp( Main_Smoothness227_g76351 , Second_Smoothness236_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch297_g76351 = lerpResult266_g76351;
				#else
				float staticSwitch297_g76351 = Main_Smoothness227_g76351;
				#endif
				half Blend_Smoothness314_g76351 = staticSwitch297_g76351;
				half Global_OverlaySmoothness311_g76351 = TVE_OverlaySmoothness;
				float lerpResult343_g76351 = lerp( Blend_Smoothness314_g76351 , Global_OverlaySmoothness311_g76351 , Overlay_Mask269_g76351);
				half Blend_Smoothness_Overlay371_g76351 = lerpResult343_g76351;
				float temp_output_6499_0_g76351 = ( 1.0 - Wetness_Value6343_g76351 );
				half Blend_Smoothness_Wetness4130_g76351 = saturate( ( Blend_Smoothness_Overlay371_g76351 + ( 1.0 - ( temp_output_6499_0_g76351 * temp_output_6499_0_g76351 ) ) ) );
				
				float lerpResult240_g76351 = lerp( 1.0 , tex2DNode35_g76351.g , _MainOcclusionValue);
				half Main_Occlusion247_g76351 = lerpResult240_g76351;
				float lerpResult239_g76351 = lerp( 1.0 , tex2DNode33_g76351.g , _SecondOcclusionValue);
				half Second_Occlusion251_g76351 = lerpResult239_g76351;
				float lerpResult294_g76351 = lerp( Main_Occlusion247_g76351 , Second_Occlusion251_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch310_g76351 = lerpResult294_g76351;
				#else
				float staticSwitch310_g76351 = Main_Occlusion247_g76351;
				#endif
				half Blend_Occlusion323_g76351 = staticSwitch310_g76351;
				
				float localCustomAlphaClip19_g76558 = ( 0.0 );
				half Main_Alpha316_g76351 = tex2DNode29_g76351.a;
				half Second_Alpha5007_g76351 = tex2DNode89_g76351.a;
				float lerpResult6153_g76351 = lerp( Main_Alpha316_g76351 , Second_Alpha5007_g76351 , Blend_Mask147_g76351);
				float lerpResult6785_g76351 = lerp( ( Main_Alpha316_g76351 * Second_Alpha5007_g76351 ) , lerpResult6153_g76351 , _DetailAlphaMode);
				#ifdef TVE_DETAIL
				float staticSwitch6158_g76351 = lerpResult6785_g76351;
				#else
				float staticSwitch6158_g76351 = Main_Alpha316_g76351;
				#endif
				half Blend_Alpha6157_g76351 = staticSwitch6158_g76351;
				half AlphaTreshold2132_g76351 = _AlphaClipValue;
				half Global_Extras_Alpha1033_g76351 = saturate( break456_g76381.w );
				float lerpResult5154_g76351 = lerp( 0.0 , Global_MeshVariation5104_g76351 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76351 = lerpResult5154_g76351;
				float Emissive_Alpha7625_g76351 = 0.0;
				float lerpResult6866_g76351 = lerp( ( 1.0 - Blend_Mask147_g76351 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_DETAIL
				float staticSwitch6612_g76351 = lerpResult6866_g76351;
				#else
				float staticSwitch6612_g76351 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76351 = staticSwitch6612_g76351;
				half Alpha_Mask6234_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5203_g76351 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76351 - saturate( ( Global_Alpha_Variation5158_g76351 + Emissive_Alpha7625_g76351 ) ) ) + ( Global_Extras_Alpha1033_g76351 * 0.1 ) ) ) , ( Alpha_Mask6234_g76351 * _GlobalAlpha ));
				float lerpResult16_g76395 = lerp( 1.0 , lerpResult5203_g76351 , TVE_IsEnabled);
				half Global_Alpha315_g76351 = lerpResult16_g76395;
				float3 normalizeResult3971_g76351 = normalize( cross( ddy( WorldPosition ) , ddx( WorldPosition ) ) );
				float3 WorldNormal_Derivates3972_g76351 = normalizeResult3971_g76351;
				float dotResult3851_g76351 = dot( ViewDirection3963_g76351 , WorldNormal_Derivates3972_g76351 );
				float lerpResult3993_g76351 = lerp( 1.0 , saturate( ( abs( dotResult3851_g76351 ) * 3.0 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g76351 = lerpResult3993_g76351;
				half Fade_Effects_A5360_g76351 = Fade_Glancing3853_g76351;
				float temp_output_7_0_g76404 = TVE_CameraFadeMin;
				float temp_output_10_0_g76404 = ( TVE_CameraFadeMax - temp_output_7_0_g76404 );
				float lerpResult4755_g76351 = lerp( 1.0 , saturate( saturate( ( ( distance( WorldPosition , _WorldSpaceCameraPos ) - temp_output_7_0_g76404 ) / ( temp_output_10_0_g76404 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76351 = lerpResult4755_g76351;
				half Fade_Effects_B6228_g76351 = ( Fade_Effects_A5360_g76351 * Fade_Camera3743_g76351 );
				half Fade_Mask5149_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5141_g76351 = lerp( 1.0 , ( Fade_Effects_B6228_g76351 * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76351);
				half Fade_Effects_C7653_g76351 = lerpResult5141_g76351;
				float temp_output_5865_0_g76351 = saturate( ( Fade_Effects_C7653_g76351 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76351 ) ).r ) );
				half Fade_Alpha3727_g76351 = temp_output_5865_0_g76351;
				half Final_Alpha7344_g76351 = min( ( ( Blend_Alpha6157_g76351 - AlphaTreshold2132_g76351 ) * Global_Alpha315_g76351 ) , Fade_Alpha3727_g76351 );
				float temp_output_3_0_g76558 = Final_Alpha7344_g76351;
				float Alpha19_g76558 = temp_output_3_0_g76558;
				float temp_output_15_0_g76558 = 0.01;
				float Treshold19_g76558 = temp_output_15_0_g76558;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#else
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76351 = (lerpResult7654_g76351).a;
				half Second_Color_Alpha6152_g76351 = (lerpResult7662_g76351).a;
				float lerpResult6168_g76351 = lerp( Main_Color_Alpha6121_g76351 , Second_Color_Alpha6152_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6174_g76351 = lerpResult6168_g76351;
				#else
				float staticSwitch6174_g76351 = Main_Color_Alpha6121_g76351;
				#endif
				half Blend_Color_Alpha6167_g76351 = staticSwitch6174_g76351;
				half Final_Clip914_g76351 = saturate( ( Alpha19_g76558 * Blend_Color_Alpha6167_g76351 ) );
				

				float3 BaseColor = Blend_Albedo_RimLight7316_g76351;
				float3 Normal = switchResult12_g76382;
				float3 Emission = Final_Emissive2476_g76351;
				float3 Specular = temp_cast_13;
				float Metallic = 0;
				float Smoothness = Blend_Smoothness_Wetness4130_g76351;
				float Occlusion = Blend_Occlusion323_g76351;
				float Alpha = Final_Clip914_g76351;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.positionCS;
				inputData.viewDirectionWS = WorldViewDirection;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent, WorldBiTangent, WorldNormal));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif
					inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
				#elif !defined(LIGHTMAP_ON) && (defined(PROBE_VOLUMES_L1) || defined(PROBE_VOLUMES_L2))
					inputData.bakedGI = SAMPLE_GI( SH, GetAbsolutePositionWS(inputData.positionWS),
						inputData.normalWS,
						inputData.viewDirectionWS,
						inputData.positionCS.xy);
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.positionCS, surfaceData, inputData);
				#endif

				#ifdef ASE_LIGHTING_SIMPLE
					half4 color = UniversalFragmentBlinnPhong( inputData, surfaceData);
				#else
					half4 color = UniversalFragmentPBR( inputData, surfaceData);
				#endif

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += BaseColor * transmission;

					SUM_LIGHT_TRANSMISSION( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							[loop] for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSMISSION( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += BaseColor * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							[loop] for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif				
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_color : COLOR;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SecondColor;
			half4 _MotionHighlightColor;
			half4 _SubsurfaceColor;
			half4 _NoiseMaskRemap;
			half4 _MainColorTwo;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColorTwo;
			half4 _MainUVs;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _DetailMeshRemap;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half4 _DetailMaskRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _RimLightRemap;
			half4 _MainColor;
			half3 _render_normals;
			half _SecondColorMode;
			half _DetailBlendMode;
			half _DetailMaskMode;
			half _DetailMaskMinValue;
			half _DetailMaskMaxValue;
			half _MainNormalValue;
			half _DetailMeshMode;
			half _DetailMeshMinValue;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _MainMaskMaxValue;
			half _SecondAlbedoValue;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			half _GlobalSize;
			half _SizeFadeEndValue;
			half _SizeFadeStartValue;
			half _MainAlbedoValue;
			half _MainMaskMinValue;
			half _DetailMeshMaxValue;
			half _MainColorMode;
			half _SecondUVsScaleMode;
			half _SecondMaskMinValue;
			half _DetailBlendMinValue;
			half _GradientMaxValue;
			half _DetailMode;
			half _SubsurfaceValue;
			half _SubsurfaceMaskValue;
			half _EmissiveTexMinValue;
			half _EmissiveTexMaxValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _FadeGlancingValue;
			half _SecondSmoothnessValue;
			half _DetailBlendMaxValue;
			half _VertexOcclusionOverlayMode;
			half _SecondNormalValue;
			half _DetailValue;
			half _GradientMinValue;
			half _MotionAmplitude_20;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _ColorsIntensityValue;
			half _OverlayProjectionValue;
			half _ColorsMaskValue;
			half _ColorsVariationValue;
			half _VertexOcclusionColorsMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _OverlayVariationValue;
			half _DetailNormalValue;
			half _SecondUVsMode;
			half _GlobalColors;
			half _MotionFacingValue;
			half _LayerMotionValue;
			half _MotionVariation_20;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _RenderDirect;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _Cutoff;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _IsVersion;
			half _HasEmissive;
			half _render_src;
			half _render_zw;
			half _render_dst;
			half _render_coverage;
			half _IsStandardShader;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageGlobalsVariation;
			half _IsTVEShader;
			half _HasOcclusion;
			half _IsIdentifier;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _VertexVariationMode;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MessageMotionVariation;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _MessageOcclusion;
			half _EmissiveMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_20;
			half _DetailMaskInvertMode;
			half _CategoryMotion;
			half _ColorsMaskMaxValue;
			half _RenderCoverage;
			half _MessageSubsurface;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderZWrite;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderClip;
			half _ColorsMaskMinValue;
			half _FadeConstantValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 VertexPosition3588_g76351 = v.positionOS.xyz;
				float3 appendResult60_g76361 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76351 = ( appendResult60_g76361 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76351 = Mesh_PivotsData2831_g76351;
				float3 temp_output_2283_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				half3 VertexPos40_g76486 = temp_output_2283_0_g76351;
				half3 VertexPos40_g76487 = VertexPos40_g76486;
				float3 appendResult74_g76487 = (float3(VertexPos40_g76487.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76487 = appendResult74_g76487;
				float3 break84_g76487 = VertexPos40_g76487;
				float3 appendResult81_g76487 = (float3(0.0 , break84_g76487.y , break84_g76487.z));
				half3 VertexPosOtherAxis82_g76487 = appendResult81_g76487;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g76351 = ase_worldPos;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 WorldPosition_Shifted7477_g76351 = ( WorldPosition3905_g76351 - TVE_WorldOrigin );
				float4x4 break19_g76407 = GetObjectToWorldMatrix();
				float3 appendResult20_g76407 = (float3(break19_g76407[ 0 ][ 3 ] , break19_g76407[ 1 ][ 3 ] , break19_g76407[ 2 ][ 3 ]));
				float3 temp_output_122_0_g76407 = Mesh_PivotsData2831_g76351;
				float3 PivotsOnly105_g76407 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76407 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g76409 = ( appendResult20_g76407 + PivotsOnly105_g76407 );
				half3 WorldData19_g76409 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76409 = WorldData19_g76409;
				#else
				float3 staticSwitch14_g76409 = ObjectData20_g76409;
				#endif
				float3 temp_output_114_0_g76407 = staticSwitch14_g76409;
				float3 vertexToFrag4224_g76351 = temp_output_114_0_g76407;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				float3 lerpResult6766_g76351 = lerp( WorldPosition_Shifted7477_g76351 , ObjectPosition_Shifted7481_g76351 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76351 = lerpResult6766_g76351;
				half3 Input_Position419_g76527 = Motion_10_Position6738_g76351;
				float Input_MotionScale287_g76527 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76527 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76527 = (( Input_Position419_g76527 * Input_MotionScale287_g76527 * NoiseTex_Tilling735_g76527 * 0.0075 )).xz;
				float2 temp_output_447_0_g76356 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76351 = temp_output_447_0_g76356;
				half2 Input_DirectionWS423_g76527 = Global_Wind_DirectionWS4683_g76351;
				float lerpResult128_g76528 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76527 = _MotionSpeed_10;
				half Input_MotionVariation284_g76527 = _MotionVariation_10;
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = v.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				half Input_GlobalMeshVariation569_g76527 = Global_MeshVariation5104_g76351;
				float temp_output_630_0_g76527 = ( ( ( lerpResult128_g76528 * Input_MotionSpeed62_g76527 ) + ( Input_MotionVariation284_g76527 * Input_GlobalMeshVariation569_g76527 ) ) * 0.03 );
				float temp_output_607_0_g76527 = frac( temp_output_630_0_g76527 );
				float4 lerpResult590_g76527 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * temp_output_607_0_g76527 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * frac( ( temp_output_630_0_g76527 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76527 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76527 = lerpResult590_g76527;
				float2 temp_output_645_0_g76527 = ((Noise_Complex703_g76527).rg*2.0 + -1.0);
				float2 break650_g76527 = temp_output_645_0_g76527;
				float3 appendResult649_g76527 = (float3(break650_g76527.x , 0.0 , break650_g76527.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76527 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76510 = Global_Noise_OS5548_g76351;
				float2 break448_g76356 = temp_output_447_0_g76356;
				float3 appendResult452_g76356 = (float3(break448_g76356.x , 0.0 , break448_g76356.y));
				half2 Global_Wind_DirectionOS5692_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76510 = Global_Wind_DirectionOS5692_g76351;
				float temp_output_84_0_g76362 = _LayerMotionValue;
				float temp_output_19_0_g76366 = TVE_MotionUsage[(int)temp_output_84_0_g76362];
				float4 temp_output_91_19_g76362 = TVE_MotionCoords;
				half2 UV94_g76362 = ( (temp_output_91_19_g76362).zw + ( (temp_output_91_19_g76362).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76362 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76362,temp_output_84_0_g76362, 0.0 );
				float4 temp_output_17_0_g76366 = tex2DArrayNode50_g76362;
				float4 temp_output_112_19_g76362 = TVE_MotionParams;
				float4 temp_output_3_0_g76366 = temp_output_112_19_g76362;
				float4 ifLocalVar18_g76366 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76366 >= 0.5 )
				ifLocalVar18_g76366 = temp_output_17_0_g76366;
				else
				ifLocalVar18_g76366 = temp_output_3_0_g76366;
				float4 lerpResult22_g76366 = lerp( temp_output_3_0_g76366 , temp_output_17_0_g76366 , temp_output_19_0_g76366);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76366 = lerpResult22_g76366;
				#else
				float4 staticSwitch24_g76366 = ifLocalVar18_g76366;
				#endif
				half4 Global_Motion_Params3909_g76351 = staticSwitch24_g76366;
				float4 break322_g76356 = Global_Motion_Params3909_g76351;
				float lerpResult457_g76356 = lerp( break322_g76356.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76356 = ( 1.0 - lerpResult457_g76356 );
				half Global_Wind_Power2223_g76351 = ( 1.0 - ( temp_output_459_0_g76356 * temp_output_459_0_g76356 ) );
				half Input_WindPower449_g76510 = Global_Wind_Power2223_g76351;
				float2 lerpResult516_g76510 = lerp( Input_Noise_DirectionOS487_g76510 , Input_Wind_DirectionOS458_g76510 , ( Input_WindPower449_g76510 * 0.6 ));
				half Mesh_Motion_107572_g76351 = v.ase_color.a;
				half Input_MeshHeight388_g76510 = Mesh_Motion_107572_g76351;
				half ObjectData20_g76511 = Input_MeshHeight388_g76510;
				float enc62_g76576 = v.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76576 = DecodeFloatToVector2( enc62_g76576 );
				float2 break63_g76576 = ( localDecodeFloatToVector262_g76576 * 100.0 );
				float Bounds_Height5230_g76351 = break63_g76576.x;
				half Input_BoundsHeight390_g76510 = Bounds_Height5230_g76351;
				half WorldData19_g76511 = ( Input_MeshHeight388_g76510 * Input_MeshHeight388_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76511 = WorldData19_g76511;
				#else
				float staticSwitch14_g76511 = ObjectData20_g76511;
				#endif
				half Final_Motion10_Mask321_g76510 = ( staticSwitch14_g76511 * 2.0 );
				half Input_BendingAmplitude376_g76510 = _MotionAmplitude_10;
				half Global_MotionValue640_g76510 = TVE_MotionValue_10;
				half2 Final_Bending631_g76510 = ( lerpResult516_g76510 * ( Final_Motion10_Mask321_g76510 * Input_BendingAmplitude376_g76510 * Input_WindPower449_g76510 * Input_WindPower449_g76510 * Global_MotionValue640_g76510 ) );
				float2 appendResult433_g76356 = (float2(break322_g76356.x , break322_g76356.y));
				float2 temp_output_436_0_g76356 = (appendResult433_g76356*2.0 + -1.0);
				float2 break441_g76356 = temp_output_436_0_g76356;
				float3 appendResult440_g76356 = (float3(break441_g76356.x , 0.0 , break441_g76356.y));
				half2 Global_React_DirectionOS39_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76510 = Global_React_DirectionOS39_g76351;
				float clampResult17_g76513 = clamp( Input_MeshHeight388_g76510 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76512 = 0.0;
				half Input_InteractionUseMask62_g76510 = _InteractionMaskValue;
				float temp_output_10_0_g76512 = ( Input_InteractionUseMask62_g76510 - temp_output_7_0_g76512 );
				half Final_InteractionRemap594_g76510 = saturate( ( ( clampResult17_g76513 - temp_output_7_0_g76512 ) / ( temp_output_10_0_g76512 + 0.0001 ) ) );
				half ObjectData20_g76514 = Final_InteractionRemap594_g76510;
				half WorldData19_g76514 = ( Final_InteractionRemap594_g76510 * Final_InteractionRemap594_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76514 = WorldData19_g76514;
				#else
				float staticSwitch14_g76514 = ObjectData20_g76514;
				#endif
				half Final_InteractionMask373_g76510 = ( staticSwitch14_g76514 * 2.0 );
				half Input_InteractionAmplitude58_g76510 = _InteractionAmplitude;
				half2 Final_Interaction632_g76510 = ( Input_React_DirectionOS358_g76510 * Final_InteractionMask373_g76510 * Input_InteractionAmplitude58_g76510 );
				half Global_Interaction_Mask66_g76351 = ( break322_g76356.w * break322_g76356.w * break322_g76356.w * break322_g76356.w );
				float Input_InteractionGlobalMask330_g76510 = Global_Interaction_Mask66_g76351;
				half Final_InteractionValue525_g76510 = saturate( ( Input_InteractionAmplitude58_g76510 * Input_InteractionGlobalMask330_g76510 ) );
				float2 lerpResult551_g76510 = lerp( Final_Bending631_g76510 , Final_Interaction632_g76510 , Final_InteractionValue525_g76510);
				float2 break364_g76510 = lerpResult551_g76510;
				float3 appendResult638_g76510 = (float3(break364_g76510.x , 0.0 , break364_g76510.y));
				half3 Motion_10_Interaction7519_g76351 = appendResult638_g76510;
				half3 Angle44_g76486 = Motion_10_Interaction7519_g76351;
				half Angle44_g76487 = (Angle44_g76486).z;
				half3 VertexPos40_g76488 = ( VertexPosRotationAxis50_g76487 + ( VertexPosOtherAxis82_g76487 * cos( Angle44_g76487 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76487 ) * sin( Angle44_g76487 ) ) );
				float3 appendResult74_g76488 = (float3(0.0 , 0.0 , VertexPos40_g76488.z));
				half3 VertexPosRotationAxis50_g76488 = appendResult74_g76488;
				float3 break84_g76488 = VertexPos40_g76488;
				float3 appendResult81_g76488 = (float3(break84_g76488.x , break84_g76488.y , 0.0));
				half3 VertexPosOtherAxis82_g76488 = appendResult81_g76488;
				half Angle44_g76488 = -(Angle44_g76486).x;
				half3 Input_Position419_g76566 = WorldPosition_Shifted7477_g76351;
				float3 break459_g76566 = Input_Position419_g76566;
				float Sum_Position446_g76566 = ( break459_g76566.x + break459_g76566.y + break459_g76566.z );
				half Input_MotionScale321_g76566 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76566 = _MotionVariation_20;
				half Input_GlobalVariation400_g76566 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76567 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76566 = _MotionSpeed_20;
				float temp_output_404_0_g76566 = ( lerpResult128_g76567 * Input_MotionSpeed62_g76566 );
				half Motion_SineA450_g76566 = sin( ( ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) + ( Input_MotionVariation330_g76566 * Input_GlobalVariation400_g76566 ) + temp_output_404_0_g76566 ) );
				half Motion_SineB395_g76566 = sin( ( ( temp_output_404_0_g76566 * 0.6842 ) + ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) ) );
				half3 Input_Position419_g76585 = VertexPosition3588_g76351;
				float3 normalizeResult518_g76585 = normalize( Input_Position419_g76585 );
				half2 Input_DirectionOS423_g76585 = Global_React_DirectionOS39_g76351;
				float2 break521_g76585 = -Input_DirectionOS423_g76585;
				float3 appendResult522_g76585 = (float3(break521_g76585.x , 0.0 , break521_g76585.y));
				float dotResult519_g76585 = dot( normalizeResult518_g76585 , appendResult522_g76585 );
				half Input_Value62_g76585 = _MotionFacingValue;
				float lerpResult524_g76585 = lerp( 1.0 , (dotResult519_g76585*0.5 + 0.5) , Input_Value62_g76585);
				half ObjectData20_g76586 = max( lerpResult524_g76585 , 0.001 );
				half WorldData19_g76586 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76586 = WorldData19_g76586;
				#else
				float staticSwitch14_g76586 = ObjectData20_g76586;
				#endif
				half Motion_FacingMask5214_g76351 = staticSwitch14_g76586;
				half Motion_20_Amplitude4381_g76351 = Motion_FacingMask5214_g76351;
				half Input_MotionAmplitude384_g76566 = Motion_20_Amplitude4381_g76351;
				half Input_GlobalWind407_g76566 = Global_Wind_Power2223_g76351;
				float4 break638_g76527 = abs( Noise_Complex703_g76527 );
				half Global_Noise_B5526_g76351 = break638_g76527.b;
				half Input_GlobalNoise411_g76566 = Global_Noise_B5526_g76351;
				float lerpResult413_g76566 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76566);
				half Motion_Amplitude418_g76566 = ( Input_MotionAmplitude384_g76566 * Input_GlobalWind407_g76566 * pow( Input_GlobalNoise411_g76566 , lerpResult413_g76566 ) );
				half Input_Squash58_g76566 = _MotionAmplitude_20;
				float enc59_g76576 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76576 = DecodeFloatToVector2( enc59_g76576 );
				float2 break61_g76576 = localDecodeFloatToVector259_g76576;
				half Mesh_Motion_2060_g76351 = break61_g76576.x;
				half Input_MeshMotion_20388_g76566 = Mesh_Motion_2060_g76351;
				float Bounds_Radius5231_g76351 = break63_g76576.y;
				half Input_BoundsRadius390_g76566 = Bounds_Radius5231_g76351;
				half Global_MotionValue462_g76566 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76566 = Global_React_DirectionOS39_g76351;
				float2 break371_g76566 = Input_DirectionOS366_g76566;
				float3 appendResult372_g76566 = (float3(break371_g76566.x , ( Motion_SineA450_g76566 * 0.3 ) , break371_g76566.y));
				half3 Motion_20_Squash4418_g76351 = ( ( (max( Motion_SineA450_g76566 , Motion_SineB395_g76566 )*0.5 + 0.5) * Motion_Amplitude418_g76566 * Input_Squash58_g76566 * Input_MeshMotion_20388_g76566 * Input_BoundsRadius390_g76566 * Global_MotionValue462_g76566 ) * appendResult372_g76566 );
				half3 VertexPos40_g76472 = ( ( VertexPosRotationAxis50_g76488 + ( VertexPosOtherAxis82_g76488 * cos( Angle44_g76488 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76488 ) * sin( Angle44_g76488 ) ) ) + Motion_20_Squash4418_g76351 );
				float3 appendResult74_g76472 = (float3(0.0 , VertexPos40_g76472.y , 0.0));
				float3 VertexPosRotationAxis50_g76472 = appendResult74_g76472;
				float3 break84_g76472 = VertexPos40_g76472;
				float3 appendResult81_g76472 = (float3(break84_g76472.x , 0.0 , break84_g76472.z));
				float3 VertexPosOtherAxis82_g76472 = appendResult81_g76472;
				half Input_Rolling379_g76566 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76351 = ( Motion_SineA450_g76566 * Motion_Amplitude418_g76566 * Input_Rolling379_g76566 * Input_MeshMotion_20388_g76566 * Global_MotionValue462_g76566 );
				half Angle44_g76472 = Motion_20_Rolling5257_g76351;
				half3 Input_Position500_g76523 = WorldPosition_Shifted7477_g76351;
				half Input_MotionScale321_g76523 = _MotionScale_32;
				half Input_MotionVariation330_g76523 = _MotionVariation_32;
				half Input_GlobalVariation372_g76523 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76524 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76523 = _MotionSpeed_32;
				float4 tex2DNode460_g76523 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76523).xz * Input_MotionScale321_g76523 * 0.03 ) + ( Input_MotionVariation330_g76523 * Input_GlobalVariation372_g76523 ) + ( lerpResult128_g76524 * Input_MotionSpeed62_g76523 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76523 = (float3(tex2DNode460_g76523.r , tex2DNode460_g76523.g , tex2DNode460_g76523.b));
				half3 Flutter_Texture489_g76523 = (appendResult462_g76523*2.0 + -1.0);
				float temp_output_7_0_g76401 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76401 = ( TVE_MotionFadeStart - temp_output_7_0_g76401 );
				half Motion_FadeOut4005_g76351 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76401 ) / ( temp_output_10_0_g76401 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76351 = ( _MotionAmplitude_32 * Motion_FacingMask5214_g76351 * Motion_FadeOut4005_g76351 );
				half Input_MotionAmplitude58_g76523 = Motion_30_Amplitude4960_g76351;
				half Mesh_Motion_30144_g76351 = break61_g76576.y;
				half Input_MeshMotion_30374_g76523 = Mesh_Motion_30144_g76351;
				half Input_GlobalWind471_g76523 = Global_Wind_Power2223_g76351;
				half Global_MotionValue503_g76523 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g76523 = Global_Noise_B5526_g76351;
				float lerpResult466_g76523 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76523);
				half Flutter_Amplitude491_g76523 = ( Input_MotionAmplitude58_g76523 * Input_MeshMotion_30374_g76523 * Input_GlobalWind471_g76523 * Global_MotionValue503_g76523 * pow( Input_GlobalNoise472_g76523 , lerpResult466_g76523 ) );
				half3 Motion_30_Flutter263_g76351 = ( Flutter_Texture489_g76523 * Flutter_Amplitude491_g76523 );
				float3 Vertex_Motion_Object833_g76351 = ( ( VertexPosRotationAxis50_g76472 + ( VertexPosOtherAxis82_g76472 * cos( Angle44_g76472 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76472 ) * sin( Angle44_g76472 ) ) ) + Motion_30_Flutter263_g76351 );
				half3 ObjectData20_g76419 = Vertex_Motion_Object833_g76351;
				float3 temp_output_3474_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				float3 Vertex_Motion_World1118_g76351 = ( ( ( temp_output_3474_0_g76351 + Motion_10_Interaction7519_g76351 ) + Motion_20_Squash4418_g76351 ) + Motion_30_Flutter263_g76351 );
				half3 WorldData19_g76419 = Vertex_Motion_World1118_g76351;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76419 = WorldData19_g76419;
				#else
				float3 staticSwitch14_g76419 = ObjectData20_g76419;
				#endif
				float3 temp_output_7495_0_g76351 = staticSwitch14_g76419;
				float3 Vertex_Motion7493_g76351 = temp_output_7495_0_g76351;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 break2709_g76351 = cross( ViewDirection3963_g76351 , half3(0,1,0) );
				float3 appendResult2710_g76351 = (float3(-break2709_g76351.z , 0.0 , break2709_g76351.x));
				float3 appendResult2667_g76351 = (float3(Global_MeshVariation5104_g76351 , 0.5 , Global_MeshVariation5104_g76351));
				half Mesh_Height1524_g76351 = v.ase_color.a;
				float dotResult2212_g76351 = dot( ViewDirection3963_g76351 , float3(0,1,0) );
				half Mask_HView2656_g76351 = dotResult2212_g76351;
				float saferPower2652_g76351 = abs( Mask_HView2656_g76351 );
				half3 Grass_Perspective2661_g76351 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76351 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76351*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76351 * pow( saferPower2652_g76351 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76383 = _LayerVertexValue;
				float temp_output_19_0_g76387 = TVE_VertexUsage[(int)temp_output_84_0_g76383];
				float4 temp_output_94_19_g76383 = TVE_VertexCoords;
				half2 UV97_g76383 = ( (temp_output_94_19_g76383).zw + ( (temp_output_94_19_g76383).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76383 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76383,temp_output_84_0_g76383, 0.0 );
				float4 temp_output_17_0_g76387 = tex2DArrayNode50_g76383;
				float4 temp_output_111_19_g76383 = TVE_VertexParams;
				float4 temp_output_3_0_g76387 = temp_output_111_19_g76383;
				float4 ifLocalVar18_g76387 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76387 >= 0.5 )
				ifLocalVar18_g76387 = temp_output_17_0_g76387;
				else
				ifLocalVar18_g76387 = temp_output_3_0_g76387;
				float4 lerpResult22_g76387 = lerp( temp_output_3_0_g76387 , temp_output_17_0_g76387 , temp_output_19_0_g76387);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76387 = lerpResult22_g76387;
				#else
				float4 staticSwitch24_g76387 = ifLocalVar18_g76387;
				#endif
				half4 Global_Vertex_Params4173_g76351 = staticSwitch24_g76387;
				float4 break322_g76388 = Global_Vertex_Params4173_g76351;
				half Global_VertexSize174_g76351 = saturate( break322_g76388.w );
				float lerpResult346_g76351 = lerp( 1.0 , Global_VertexSize174_g76351 , _GlobalSize);
				float3 appendResult3480_g76351 = (float3(lerpResult346_g76351 , lerpResult346_g76351 , lerpResult346_g76351));
				half3 ObjectData20_g76416 = appendResult3480_g76351;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76416 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76416 = WorldData19_g76416;
				#else
				float3 staticSwitch14_g76416 = ObjectData20_g76416;
				#endif
				half3 Vertex_Size1741_g76351 = staticSwitch14_g76416;
				float temp_output_7_0_g76417 = _SizeFadeEndValue;
				float temp_output_10_0_g76417 = ( _SizeFadeStartValue - temp_output_7_0_g76417 );
				float temp_output_7453_0_g76351 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76351 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76417 ) / ( temp_output_10_0_g76417 + 0.0001 ) ) );
				float3 appendResult3482_g76351 = (float3(temp_output_7453_0_g76351 , temp_output_7453_0_g76351 , temp_output_7453_0_g76351));
				half3 ObjectData20_g76415 = appendResult3482_g76351;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76415 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76415 = WorldData19_g76415;
				#else
				float3 staticSwitch14_g76415 = ObjectData20_g76415;
				#endif
				float3 Vertex_SizeFade1740_g76351 = staticSwitch14_g76415;
				float3 lerpResult16_g76420 = lerp( VertexPosition3588_g76351 , ( ( ( Vertex_Motion7493_g76351 + Grass_Perspective2661_g76351 ) * Vertex_Size1741_g76351 * Vertex_SizeFade1740_g76351 ) + Mesh_PivotsOS2291_g76351 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76351 = lerpResult16_g76420;
				float3 Final_VertexPosition890_g76351 = ( temp_output_4912_0_g76351 + _DisableSRPBatcher );
				
				float4 break33_g76581 = _second_uvs_mode;
				float2 temp_output_30_0_g76581 = ( v.ase_texcoord.xy * break33_g76581.x );
				float2 appendResult21_g76576 = (float2(v.ase_texcoord1.z , v.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76351 = appendResult21_g76576;
				float2 temp_output_29_0_g76581 = ( Mesh_DetailCoord3_g76351 * break33_g76581.y );
				float2 temp_output_31_0_g76581 = ( (WorldPosition_Shifted7477_g76351).xz * break33_g76581.z );
				half2 Second_UVs_Tilling7609_g76351 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7610_g76351 = ( 1.0 / Second_UVs_Tilling7609_g76351 );
				float2 lerpResult7614_g76351 = lerp( Second_UVs_Tilling7609_g76351 , Second_UVs_Scale7610_g76351 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7605_g76351 = (_SecondUVs).zw;
				float2 vertexToFrag11_g76377 = ( ( ( temp_output_30_0_g76581 + temp_output_29_0_g76581 + temp_output_31_0_g76581 ) * lerpResult7614_g76351 ) + Second_UVs_Offset7605_g76351 );
				o.ase_texcoord4.xy = vertexToFrag11_g76377;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				o.ase_texcoord8.xyz = vertexToFrag3890_g76351;
				o.ase_texcoord9.xyz = vertexToFrag4224_g76351;
				
				o.ase_texcoord3 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;
				o.ase_texcoord9.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76351;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir(v.normalOS);

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
					positionCS.z = min(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#else
					positionCS.z = max(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float localCustomAlphaClip19_g76558 = ( 0.0 );
				half2 Main_UVs15_g76351 = ( ( IN.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76351 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76351 );
				half Main_Alpha316_g76351 = tex2DNode29_g76351.a;
				float2 vertexToFrag11_g76377 = IN.ase_texcoord4.xy;
				half2 Second_UVs17_g76351 = vertexToFrag11_g76377;
				float4 tex2DNode89_g76351 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76351 );
				half Second_Alpha5007_g76351 = tex2DNode89_g76351.a;
				float4 tex2DNode35_g76351 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				half Main_Mask57_g76351 = tex2DNode35_g76351.b;
				float4 tex2DNode33_g76351 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				half Second_Mask81_g76351 = tex2DNode33_g76351.b;
				float lerpResult6885_g76351 = lerp( Main_Mask57_g76351 , Second_Mask81_g76351 , _DetailMaskMode);
				float clampResult17_g76483 = clamp( lerpResult6885_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76482 = _DetailMaskMinValue;
				float temp_output_10_0_g76482 = ( _DetailMaskMaxValue - temp_output_7_0_g76482 );
				half Blend_Mask_Texture6794_g76351 = saturate( ( ( clampResult17_g76483 - temp_output_7_0_g76482 ) / ( temp_output_10_0_g76482 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76351 = IN.ase_color.b;
				half4 Normal_Packed45_g76559 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				float2 appendResult58_g76559 = (float2(( (Normal_Packed45_g76559).x * (Normal_Packed45_g76559).w ) , (Normal_Packed45_g76559).y));
				half2 Normal_Default50_g76559 = appendResult58_g76559;
				half2 Normal_ASTC41_g76559 = (Normal_Packed45_g76559).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76559 = Normal_ASTC41_g76559;
				#else
				float2 staticSwitch38_g76559 = Normal_Default50_g76559;
				#endif
				half2 Normal_NO_DTX544_g76559 = (Normal_Packed45_g76559).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76559 = Normal_NO_DTX544_g76559;
				#else
				float2 staticSwitch37_g76559 = staticSwitch38_g76559;
				#endif
				float2 temp_output_6555_0_g76351 = ( (staticSwitch37_g76559*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76351 = (float3(temp_output_6555_0_g76351 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g76351 = appendResult7388_g76351;
				float3 worldNormal7389_g76351 = float3(dot(tanToWorld0,tanNormal7389_g76351), dot(tanToWorld1,tanNormal7389_g76351), dot(tanToWorld2,tanNormal7389_g76351));
				half3 Main_NormalWS7390_g76351 = worldNormal7389_g76351;
				float lerpResult6884_g76351 = lerp( Mesh_DetailMask90_g76351 , ((Main_NormalWS7390_g76351).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76481 = clamp( lerpResult6884_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76480 = _DetailMeshMinValue;
				float temp_output_10_0_g76480 = ( _DetailMeshMaxValue - temp_output_7_0_g76480 );
				half Blend_Mask_Mesh1540_g76351 = saturate( ( ( clampResult17_g76481 - temp_output_7_0_g76480 ) / ( temp_output_10_0_g76480 + 0.0001 ) ) );
				float clampResult17_g76504 = clamp( ( Blend_Mask_Texture6794_g76351 * Blend_Mask_Mesh1540_g76351 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76552 = _DetailBlendMinValue;
				float temp_output_10_0_g76552 = ( _DetailBlendMaxValue - temp_output_7_0_g76552 );
				half Blend_Mask147_g76351 = ( saturate( ( ( clampResult17_g76504 - temp_output_7_0_g76552 ) / ( temp_output_10_0_g76552 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g76351 = lerp( Main_Alpha316_g76351 , Second_Alpha5007_g76351 , Blend_Mask147_g76351);
				float lerpResult6785_g76351 = lerp( ( Main_Alpha316_g76351 * Second_Alpha5007_g76351 ) , lerpResult6153_g76351 , _DetailAlphaMode);
				#ifdef TVE_DETAIL
				float staticSwitch6158_g76351 = lerpResult6785_g76351;
				#else
				float staticSwitch6158_g76351 = Main_Alpha316_g76351;
				#endif
				half Blend_Alpha6157_g76351 = staticSwitch6158_g76351;
				half AlphaTreshold2132_g76351 = _AlphaClipValue;
				float temp_output_84_0_g76367 = _LayerExtrasValue;
				float temp_output_19_0_g76371 = TVE_ExtrasUsage[(int)temp_output_84_0_g76367];
				float4 temp_output_93_19_g76367 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76351 = IN.ase_texcoord8.xyz;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 vertexToFrag4224_g76351 = IN.ase_texcoord9.xyz;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 lerpResult4827_g76351 = lerp( WorldPosition3905_g76351 , ObjectPosition4223_g76351 , _ExtrasPositionMode);
				half2 UV96_g76367 = ( (temp_output_93_19_g76367).zw + ( (temp_output_93_19_g76367).xy * (lerpResult4827_g76351).xz ) );
				float4 tex2DArrayNode48_g76367 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76367,temp_output_84_0_g76367, 0.0 );
				float4 temp_output_17_0_g76371 = tex2DArrayNode48_g76367;
				float4 temp_output_94_85_g76367 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76371 = temp_output_94_85_g76367;
				float4 ifLocalVar18_g76371 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76371 >= 0.5 )
				ifLocalVar18_g76371 = temp_output_17_0_g76371;
				else
				ifLocalVar18_g76371 = temp_output_3_0_g76371;
				float4 lerpResult22_g76371 = lerp( temp_output_3_0_g76371 , temp_output_17_0_g76371 , temp_output_19_0_g76371);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76371 = lerpResult22_g76371;
				#else
				float4 staticSwitch24_g76371 = ifLocalVar18_g76371;
				#endif
				half4 Global_Extras_Params5440_g76351 = staticSwitch24_g76371;
				float4 break456_g76381 = Global_Extras_Params5440_g76351;
				half Global_Extras_Alpha1033_g76351 = saturate( break456_g76381.w );
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = IN.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				float lerpResult5154_g76351 = lerp( 0.0 , Global_MeshVariation5104_g76351 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76351 = lerpResult5154_g76351;
				float Emissive_Alpha7625_g76351 = 0.0;
				float lerpResult6866_g76351 = lerp( ( 1.0 - Blend_Mask147_g76351 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_DETAIL
				float staticSwitch6612_g76351 = lerpResult6866_g76351;
				#else
				float staticSwitch6612_g76351 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76351 = staticSwitch6612_g76351;
				half Alpha_Mask6234_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5203_g76351 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76351 - saturate( ( Global_Alpha_Variation5158_g76351 + Emissive_Alpha7625_g76351 ) ) ) + ( Global_Extras_Alpha1033_g76351 * 0.1 ) ) ) , ( Alpha_Mask6234_g76351 * _GlobalAlpha ));
				float lerpResult16_g76395 = lerp( 1.0 , lerpResult5203_g76351 , TVE_IsEnabled);
				half Global_Alpha315_g76351 = lerpResult16_g76395;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 normalizeResult3971_g76351 = normalize( cross( ddy( WorldPosition ) , ddx( WorldPosition ) ) );
				float3 WorldNormal_Derivates3972_g76351 = normalizeResult3971_g76351;
				float dotResult3851_g76351 = dot( ViewDirection3963_g76351 , WorldNormal_Derivates3972_g76351 );
				float lerpResult3993_g76351 = lerp( 1.0 , saturate( ( abs( dotResult3851_g76351 ) * 3.0 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g76351 = lerpResult3993_g76351;
				half Fade_Effects_A5360_g76351 = Fade_Glancing3853_g76351;
				float temp_output_7_0_g76404 = TVE_CameraFadeMin;
				float temp_output_10_0_g76404 = ( TVE_CameraFadeMax - temp_output_7_0_g76404 );
				float lerpResult4755_g76351 = lerp( 1.0 , saturate( saturate( ( ( distance( WorldPosition , _WorldSpaceCameraPos ) - temp_output_7_0_g76404 ) / ( temp_output_10_0_g76404 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76351 = lerpResult4755_g76351;
				half Fade_Effects_B6228_g76351 = ( Fade_Effects_A5360_g76351 * Fade_Camera3743_g76351 );
				half Fade_Mask5149_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5141_g76351 = lerp( 1.0 , ( Fade_Effects_B6228_g76351 * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76351);
				half Fade_Effects_C7653_g76351 = lerpResult5141_g76351;
				float temp_output_5865_0_g76351 = saturate( ( Fade_Effects_C7653_g76351 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76351 ) ).r ) );
				half Fade_Alpha3727_g76351 = temp_output_5865_0_g76351;
				half Final_Alpha7344_g76351 = min( ( ( Blend_Alpha6157_g76351 - AlphaTreshold2132_g76351 ) * Global_Alpha315_g76351 ) , Fade_Alpha3727_g76351 );
				float temp_output_3_0_g76558 = Final_Alpha7344_g76351;
				float Alpha19_g76558 = temp_output_3_0_g76558;
				float temp_output_15_0_g76558 = 0.01;
				float Treshold19_g76558 = temp_output_15_0_g76558;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#else
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#endif
				}
				float clampResult17_g76560 = clamp( Main_Mask57_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76561 = _MainMaskMinValue;
				float temp_output_10_0_g76561 = ( _MainMaskMaxValue - temp_output_7_0_g76561 );
				half Main_Mask_Remap5765_g76351 = saturate( ( ( clampResult17_g76560 - temp_output_7_0_g76561 ) / ( temp_output_10_0_g76561 + 0.0001 ) ) );
				float lerpResult7671_g76351 = lerp( 1.0 , Main_Mask_Remap5765_g76351 , _MainColorMode);
				float4 lerpResult7654_g76351 = lerp( _MainColorTwo , _MainColor , lerpResult7671_g76351);
				half Main_Color_Alpha6121_g76351 = (lerpResult7654_g76351).a;
				float clampResult17_g76563 = clamp( Second_Mask81_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76564 = _SecondMaskMinValue;
				float temp_output_10_0_g76564 = ( _SecondMaskMaxValue - temp_output_7_0_g76564 );
				half Second_Mask_Remap6130_g76351 = saturate( ( ( clampResult17_g76563 - temp_output_7_0_g76564 ) / ( temp_output_10_0_g76564 + 0.0001 ) ) );
				float lerpResult7672_g76351 = lerp( 1.0 , Second_Mask_Remap6130_g76351 , _SecondColorMode);
				float4 lerpResult7662_g76351 = lerp( _SecondColorTwo , _SecondColor , lerpResult7672_g76351);
				half Second_Color_Alpha6152_g76351 = (lerpResult7662_g76351).a;
				float lerpResult6168_g76351 = lerp( Main_Color_Alpha6121_g76351 , Second_Color_Alpha6152_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6174_g76351 = lerpResult6168_g76351;
				#else
				float staticSwitch6174_g76351 = Main_Color_Alpha6121_g76351;
				#endif
				half Blend_Color_Alpha6167_g76351 = staticSwitch6174_g76351;
				half Final_Clip914_g76351 = saturate( ( Alpha19_g76558 * Blend_Color_Alpha6167_g76351 ) );
				

				float Alpha = Final_Clip914_g76351;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_color : COLOR;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SecondColor;
			half4 _MotionHighlightColor;
			half4 _SubsurfaceColor;
			half4 _NoiseMaskRemap;
			half4 _MainColorTwo;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColorTwo;
			half4 _MainUVs;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _DetailMeshRemap;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half4 _DetailMaskRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _RimLightRemap;
			half4 _MainColor;
			half3 _render_normals;
			half _SecondColorMode;
			half _DetailBlendMode;
			half _DetailMaskMode;
			half _DetailMaskMinValue;
			half _DetailMaskMaxValue;
			half _MainNormalValue;
			half _DetailMeshMode;
			half _DetailMeshMinValue;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _MainMaskMaxValue;
			half _SecondAlbedoValue;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			half _GlobalSize;
			half _SizeFadeEndValue;
			half _SizeFadeStartValue;
			half _MainAlbedoValue;
			half _MainMaskMinValue;
			half _DetailMeshMaxValue;
			half _MainColorMode;
			half _SecondUVsScaleMode;
			half _SecondMaskMinValue;
			half _DetailBlendMinValue;
			half _GradientMaxValue;
			half _DetailMode;
			half _SubsurfaceValue;
			half _SubsurfaceMaskValue;
			half _EmissiveTexMinValue;
			half _EmissiveTexMaxValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _FadeGlancingValue;
			half _SecondSmoothnessValue;
			half _DetailBlendMaxValue;
			half _VertexOcclusionOverlayMode;
			half _SecondNormalValue;
			half _DetailValue;
			half _GradientMinValue;
			half _MotionAmplitude_20;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _ColorsIntensityValue;
			half _OverlayProjectionValue;
			half _ColorsMaskValue;
			half _ColorsVariationValue;
			half _VertexOcclusionColorsMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _OverlayVariationValue;
			half _DetailNormalValue;
			half _SecondUVsMode;
			half _GlobalColors;
			half _MotionFacingValue;
			half _LayerMotionValue;
			half _MotionVariation_20;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _RenderDirect;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _Cutoff;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _IsVersion;
			half _HasEmissive;
			half _render_src;
			half _render_zw;
			half _render_dst;
			half _render_coverage;
			half _IsStandardShader;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageGlobalsVariation;
			half _IsTVEShader;
			half _HasOcclusion;
			half _IsIdentifier;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _VertexVariationMode;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MessageMotionVariation;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _MessageOcclusion;
			half _EmissiveMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_20;
			half _DetailMaskInvertMode;
			half _CategoryMotion;
			half _ColorsMaskMaxValue;
			half _RenderCoverage;
			half _MessageSubsurface;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderZWrite;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderClip;
			half _ColorsMaskMinValue;
			half _FadeConstantValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g76351 = v.positionOS.xyz;
				float3 appendResult60_g76361 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76351 = ( appendResult60_g76361 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76351 = Mesh_PivotsData2831_g76351;
				float3 temp_output_2283_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				half3 VertexPos40_g76486 = temp_output_2283_0_g76351;
				half3 VertexPos40_g76487 = VertexPos40_g76486;
				float3 appendResult74_g76487 = (float3(VertexPos40_g76487.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76487 = appendResult74_g76487;
				float3 break84_g76487 = VertexPos40_g76487;
				float3 appendResult81_g76487 = (float3(0.0 , break84_g76487.y , break84_g76487.z));
				half3 VertexPosOtherAxis82_g76487 = appendResult81_g76487;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g76351 = ase_worldPos;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 WorldPosition_Shifted7477_g76351 = ( WorldPosition3905_g76351 - TVE_WorldOrigin );
				float4x4 break19_g76407 = GetObjectToWorldMatrix();
				float3 appendResult20_g76407 = (float3(break19_g76407[ 0 ][ 3 ] , break19_g76407[ 1 ][ 3 ] , break19_g76407[ 2 ][ 3 ]));
				float3 temp_output_122_0_g76407 = Mesh_PivotsData2831_g76351;
				float3 PivotsOnly105_g76407 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76407 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g76409 = ( appendResult20_g76407 + PivotsOnly105_g76407 );
				half3 WorldData19_g76409 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76409 = WorldData19_g76409;
				#else
				float3 staticSwitch14_g76409 = ObjectData20_g76409;
				#endif
				float3 temp_output_114_0_g76407 = staticSwitch14_g76409;
				float3 vertexToFrag4224_g76351 = temp_output_114_0_g76407;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				float3 lerpResult6766_g76351 = lerp( WorldPosition_Shifted7477_g76351 , ObjectPosition_Shifted7481_g76351 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76351 = lerpResult6766_g76351;
				half3 Input_Position419_g76527 = Motion_10_Position6738_g76351;
				float Input_MotionScale287_g76527 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76527 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76527 = (( Input_Position419_g76527 * Input_MotionScale287_g76527 * NoiseTex_Tilling735_g76527 * 0.0075 )).xz;
				float2 temp_output_447_0_g76356 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76351 = temp_output_447_0_g76356;
				half2 Input_DirectionWS423_g76527 = Global_Wind_DirectionWS4683_g76351;
				float lerpResult128_g76528 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76527 = _MotionSpeed_10;
				half Input_MotionVariation284_g76527 = _MotionVariation_10;
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = v.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				half Input_GlobalMeshVariation569_g76527 = Global_MeshVariation5104_g76351;
				float temp_output_630_0_g76527 = ( ( ( lerpResult128_g76528 * Input_MotionSpeed62_g76527 ) + ( Input_MotionVariation284_g76527 * Input_GlobalMeshVariation569_g76527 ) ) * 0.03 );
				float temp_output_607_0_g76527 = frac( temp_output_630_0_g76527 );
				float4 lerpResult590_g76527 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * temp_output_607_0_g76527 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * frac( ( temp_output_630_0_g76527 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76527 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76527 = lerpResult590_g76527;
				float2 temp_output_645_0_g76527 = ((Noise_Complex703_g76527).rg*2.0 + -1.0);
				float2 break650_g76527 = temp_output_645_0_g76527;
				float3 appendResult649_g76527 = (float3(break650_g76527.x , 0.0 , break650_g76527.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76527 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76510 = Global_Noise_OS5548_g76351;
				float2 break448_g76356 = temp_output_447_0_g76356;
				float3 appendResult452_g76356 = (float3(break448_g76356.x , 0.0 , break448_g76356.y));
				half2 Global_Wind_DirectionOS5692_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76510 = Global_Wind_DirectionOS5692_g76351;
				float temp_output_84_0_g76362 = _LayerMotionValue;
				float temp_output_19_0_g76366 = TVE_MotionUsage[(int)temp_output_84_0_g76362];
				float4 temp_output_91_19_g76362 = TVE_MotionCoords;
				half2 UV94_g76362 = ( (temp_output_91_19_g76362).zw + ( (temp_output_91_19_g76362).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76362 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76362,temp_output_84_0_g76362, 0.0 );
				float4 temp_output_17_0_g76366 = tex2DArrayNode50_g76362;
				float4 temp_output_112_19_g76362 = TVE_MotionParams;
				float4 temp_output_3_0_g76366 = temp_output_112_19_g76362;
				float4 ifLocalVar18_g76366 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76366 >= 0.5 )
				ifLocalVar18_g76366 = temp_output_17_0_g76366;
				else
				ifLocalVar18_g76366 = temp_output_3_0_g76366;
				float4 lerpResult22_g76366 = lerp( temp_output_3_0_g76366 , temp_output_17_0_g76366 , temp_output_19_0_g76366);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76366 = lerpResult22_g76366;
				#else
				float4 staticSwitch24_g76366 = ifLocalVar18_g76366;
				#endif
				half4 Global_Motion_Params3909_g76351 = staticSwitch24_g76366;
				float4 break322_g76356 = Global_Motion_Params3909_g76351;
				float lerpResult457_g76356 = lerp( break322_g76356.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76356 = ( 1.0 - lerpResult457_g76356 );
				half Global_Wind_Power2223_g76351 = ( 1.0 - ( temp_output_459_0_g76356 * temp_output_459_0_g76356 ) );
				half Input_WindPower449_g76510 = Global_Wind_Power2223_g76351;
				float2 lerpResult516_g76510 = lerp( Input_Noise_DirectionOS487_g76510 , Input_Wind_DirectionOS458_g76510 , ( Input_WindPower449_g76510 * 0.6 ));
				half Mesh_Motion_107572_g76351 = v.ase_color.a;
				half Input_MeshHeight388_g76510 = Mesh_Motion_107572_g76351;
				half ObjectData20_g76511 = Input_MeshHeight388_g76510;
				float enc62_g76576 = v.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76576 = DecodeFloatToVector2( enc62_g76576 );
				float2 break63_g76576 = ( localDecodeFloatToVector262_g76576 * 100.0 );
				float Bounds_Height5230_g76351 = break63_g76576.x;
				half Input_BoundsHeight390_g76510 = Bounds_Height5230_g76351;
				half WorldData19_g76511 = ( Input_MeshHeight388_g76510 * Input_MeshHeight388_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76511 = WorldData19_g76511;
				#else
				float staticSwitch14_g76511 = ObjectData20_g76511;
				#endif
				half Final_Motion10_Mask321_g76510 = ( staticSwitch14_g76511 * 2.0 );
				half Input_BendingAmplitude376_g76510 = _MotionAmplitude_10;
				half Global_MotionValue640_g76510 = TVE_MotionValue_10;
				half2 Final_Bending631_g76510 = ( lerpResult516_g76510 * ( Final_Motion10_Mask321_g76510 * Input_BendingAmplitude376_g76510 * Input_WindPower449_g76510 * Input_WindPower449_g76510 * Global_MotionValue640_g76510 ) );
				float2 appendResult433_g76356 = (float2(break322_g76356.x , break322_g76356.y));
				float2 temp_output_436_0_g76356 = (appendResult433_g76356*2.0 + -1.0);
				float2 break441_g76356 = temp_output_436_0_g76356;
				float3 appendResult440_g76356 = (float3(break441_g76356.x , 0.0 , break441_g76356.y));
				half2 Global_React_DirectionOS39_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76510 = Global_React_DirectionOS39_g76351;
				float clampResult17_g76513 = clamp( Input_MeshHeight388_g76510 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76512 = 0.0;
				half Input_InteractionUseMask62_g76510 = _InteractionMaskValue;
				float temp_output_10_0_g76512 = ( Input_InteractionUseMask62_g76510 - temp_output_7_0_g76512 );
				half Final_InteractionRemap594_g76510 = saturate( ( ( clampResult17_g76513 - temp_output_7_0_g76512 ) / ( temp_output_10_0_g76512 + 0.0001 ) ) );
				half ObjectData20_g76514 = Final_InteractionRemap594_g76510;
				half WorldData19_g76514 = ( Final_InteractionRemap594_g76510 * Final_InteractionRemap594_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76514 = WorldData19_g76514;
				#else
				float staticSwitch14_g76514 = ObjectData20_g76514;
				#endif
				half Final_InteractionMask373_g76510 = ( staticSwitch14_g76514 * 2.0 );
				half Input_InteractionAmplitude58_g76510 = _InteractionAmplitude;
				half2 Final_Interaction632_g76510 = ( Input_React_DirectionOS358_g76510 * Final_InteractionMask373_g76510 * Input_InteractionAmplitude58_g76510 );
				half Global_Interaction_Mask66_g76351 = ( break322_g76356.w * break322_g76356.w * break322_g76356.w * break322_g76356.w );
				float Input_InteractionGlobalMask330_g76510 = Global_Interaction_Mask66_g76351;
				half Final_InteractionValue525_g76510 = saturate( ( Input_InteractionAmplitude58_g76510 * Input_InteractionGlobalMask330_g76510 ) );
				float2 lerpResult551_g76510 = lerp( Final_Bending631_g76510 , Final_Interaction632_g76510 , Final_InteractionValue525_g76510);
				float2 break364_g76510 = lerpResult551_g76510;
				float3 appendResult638_g76510 = (float3(break364_g76510.x , 0.0 , break364_g76510.y));
				half3 Motion_10_Interaction7519_g76351 = appendResult638_g76510;
				half3 Angle44_g76486 = Motion_10_Interaction7519_g76351;
				half Angle44_g76487 = (Angle44_g76486).z;
				half3 VertexPos40_g76488 = ( VertexPosRotationAxis50_g76487 + ( VertexPosOtherAxis82_g76487 * cos( Angle44_g76487 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76487 ) * sin( Angle44_g76487 ) ) );
				float3 appendResult74_g76488 = (float3(0.0 , 0.0 , VertexPos40_g76488.z));
				half3 VertexPosRotationAxis50_g76488 = appendResult74_g76488;
				float3 break84_g76488 = VertexPos40_g76488;
				float3 appendResult81_g76488 = (float3(break84_g76488.x , break84_g76488.y , 0.0));
				half3 VertexPosOtherAxis82_g76488 = appendResult81_g76488;
				half Angle44_g76488 = -(Angle44_g76486).x;
				half3 Input_Position419_g76566 = WorldPosition_Shifted7477_g76351;
				float3 break459_g76566 = Input_Position419_g76566;
				float Sum_Position446_g76566 = ( break459_g76566.x + break459_g76566.y + break459_g76566.z );
				half Input_MotionScale321_g76566 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76566 = _MotionVariation_20;
				half Input_GlobalVariation400_g76566 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76567 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76566 = _MotionSpeed_20;
				float temp_output_404_0_g76566 = ( lerpResult128_g76567 * Input_MotionSpeed62_g76566 );
				half Motion_SineA450_g76566 = sin( ( ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) + ( Input_MotionVariation330_g76566 * Input_GlobalVariation400_g76566 ) + temp_output_404_0_g76566 ) );
				half Motion_SineB395_g76566 = sin( ( ( temp_output_404_0_g76566 * 0.6842 ) + ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) ) );
				half3 Input_Position419_g76585 = VertexPosition3588_g76351;
				float3 normalizeResult518_g76585 = normalize( Input_Position419_g76585 );
				half2 Input_DirectionOS423_g76585 = Global_React_DirectionOS39_g76351;
				float2 break521_g76585 = -Input_DirectionOS423_g76585;
				float3 appendResult522_g76585 = (float3(break521_g76585.x , 0.0 , break521_g76585.y));
				float dotResult519_g76585 = dot( normalizeResult518_g76585 , appendResult522_g76585 );
				half Input_Value62_g76585 = _MotionFacingValue;
				float lerpResult524_g76585 = lerp( 1.0 , (dotResult519_g76585*0.5 + 0.5) , Input_Value62_g76585);
				half ObjectData20_g76586 = max( lerpResult524_g76585 , 0.001 );
				half WorldData19_g76586 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76586 = WorldData19_g76586;
				#else
				float staticSwitch14_g76586 = ObjectData20_g76586;
				#endif
				half Motion_FacingMask5214_g76351 = staticSwitch14_g76586;
				half Motion_20_Amplitude4381_g76351 = Motion_FacingMask5214_g76351;
				half Input_MotionAmplitude384_g76566 = Motion_20_Amplitude4381_g76351;
				half Input_GlobalWind407_g76566 = Global_Wind_Power2223_g76351;
				float4 break638_g76527 = abs( Noise_Complex703_g76527 );
				half Global_Noise_B5526_g76351 = break638_g76527.b;
				half Input_GlobalNoise411_g76566 = Global_Noise_B5526_g76351;
				float lerpResult413_g76566 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76566);
				half Motion_Amplitude418_g76566 = ( Input_MotionAmplitude384_g76566 * Input_GlobalWind407_g76566 * pow( Input_GlobalNoise411_g76566 , lerpResult413_g76566 ) );
				half Input_Squash58_g76566 = _MotionAmplitude_20;
				float enc59_g76576 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76576 = DecodeFloatToVector2( enc59_g76576 );
				float2 break61_g76576 = localDecodeFloatToVector259_g76576;
				half Mesh_Motion_2060_g76351 = break61_g76576.x;
				half Input_MeshMotion_20388_g76566 = Mesh_Motion_2060_g76351;
				float Bounds_Radius5231_g76351 = break63_g76576.y;
				half Input_BoundsRadius390_g76566 = Bounds_Radius5231_g76351;
				half Global_MotionValue462_g76566 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76566 = Global_React_DirectionOS39_g76351;
				float2 break371_g76566 = Input_DirectionOS366_g76566;
				float3 appendResult372_g76566 = (float3(break371_g76566.x , ( Motion_SineA450_g76566 * 0.3 ) , break371_g76566.y));
				half3 Motion_20_Squash4418_g76351 = ( ( (max( Motion_SineA450_g76566 , Motion_SineB395_g76566 )*0.5 + 0.5) * Motion_Amplitude418_g76566 * Input_Squash58_g76566 * Input_MeshMotion_20388_g76566 * Input_BoundsRadius390_g76566 * Global_MotionValue462_g76566 ) * appendResult372_g76566 );
				half3 VertexPos40_g76472 = ( ( VertexPosRotationAxis50_g76488 + ( VertexPosOtherAxis82_g76488 * cos( Angle44_g76488 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76488 ) * sin( Angle44_g76488 ) ) ) + Motion_20_Squash4418_g76351 );
				float3 appendResult74_g76472 = (float3(0.0 , VertexPos40_g76472.y , 0.0));
				float3 VertexPosRotationAxis50_g76472 = appendResult74_g76472;
				float3 break84_g76472 = VertexPos40_g76472;
				float3 appendResult81_g76472 = (float3(break84_g76472.x , 0.0 , break84_g76472.z));
				float3 VertexPosOtherAxis82_g76472 = appendResult81_g76472;
				half Input_Rolling379_g76566 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76351 = ( Motion_SineA450_g76566 * Motion_Amplitude418_g76566 * Input_Rolling379_g76566 * Input_MeshMotion_20388_g76566 * Global_MotionValue462_g76566 );
				half Angle44_g76472 = Motion_20_Rolling5257_g76351;
				half3 Input_Position500_g76523 = WorldPosition_Shifted7477_g76351;
				half Input_MotionScale321_g76523 = _MotionScale_32;
				half Input_MotionVariation330_g76523 = _MotionVariation_32;
				half Input_GlobalVariation372_g76523 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76524 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76523 = _MotionSpeed_32;
				float4 tex2DNode460_g76523 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76523).xz * Input_MotionScale321_g76523 * 0.03 ) + ( Input_MotionVariation330_g76523 * Input_GlobalVariation372_g76523 ) + ( lerpResult128_g76524 * Input_MotionSpeed62_g76523 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76523 = (float3(tex2DNode460_g76523.r , tex2DNode460_g76523.g , tex2DNode460_g76523.b));
				half3 Flutter_Texture489_g76523 = (appendResult462_g76523*2.0 + -1.0);
				float temp_output_7_0_g76401 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76401 = ( TVE_MotionFadeStart - temp_output_7_0_g76401 );
				half Motion_FadeOut4005_g76351 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76401 ) / ( temp_output_10_0_g76401 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76351 = ( _MotionAmplitude_32 * Motion_FacingMask5214_g76351 * Motion_FadeOut4005_g76351 );
				half Input_MotionAmplitude58_g76523 = Motion_30_Amplitude4960_g76351;
				half Mesh_Motion_30144_g76351 = break61_g76576.y;
				half Input_MeshMotion_30374_g76523 = Mesh_Motion_30144_g76351;
				half Input_GlobalWind471_g76523 = Global_Wind_Power2223_g76351;
				half Global_MotionValue503_g76523 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g76523 = Global_Noise_B5526_g76351;
				float lerpResult466_g76523 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76523);
				half Flutter_Amplitude491_g76523 = ( Input_MotionAmplitude58_g76523 * Input_MeshMotion_30374_g76523 * Input_GlobalWind471_g76523 * Global_MotionValue503_g76523 * pow( Input_GlobalNoise472_g76523 , lerpResult466_g76523 ) );
				half3 Motion_30_Flutter263_g76351 = ( Flutter_Texture489_g76523 * Flutter_Amplitude491_g76523 );
				float3 Vertex_Motion_Object833_g76351 = ( ( VertexPosRotationAxis50_g76472 + ( VertexPosOtherAxis82_g76472 * cos( Angle44_g76472 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76472 ) * sin( Angle44_g76472 ) ) ) + Motion_30_Flutter263_g76351 );
				half3 ObjectData20_g76419 = Vertex_Motion_Object833_g76351;
				float3 temp_output_3474_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				float3 Vertex_Motion_World1118_g76351 = ( ( ( temp_output_3474_0_g76351 + Motion_10_Interaction7519_g76351 ) + Motion_20_Squash4418_g76351 ) + Motion_30_Flutter263_g76351 );
				half3 WorldData19_g76419 = Vertex_Motion_World1118_g76351;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76419 = WorldData19_g76419;
				#else
				float3 staticSwitch14_g76419 = ObjectData20_g76419;
				#endif
				float3 temp_output_7495_0_g76351 = staticSwitch14_g76419;
				float3 Vertex_Motion7493_g76351 = temp_output_7495_0_g76351;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 break2709_g76351 = cross( ViewDirection3963_g76351 , half3(0,1,0) );
				float3 appendResult2710_g76351 = (float3(-break2709_g76351.z , 0.0 , break2709_g76351.x));
				float3 appendResult2667_g76351 = (float3(Global_MeshVariation5104_g76351 , 0.5 , Global_MeshVariation5104_g76351));
				half Mesh_Height1524_g76351 = v.ase_color.a;
				float dotResult2212_g76351 = dot( ViewDirection3963_g76351 , float3(0,1,0) );
				half Mask_HView2656_g76351 = dotResult2212_g76351;
				float saferPower2652_g76351 = abs( Mask_HView2656_g76351 );
				half3 Grass_Perspective2661_g76351 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76351 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76351*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76351 * pow( saferPower2652_g76351 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76383 = _LayerVertexValue;
				float temp_output_19_0_g76387 = TVE_VertexUsage[(int)temp_output_84_0_g76383];
				float4 temp_output_94_19_g76383 = TVE_VertexCoords;
				half2 UV97_g76383 = ( (temp_output_94_19_g76383).zw + ( (temp_output_94_19_g76383).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76383 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76383,temp_output_84_0_g76383, 0.0 );
				float4 temp_output_17_0_g76387 = tex2DArrayNode50_g76383;
				float4 temp_output_111_19_g76383 = TVE_VertexParams;
				float4 temp_output_3_0_g76387 = temp_output_111_19_g76383;
				float4 ifLocalVar18_g76387 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76387 >= 0.5 )
				ifLocalVar18_g76387 = temp_output_17_0_g76387;
				else
				ifLocalVar18_g76387 = temp_output_3_0_g76387;
				float4 lerpResult22_g76387 = lerp( temp_output_3_0_g76387 , temp_output_17_0_g76387 , temp_output_19_0_g76387);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76387 = lerpResult22_g76387;
				#else
				float4 staticSwitch24_g76387 = ifLocalVar18_g76387;
				#endif
				half4 Global_Vertex_Params4173_g76351 = staticSwitch24_g76387;
				float4 break322_g76388 = Global_Vertex_Params4173_g76351;
				half Global_VertexSize174_g76351 = saturate( break322_g76388.w );
				float lerpResult346_g76351 = lerp( 1.0 , Global_VertexSize174_g76351 , _GlobalSize);
				float3 appendResult3480_g76351 = (float3(lerpResult346_g76351 , lerpResult346_g76351 , lerpResult346_g76351));
				half3 ObjectData20_g76416 = appendResult3480_g76351;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76416 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76416 = WorldData19_g76416;
				#else
				float3 staticSwitch14_g76416 = ObjectData20_g76416;
				#endif
				half3 Vertex_Size1741_g76351 = staticSwitch14_g76416;
				float temp_output_7_0_g76417 = _SizeFadeEndValue;
				float temp_output_10_0_g76417 = ( _SizeFadeStartValue - temp_output_7_0_g76417 );
				float temp_output_7453_0_g76351 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76351 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76417 ) / ( temp_output_10_0_g76417 + 0.0001 ) ) );
				float3 appendResult3482_g76351 = (float3(temp_output_7453_0_g76351 , temp_output_7453_0_g76351 , temp_output_7453_0_g76351));
				half3 ObjectData20_g76415 = appendResult3482_g76351;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76415 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76415 = WorldData19_g76415;
				#else
				float3 staticSwitch14_g76415 = ObjectData20_g76415;
				#endif
				float3 Vertex_SizeFade1740_g76351 = staticSwitch14_g76415;
				float3 lerpResult16_g76420 = lerp( VertexPosition3588_g76351 , ( ( ( Vertex_Motion7493_g76351 + Grass_Perspective2661_g76351 ) * Vertex_Size1741_g76351 * Vertex_SizeFade1740_g76351 ) + Mesh_PivotsOS2291_g76351 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76351 = lerpResult16_g76420;
				float3 Final_VertexPosition890_g76351 = ( temp_output_4912_0_g76351 + _DisableSRPBatcher );
				
				float4 break33_g76581 = _second_uvs_mode;
				float2 temp_output_30_0_g76581 = ( v.ase_texcoord.xy * break33_g76581.x );
				float2 appendResult21_g76576 = (float2(v.ase_texcoord1.z , v.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76351 = appendResult21_g76576;
				float2 temp_output_29_0_g76581 = ( Mesh_DetailCoord3_g76351 * break33_g76581.y );
				float2 temp_output_31_0_g76581 = ( (WorldPosition_Shifted7477_g76351).xz * break33_g76581.z );
				half2 Second_UVs_Tilling7609_g76351 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7610_g76351 = ( 1.0 / Second_UVs_Tilling7609_g76351 );
				float2 lerpResult7614_g76351 = lerp( Second_UVs_Tilling7609_g76351 , Second_UVs_Scale7610_g76351 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7605_g76351 = (_SecondUVs).zw;
				float2 vertexToFrag11_g76377 = ( ( ( temp_output_30_0_g76581 + temp_output_29_0_g76581 + temp_output_31_0_g76581 ) * lerpResult7614_g76351 ) + Second_UVs_Offset7605_g76351 );
				o.ase_texcoord4.xy = vertexToFrag11_g76377;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				o.ase_texcoord8.xyz = vertexToFrag3890_g76351;
				o.ase_texcoord9.xyz = vertexToFrag4224_g76351;
				
				o.ase_texcoord3 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;
				o.ase_texcoord9.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76351;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float localCustomAlphaClip19_g76558 = ( 0.0 );
				half2 Main_UVs15_g76351 = ( ( IN.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76351 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76351 );
				half Main_Alpha316_g76351 = tex2DNode29_g76351.a;
				float2 vertexToFrag11_g76377 = IN.ase_texcoord4.xy;
				half2 Second_UVs17_g76351 = vertexToFrag11_g76377;
				float4 tex2DNode89_g76351 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76351 );
				half Second_Alpha5007_g76351 = tex2DNode89_g76351.a;
				float4 tex2DNode35_g76351 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				half Main_Mask57_g76351 = tex2DNode35_g76351.b;
				float4 tex2DNode33_g76351 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				half Second_Mask81_g76351 = tex2DNode33_g76351.b;
				float lerpResult6885_g76351 = lerp( Main_Mask57_g76351 , Second_Mask81_g76351 , _DetailMaskMode);
				float clampResult17_g76483 = clamp( lerpResult6885_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76482 = _DetailMaskMinValue;
				float temp_output_10_0_g76482 = ( _DetailMaskMaxValue - temp_output_7_0_g76482 );
				half Blend_Mask_Texture6794_g76351 = saturate( ( ( clampResult17_g76483 - temp_output_7_0_g76482 ) / ( temp_output_10_0_g76482 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76351 = IN.ase_color.b;
				half4 Normal_Packed45_g76559 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				float2 appendResult58_g76559 = (float2(( (Normal_Packed45_g76559).x * (Normal_Packed45_g76559).w ) , (Normal_Packed45_g76559).y));
				half2 Normal_Default50_g76559 = appendResult58_g76559;
				half2 Normal_ASTC41_g76559 = (Normal_Packed45_g76559).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76559 = Normal_ASTC41_g76559;
				#else
				float2 staticSwitch38_g76559 = Normal_Default50_g76559;
				#endif
				half2 Normal_NO_DTX544_g76559 = (Normal_Packed45_g76559).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76559 = Normal_NO_DTX544_g76559;
				#else
				float2 staticSwitch37_g76559 = staticSwitch38_g76559;
				#endif
				float2 temp_output_6555_0_g76351 = ( (staticSwitch37_g76559*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76351 = (float3(temp_output_6555_0_g76351 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g76351 = appendResult7388_g76351;
				float3 worldNormal7389_g76351 = float3(dot(tanToWorld0,tanNormal7389_g76351), dot(tanToWorld1,tanNormal7389_g76351), dot(tanToWorld2,tanNormal7389_g76351));
				half3 Main_NormalWS7390_g76351 = worldNormal7389_g76351;
				float lerpResult6884_g76351 = lerp( Mesh_DetailMask90_g76351 , ((Main_NormalWS7390_g76351).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76481 = clamp( lerpResult6884_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76480 = _DetailMeshMinValue;
				float temp_output_10_0_g76480 = ( _DetailMeshMaxValue - temp_output_7_0_g76480 );
				half Blend_Mask_Mesh1540_g76351 = saturate( ( ( clampResult17_g76481 - temp_output_7_0_g76480 ) / ( temp_output_10_0_g76480 + 0.0001 ) ) );
				float clampResult17_g76504 = clamp( ( Blend_Mask_Texture6794_g76351 * Blend_Mask_Mesh1540_g76351 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76552 = _DetailBlendMinValue;
				float temp_output_10_0_g76552 = ( _DetailBlendMaxValue - temp_output_7_0_g76552 );
				half Blend_Mask147_g76351 = ( saturate( ( ( clampResult17_g76504 - temp_output_7_0_g76552 ) / ( temp_output_10_0_g76552 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g76351 = lerp( Main_Alpha316_g76351 , Second_Alpha5007_g76351 , Blend_Mask147_g76351);
				float lerpResult6785_g76351 = lerp( ( Main_Alpha316_g76351 * Second_Alpha5007_g76351 ) , lerpResult6153_g76351 , _DetailAlphaMode);
				#ifdef TVE_DETAIL
				float staticSwitch6158_g76351 = lerpResult6785_g76351;
				#else
				float staticSwitch6158_g76351 = Main_Alpha316_g76351;
				#endif
				half Blend_Alpha6157_g76351 = staticSwitch6158_g76351;
				half AlphaTreshold2132_g76351 = _AlphaClipValue;
				float temp_output_84_0_g76367 = _LayerExtrasValue;
				float temp_output_19_0_g76371 = TVE_ExtrasUsage[(int)temp_output_84_0_g76367];
				float4 temp_output_93_19_g76367 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76351 = IN.ase_texcoord8.xyz;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 vertexToFrag4224_g76351 = IN.ase_texcoord9.xyz;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 lerpResult4827_g76351 = lerp( WorldPosition3905_g76351 , ObjectPosition4223_g76351 , _ExtrasPositionMode);
				half2 UV96_g76367 = ( (temp_output_93_19_g76367).zw + ( (temp_output_93_19_g76367).xy * (lerpResult4827_g76351).xz ) );
				float4 tex2DArrayNode48_g76367 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76367,temp_output_84_0_g76367, 0.0 );
				float4 temp_output_17_0_g76371 = tex2DArrayNode48_g76367;
				float4 temp_output_94_85_g76367 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76371 = temp_output_94_85_g76367;
				float4 ifLocalVar18_g76371 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76371 >= 0.5 )
				ifLocalVar18_g76371 = temp_output_17_0_g76371;
				else
				ifLocalVar18_g76371 = temp_output_3_0_g76371;
				float4 lerpResult22_g76371 = lerp( temp_output_3_0_g76371 , temp_output_17_0_g76371 , temp_output_19_0_g76371);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76371 = lerpResult22_g76371;
				#else
				float4 staticSwitch24_g76371 = ifLocalVar18_g76371;
				#endif
				half4 Global_Extras_Params5440_g76351 = staticSwitch24_g76371;
				float4 break456_g76381 = Global_Extras_Params5440_g76351;
				half Global_Extras_Alpha1033_g76351 = saturate( break456_g76381.w );
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = IN.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				float lerpResult5154_g76351 = lerp( 0.0 , Global_MeshVariation5104_g76351 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76351 = lerpResult5154_g76351;
				float Emissive_Alpha7625_g76351 = 0.0;
				float lerpResult6866_g76351 = lerp( ( 1.0 - Blend_Mask147_g76351 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_DETAIL
				float staticSwitch6612_g76351 = lerpResult6866_g76351;
				#else
				float staticSwitch6612_g76351 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76351 = staticSwitch6612_g76351;
				half Alpha_Mask6234_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5203_g76351 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76351 - saturate( ( Global_Alpha_Variation5158_g76351 + Emissive_Alpha7625_g76351 ) ) ) + ( Global_Extras_Alpha1033_g76351 * 0.1 ) ) ) , ( Alpha_Mask6234_g76351 * _GlobalAlpha ));
				float lerpResult16_g76395 = lerp( 1.0 , lerpResult5203_g76351 , TVE_IsEnabled);
				half Global_Alpha315_g76351 = lerpResult16_g76395;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 normalizeResult3971_g76351 = normalize( cross( ddy( WorldPosition ) , ddx( WorldPosition ) ) );
				float3 WorldNormal_Derivates3972_g76351 = normalizeResult3971_g76351;
				float dotResult3851_g76351 = dot( ViewDirection3963_g76351 , WorldNormal_Derivates3972_g76351 );
				float lerpResult3993_g76351 = lerp( 1.0 , saturate( ( abs( dotResult3851_g76351 ) * 3.0 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g76351 = lerpResult3993_g76351;
				half Fade_Effects_A5360_g76351 = Fade_Glancing3853_g76351;
				float temp_output_7_0_g76404 = TVE_CameraFadeMin;
				float temp_output_10_0_g76404 = ( TVE_CameraFadeMax - temp_output_7_0_g76404 );
				float lerpResult4755_g76351 = lerp( 1.0 , saturate( saturate( ( ( distance( WorldPosition , _WorldSpaceCameraPos ) - temp_output_7_0_g76404 ) / ( temp_output_10_0_g76404 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76351 = lerpResult4755_g76351;
				half Fade_Effects_B6228_g76351 = ( Fade_Effects_A5360_g76351 * Fade_Camera3743_g76351 );
				half Fade_Mask5149_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5141_g76351 = lerp( 1.0 , ( Fade_Effects_B6228_g76351 * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76351);
				half Fade_Effects_C7653_g76351 = lerpResult5141_g76351;
				float temp_output_5865_0_g76351 = saturate( ( Fade_Effects_C7653_g76351 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76351 ) ).r ) );
				half Fade_Alpha3727_g76351 = temp_output_5865_0_g76351;
				half Final_Alpha7344_g76351 = min( ( ( Blend_Alpha6157_g76351 - AlphaTreshold2132_g76351 ) * Global_Alpha315_g76351 ) , Fade_Alpha3727_g76351 );
				float temp_output_3_0_g76558 = Final_Alpha7344_g76351;
				float Alpha19_g76558 = temp_output_3_0_g76558;
				float temp_output_15_0_g76558 = 0.01;
				float Treshold19_g76558 = temp_output_15_0_g76558;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#else
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#endif
				}
				float clampResult17_g76560 = clamp( Main_Mask57_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76561 = _MainMaskMinValue;
				float temp_output_10_0_g76561 = ( _MainMaskMaxValue - temp_output_7_0_g76561 );
				half Main_Mask_Remap5765_g76351 = saturate( ( ( clampResult17_g76560 - temp_output_7_0_g76561 ) / ( temp_output_10_0_g76561 + 0.0001 ) ) );
				float lerpResult7671_g76351 = lerp( 1.0 , Main_Mask_Remap5765_g76351 , _MainColorMode);
				float4 lerpResult7654_g76351 = lerp( _MainColorTwo , _MainColor , lerpResult7671_g76351);
				half Main_Color_Alpha6121_g76351 = (lerpResult7654_g76351).a;
				float clampResult17_g76563 = clamp( Second_Mask81_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76564 = _SecondMaskMinValue;
				float temp_output_10_0_g76564 = ( _SecondMaskMaxValue - temp_output_7_0_g76564 );
				half Second_Mask_Remap6130_g76351 = saturate( ( ( clampResult17_g76563 - temp_output_7_0_g76564 ) / ( temp_output_10_0_g76564 + 0.0001 ) ) );
				float lerpResult7672_g76351 = lerp( 1.0 , Second_Mask_Remap6130_g76351 , _SecondColorMode);
				float4 lerpResult7662_g76351 = lerp( _SecondColorTwo , _SecondColor , lerpResult7672_g76351);
				half Second_Color_Alpha6152_g76351 = (lerpResult7662_g76351).a;
				float lerpResult6168_g76351 = lerp( Main_Color_Alpha6121_g76351 , Second_Color_Alpha6152_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6174_g76351 = lerpResult6168_g76351;
				#else
				float staticSwitch6174_g76351 = Main_Color_Alpha6121_g76351;
				#endif
				half Blend_Color_Alpha6167_g76351 = staticSwitch6174_g76351;
				half Final_Clip914_g76351 = saturate( ( Alpha19_g76558 * Blend_Color_Alpha6167_g76351 ) );
				

				float Alpha = Final_Clip914_g76351;
				float AlphaClipThreshold = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma shader_feature EDITOR_VISUALIZATION

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_DETAIL
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SecondColor;
			half4 _MotionHighlightColor;
			half4 _SubsurfaceColor;
			half4 _NoiseMaskRemap;
			half4 _MainColorTwo;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColorTwo;
			half4 _MainUVs;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _DetailMeshRemap;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half4 _DetailMaskRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _RimLightRemap;
			half4 _MainColor;
			half3 _render_normals;
			half _SecondColorMode;
			half _DetailBlendMode;
			half _DetailMaskMode;
			half _DetailMaskMinValue;
			half _DetailMaskMaxValue;
			half _MainNormalValue;
			half _DetailMeshMode;
			half _DetailMeshMinValue;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _MainMaskMaxValue;
			half _SecondAlbedoValue;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			half _GlobalSize;
			half _SizeFadeEndValue;
			half _SizeFadeStartValue;
			half _MainAlbedoValue;
			half _MainMaskMinValue;
			half _DetailMeshMaxValue;
			half _MainColorMode;
			half _SecondUVsScaleMode;
			half _SecondMaskMinValue;
			half _DetailBlendMinValue;
			half _GradientMaxValue;
			half _DetailMode;
			half _SubsurfaceValue;
			half _SubsurfaceMaskValue;
			half _EmissiveTexMinValue;
			half _EmissiveTexMaxValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _FadeGlancingValue;
			half _SecondSmoothnessValue;
			half _DetailBlendMaxValue;
			half _VertexOcclusionOverlayMode;
			half _SecondNormalValue;
			half _DetailValue;
			half _GradientMinValue;
			half _MotionAmplitude_20;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _ColorsIntensityValue;
			half _OverlayProjectionValue;
			half _ColorsMaskValue;
			half _ColorsVariationValue;
			half _VertexOcclusionColorsMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _OverlayVariationValue;
			half _DetailNormalValue;
			half _SecondUVsMode;
			half _GlobalColors;
			half _MotionFacingValue;
			half _LayerMotionValue;
			half _MotionVariation_20;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _RenderDirect;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _Cutoff;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _IsVersion;
			half _HasEmissive;
			half _render_src;
			half _render_zw;
			half _render_dst;
			half _render_coverage;
			half _IsStandardShader;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageGlobalsVariation;
			half _IsTVEShader;
			half _HasOcclusion;
			half _IsIdentifier;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _VertexVariationMode;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MessageMotionVariation;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _MessageOcclusion;
			half _EmissiveMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_20;
			half _DetailMaskInvertMode;
			half _CategoryMotion;
			half _ColorsMaskMaxValue;
			half _RenderCoverage;
			half _MessageSubsurface;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderZWrite;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderClip;
			half _ColorsMaskMinValue;
			half _FadeConstantValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			float TVE_ColorsUsage[10];
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			half4 TVE_ColorsParams;
			half4 TVE_OverlayColor;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_SecondNormalTex);
			half TVE_WetnessContrast;
			half TVE_SubsurfaceValue;
			half TVE_OverlaySubsurface;
			half3 TVE_MainLightDirection;
			TEXTURE2D(_EmissiveTex);
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g76351 = v.positionOS.xyz;
				float3 appendResult60_g76361 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76351 = ( appendResult60_g76361 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76351 = Mesh_PivotsData2831_g76351;
				float3 temp_output_2283_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				half3 VertexPos40_g76486 = temp_output_2283_0_g76351;
				half3 VertexPos40_g76487 = VertexPos40_g76486;
				float3 appendResult74_g76487 = (float3(VertexPos40_g76487.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76487 = appendResult74_g76487;
				float3 break84_g76487 = VertexPos40_g76487;
				float3 appendResult81_g76487 = (float3(0.0 , break84_g76487.y , break84_g76487.z));
				half3 VertexPosOtherAxis82_g76487 = appendResult81_g76487;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g76351 = ase_worldPos;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 WorldPosition_Shifted7477_g76351 = ( WorldPosition3905_g76351 - TVE_WorldOrigin );
				float4x4 break19_g76407 = GetObjectToWorldMatrix();
				float3 appendResult20_g76407 = (float3(break19_g76407[ 0 ][ 3 ] , break19_g76407[ 1 ][ 3 ] , break19_g76407[ 2 ][ 3 ]));
				float3 temp_output_122_0_g76407 = Mesh_PivotsData2831_g76351;
				float3 PivotsOnly105_g76407 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76407 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g76409 = ( appendResult20_g76407 + PivotsOnly105_g76407 );
				half3 WorldData19_g76409 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76409 = WorldData19_g76409;
				#else
				float3 staticSwitch14_g76409 = ObjectData20_g76409;
				#endif
				float3 temp_output_114_0_g76407 = staticSwitch14_g76409;
				float3 vertexToFrag4224_g76351 = temp_output_114_0_g76407;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				float3 lerpResult6766_g76351 = lerp( WorldPosition_Shifted7477_g76351 , ObjectPosition_Shifted7481_g76351 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76351 = lerpResult6766_g76351;
				half3 Input_Position419_g76527 = Motion_10_Position6738_g76351;
				float Input_MotionScale287_g76527 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76527 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76527 = (( Input_Position419_g76527 * Input_MotionScale287_g76527 * NoiseTex_Tilling735_g76527 * 0.0075 )).xz;
				float2 temp_output_447_0_g76356 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76351 = temp_output_447_0_g76356;
				half2 Input_DirectionWS423_g76527 = Global_Wind_DirectionWS4683_g76351;
				float lerpResult128_g76528 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76527 = _MotionSpeed_10;
				half Input_MotionVariation284_g76527 = _MotionVariation_10;
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = v.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				half Input_GlobalMeshVariation569_g76527 = Global_MeshVariation5104_g76351;
				float temp_output_630_0_g76527 = ( ( ( lerpResult128_g76528 * Input_MotionSpeed62_g76527 ) + ( Input_MotionVariation284_g76527 * Input_GlobalMeshVariation569_g76527 ) ) * 0.03 );
				float temp_output_607_0_g76527 = frac( temp_output_630_0_g76527 );
				float4 lerpResult590_g76527 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * temp_output_607_0_g76527 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * frac( ( temp_output_630_0_g76527 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76527 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76527 = lerpResult590_g76527;
				float2 temp_output_645_0_g76527 = ((Noise_Complex703_g76527).rg*2.0 + -1.0);
				float2 break650_g76527 = temp_output_645_0_g76527;
				float3 appendResult649_g76527 = (float3(break650_g76527.x , 0.0 , break650_g76527.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76527 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76510 = Global_Noise_OS5548_g76351;
				float2 break448_g76356 = temp_output_447_0_g76356;
				float3 appendResult452_g76356 = (float3(break448_g76356.x , 0.0 , break448_g76356.y));
				half2 Global_Wind_DirectionOS5692_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76510 = Global_Wind_DirectionOS5692_g76351;
				float temp_output_84_0_g76362 = _LayerMotionValue;
				float temp_output_19_0_g76366 = TVE_MotionUsage[(int)temp_output_84_0_g76362];
				float4 temp_output_91_19_g76362 = TVE_MotionCoords;
				half2 UV94_g76362 = ( (temp_output_91_19_g76362).zw + ( (temp_output_91_19_g76362).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76362 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76362,temp_output_84_0_g76362, 0.0 );
				float4 temp_output_17_0_g76366 = tex2DArrayNode50_g76362;
				float4 temp_output_112_19_g76362 = TVE_MotionParams;
				float4 temp_output_3_0_g76366 = temp_output_112_19_g76362;
				float4 ifLocalVar18_g76366 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76366 >= 0.5 )
				ifLocalVar18_g76366 = temp_output_17_0_g76366;
				else
				ifLocalVar18_g76366 = temp_output_3_0_g76366;
				float4 lerpResult22_g76366 = lerp( temp_output_3_0_g76366 , temp_output_17_0_g76366 , temp_output_19_0_g76366);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76366 = lerpResult22_g76366;
				#else
				float4 staticSwitch24_g76366 = ifLocalVar18_g76366;
				#endif
				half4 Global_Motion_Params3909_g76351 = staticSwitch24_g76366;
				float4 break322_g76356 = Global_Motion_Params3909_g76351;
				float lerpResult457_g76356 = lerp( break322_g76356.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76356 = ( 1.0 - lerpResult457_g76356 );
				half Global_Wind_Power2223_g76351 = ( 1.0 - ( temp_output_459_0_g76356 * temp_output_459_0_g76356 ) );
				half Input_WindPower449_g76510 = Global_Wind_Power2223_g76351;
				float2 lerpResult516_g76510 = lerp( Input_Noise_DirectionOS487_g76510 , Input_Wind_DirectionOS458_g76510 , ( Input_WindPower449_g76510 * 0.6 ));
				half Mesh_Motion_107572_g76351 = v.ase_color.a;
				half Input_MeshHeight388_g76510 = Mesh_Motion_107572_g76351;
				half ObjectData20_g76511 = Input_MeshHeight388_g76510;
				float enc62_g76576 = v.texcoord0.w;
				float2 localDecodeFloatToVector262_g76576 = DecodeFloatToVector2( enc62_g76576 );
				float2 break63_g76576 = ( localDecodeFloatToVector262_g76576 * 100.0 );
				float Bounds_Height5230_g76351 = break63_g76576.x;
				half Input_BoundsHeight390_g76510 = Bounds_Height5230_g76351;
				half WorldData19_g76511 = ( Input_MeshHeight388_g76510 * Input_MeshHeight388_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76511 = WorldData19_g76511;
				#else
				float staticSwitch14_g76511 = ObjectData20_g76511;
				#endif
				half Final_Motion10_Mask321_g76510 = ( staticSwitch14_g76511 * 2.0 );
				half Input_BendingAmplitude376_g76510 = _MotionAmplitude_10;
				half Global_MotionValue640_g76510 = TVE_MotionValue_10;
				half2 Final_Bending631_g76510 = ( lerpResult516_g76510 * ( Final_Motion10_Mask321_g76510 * Input_BendingAmplitude376_g76510 * Input_WindPower449_g76510 * Input_WindPower449_g76510 * Global_MotionValue640_g76510 ) );
				float2 appendResult433_g76356 = (float2(break322_g76356.x , break322_g76356.y));
				float2 temp_output_436_0_g76356 = (appendResult433_g76356*2.0 + -1.0);
				float2 break441_g76356 = temp_output_436_0_g76356;
				float3 appendResult440_g76356 = (float3(break441_g76356.x , 0.0 , break441_g76356.y));
				half2 Global_React_DirectionOS39_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76510 = Global_React_DirectionOS39_g76351;
				float clampResult17_g76513 = clamp( Input_MeshHeight388_g76510 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76512 = 0.0;
				half Input_InteractionUseMask62_g76510 = _InteractionMaskValue;
				float temp_output_10_0_g76512 = ( Input_InteractionUseMask62_g76510 - temp_output_7_0_g76512 );
				half Final_InteractionRemap594_g76510 = saturate( ( ( clampResult17_g76513 - temp_output_7_0_g76512 ) / ( temp_output_10_0_g76512 + 0.0001 ) ) );
				half ObjectData20_g76514 = Final_InteractionRemap594_g76510;
				half WorldData19_g76514 = ( Final_InteractionRemap594_g76510 * Final_InteractionRemap594_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76514 = WorldData19_g76514;
				#else
				float staticSwitch14_g76514 = ObjectData20_g76514;
				#endif
				half Final_InteractionMask373_g76510 = ( staticSwitch14_g76514 * 2.0 );
				half Input_InteractionAmplitude58_g76510 = _InteractionAmplitude;
				half2 Final_Interaction632_g76510 = ( Input_React_DirectionOS358_g76510 * Final_InteractionMask373_g76510 * Input_InteractionAmplitude58_g76510 );
				half Global_Interaction_Mask66_g76351 = ( break322_g76356.w * break322_g76356.w * break322_g76356.w * break322_g76356.w );
				float Input_InteractionGlobalMask330_g76510 = Global_Interaction_Mask66_g76351;
				half Final_InteractionValue525_g76510 = saturate( ( Input_InteractionAmplitude58_g76510 * Input_InteractionGlobalMask330_g76510 ) );
				float2 lerpResult551_g76510 = lerp( Final_Bending631_g76510 , Final_Interaction632_g76510 , Final_InteractionValue525_g76510);
				float2 break364_g76510 = lerpResult551_g76510;
				float3 appendResult638_g76510 = (float3(break364_g76510.x , 0.0 , break364_g76510.y));
				half3 Motion_10_Interaction7519_g76351 = appendResult638_g76510;
				half3 Angle44_g76486 = Motion_10_Interaction7519_g76351;
				half Angle44_g76487 = (Angle44_g76486).z;
				half3 VertexPos40_g76488 = ( VertexPosRotationAxis50_g76487 + ( VertexPosOtherAxis82_g76487 * cos( Angle44_g76487 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76487 ) * sin( Angle44_g76487 ) ) );
				float3 appendResult74_g76488 = (float3(0.0 , 0.0 , VertexPos40_g76488.z));
				half3 VertexPosRotationAxis50_g76488 = appendResult74_g76488;
				float3 break84_g76488 = VertexPos40_g76488;
				float3 appendResult81_g76488 = (float3(break84_g76488.x , break84_g76488.y , 0.0));
				half3 VertexPosOtherAxis82_g76488 = appendResult81_g76488;
				half Angle44_g76488 = -(Angle44_g76486).x;
				half3 Input_Position419_g76566 = WorldPosition_Shifted7477_g76351;
				float3 break459_g76566 = Input_Position419_g76566;
				float Sum_Position446_g76566 = ( break459_g76566.x + break459_g76566.y + break459_g76566.z );
				half Input_MotionScale321_g76566 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76566 = _MotionVariation_20;
				half Input_GlobalVariation400_g76566 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76567 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76566 = _MotionSpeed_20;
				float temp_output_404_0_g76566 = ( lerpResult128_g76567 * Input_MotionSpeed62_g76566 );
				half Motion_SineA450_g76566 = sin( ( ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) + ( Input_MotionVariation330_g76566 * Input_GlobalVariation400_g76566 ) + temp_output_404_0_g76566 ) );
				half Motion_SineB395_g76566 = sin( ( ( temp_output_404_0_g76566 * 0.6842 ) + ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) ) );
				half3 Input_Position419_g76585 = VertexPosition3588_g76351;
				float3 normalizeResult518_g76585 = normalize( Input_Position419_g76585 );
				half2 Input_DirectionOS423_g76585 = Global_React_DirectionOS39_g76351;
				float2 break521_g76585 = -Input_DirectionOS423_g76585;
				float3 appendResult522_g76585 = (float3(break521_g76585.x , 0.0 , break521_g76585.y));
				float dotResult519_g76585 = dot( normalizeResult518_g76585 , appendResult522_g76585 );
				half Input_Value62_g76585 = _MotionFacingValue;
				float lerpResult524_g76585 = lerp( 1.0 , (dotResult519_g76585*0.5 + 0.5) , Input_Value62_g76585);
				half ObjectData20_g76586 = max( lerpResult524_g76585 , 0.001 );
				half WorldData19_g76586 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76586 = WorldData19_g76586;
				#else
				float staticSwitch14_g76586 = ObjectData20_g76586;
				#endif
				half Motion_FacingMask5214_g76351 = staticSwitch14_g76586;
				half Motion_20_Amplitude4381_g76351 = Motion_FacingMask5214_g76351;
				half Input_MotionAmplitude384_g76566 = Motion_20_Amplitude4381_g76351;
				half Input_GlobalWind407_g76566 = Global_Wind_Power2223_g76351;
				float4 break638_g76527 = abs( Noise_Complex703_g76527 );
				half Global_Noise_B5526_g76351 = break638_g76527.b;
				half Input_GlobalNoise411_g76566 = Global_Noise_B5526_g76351;
				float lerpResult413_g76566 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76566);
				half Motion_Amplitude418_g76566 = ( Input_MotionAmplitude384_g76566 * Input_GlobalWind407_g76566 * pow( Input_GlobalNoise411_g76566 , lerpResult413_g76566 ) );
				half Input_Squash58_g76566 = _MotionAmplitude_20;
				float enc59_g76576 = v.texcoord0.z;
				float2 localDecodeFloatToVector259_g76576 = DecodeFloatToVector2( enc59_g76576 );
				float2 break61_g76576 = localDecodeFloatToVector259_g76576;
				half Mesh_Motion_2060_g76351 = break61_g76576.x;
				half Input_MeshMotion_20388_g76566 = Mesh_Motion_2060_g76351;
				float Bounds_Radius5231_g76351 = break63_g76576.y;
				half Input_BoundsRadius390_g76566 = Bounds_Radius5231_g76351;
				half Global_MotionValue462_g76566 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76566 = Global_React_DirectionOS39_g76351;
				float2 break371_g76566 = Input_DirectionOS366_g76566;
				float3 appendResult372_g76566 = (float3(break371_g76566.x , ( Motion_SineA450_g76566 * 0.3 ) , break371_g76566.y));
				half3 Motion_20_Squash4418_g76351 = ( ( (max( Motion_SineA450_g76566 , Motion_SineB395_g76566 )*0.5 + 0.5) * Motion_Amplitude418_g76566 * Input_Squash58_g76566 * Input_MeshMotion_20388_g76566 * Input_BoundsRadius390_g76566 * Global_MotionValue462_g76566 ) * appendResult372_g76566 );
				half3 VertexPos40_g76472 = ( ( VertexPosRotationAxis50_g76488 + ( VertexPosOtherAxis82_g76488 * cos( Angle44_g76488 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76488 ) * sin( Angle44_g76488 ) ) ) + Motion_20_Squash4418_g76351 );
				float3 appendResult74_g76472 = (float3(0.0 , VertexPos40_g76472.y , 0.0));
				float3 VertexPosRotationAxis50_g76472 = appendResult74_g76472;
				float3 break84_g76472 = VertexPos40_g76472;
				float3 appendResult81_g76472 = (float3(break84_g76472.x , 0.0 , break84_g76472.z));
				float3 VertexPosOtherAxis82_g76472 = appendResult81_g76472;
				half Input_Rolling379_g76566 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76351 = ( Motion_SineA450_g76566 * Motion_Amplitude418_g76566 * Input_Rolling379_g76566 * Input_MeshMotion_20388_g76566 * Global_MotionValue462_g76566 );
				half Angle44_g76472 = Motion_20_Rolling5257_g76351;
				half3 Input_Position500_g76523 = WorldPosition_Shifted7477_g76351;
				half Input_MotionScale321_g76523 = _MotionScale_32;
				half Input_MotionVariation330_g76523 = _MotionVariation_32;
				half Input_GlobalVariation372_g76523 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76524 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76523 = _MotionSpeed_32;
				float4 tex2DNode460_g76523 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76523).xz * Input_MotionScale321_g76523 * 0.03 ) + ( Input_MotionVariation330_g76523 * Input_GlobalVariation372_g76523 ) + ( lerpResult128_g76524 * Input_MotionSpeed62_g76523 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76523 = (float3(tex2DNode460_g76523.r , tex2DNode460_g76523.g , tex2DNode460_g76523.b));
				half3 Flutter_Texture489_g76523 = (appendResult462_g76523*2.0 + -1.0);
				float temp_output_7_0_g76401 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76401 = ( TVE_MotionFadeStart - temp_output_7_0_g76401 );
				half Motion_FadeOut4005_g76351 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76401 ) / ( temp_output_10_0_g76401 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76351 = ( _MotionAmplitude_32 * Motion_FacingMask5214_g76351 * Motion_FadeOut4005_g76351 );
				half Input_MotionAmplitude58_g76523 = Motion_30_Amplitude4960_g76351;
				half Mesh_Motion_30144_g76351 = break61_g76576.y;
				half Input_MeshMotion_30374_g76523 = Mesh_Motion_30144_g76351;
				half Input_GlobalWind471_g76523 = Global_Wind_Power2223_g76351;
				half Global_MotionValue503_g76523 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g76523 = Global_Noise_B5526_g76351;
				float lerpResult466_g76523 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76523);
				half Flutter_Amplitude491_g76523 = ( Input_MotionAmplitude58_g76523 * Input_MeshMotion_30374_g76523 * Input_GlobalWind471_g76523 * Global_MotionValue503_g76523 * pow( Input_GlobalNoise472_g76523 , lerpResult466_g76523 ) );
				half3 Motion_30_Flutter263_g76351 = ( Flutter_Texture489_g76523 * Flutter_Amplitude491_g76523 );
				float3 Vertex_Motion_Object833_g76351 = ( ( VertexPosRotationAxis50_g76472 + ( VertexPosOtherAxis82_g76472 * cos( Angle44_g76472 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76472 ) * sin( Angle44_g76472 ) ) ) + Motion_30_Flutter263_g76351 );
				half3 ObjectData20_g76419 = Vertex_Motion_Object833_g76351;
				float3 temp_output_3474_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				float3 Vertex_Motion_World1118_g76351 = ( ( ( temp_output_3474_0_g76351 + Motion_10_Interaction7519_g76351 ) + Motion_20_Squash4418_g76351 ) + Motion_30_Flutter263_g76351 );
				half3 WorldData19_g76419 = Vertex_Motion_World1118_g76351;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76419 = WorldData19_g76419;
				#else
				float3 staticSwitch14_g76419 = ObjectData20_g76419;
				#endif
				float3 temp_output_7495_0_g76351 = staticSwitch14_g76419;
				float3 Vertex_Motion7493_g76351 = temp_output_7495_0_g76351;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 break2709_g76351 = cross( ViewDirection3963_g76351 , half3(0,1,0) );
				float3 appendResult2710_g76351 = (float3(-break2709_g76351.z , 0.0 , break2709_g76351.x));
				float3 appendResult2667_g76351 = (float3(Global_MeshVariation5104_g76351 , 0.5 , Global_MeshVariation5104_g76351));
				half Mesh_Height1524_g76351 = v.ase_color.a;
				float dotResult2212_g76351 = dot( ViewDirection3963_g76351 , float3(0,1,0) );
				half Mask_HView2656_g76351 = dotResult2212_g76351;
				float saferPower2652_g76351 = abs( Mask_HView2656_g76351 );
				half3 Grass_Perspective2661_g76351 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76351 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76351*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76351 * pow( saferPower2652_g76351 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76383 = _LayerVertexValue;
				float temp_output_19_0_g76387 = TVE_VertexUsage[(int)temp_output_84_0_g76383];
				float4 temp_output_94_19_g76383 = TVE_VertexCoords;
				half2 UV97_g76383 = ( (temp_output_94_19_g76383).zw + ( (temp_output_94_19_g76383).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76383 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76383,temp_output_84_0_g76383, 0.0 );
				float4 temp_output_17_0_g76387 = tex2DArrayNode50_g76383;
				float4 temp_output_111_19_g76383 = TVE_VertexParams;
				float4 temp_output_3_0_g76387 = temp_output_111_19_g76383;
				float4 ifLocalVar18_g76387 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76387 >= 0.5 )
				ifLocalVar18_g76387 = temp_output_17_0_g76387;
				else
				ifLocalVar18_g76387 = temp_output_3_0_g76387;
				float4 lerpResult22_g76387 = lerp( temp_output_3_0_g76387 , temp_output_17_0_g76387 , temp_output_19_0_g76387);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76387 = lerpResult22_g76387;
				#else
				float4 staticSwitch24_g76387 = ifLocalVar18_g76387;
				#endif
				half4 Global_Vertex_Params4173_g76351 = staticSwitch24_g76387;
				float4 break322_g76388 = Global_Vertex_Params4173_g76351;
				half Global_VertexSize174_g76351 = saturate( break322_g76388.w );
				float lerpResult346_g76351 = lerp( 1.0 , Global_VertexSize174_g76351 , _GlobalSize);
				float3 appendResult3480_g76351 = (float3(lerpResult346_g76351 , lerpResult346_g76351 , lerpResult346_g76351));
				half3 ObjectData20_g76416 = appendResult3480_g76351;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76416 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76416 = WorldData19_g76416;
				#else
				float3 staticSwitch14_g76416 = ObjectData20_g76416;
				#endif
				half3 Vertex_Size1741_g76351 = staticSwitch14_g76416;
				float temp_output_7_0_g76417 = _SizeFadeEndValue;
				float temp_output_10_0_g76417 = ( _SizeFadeStartValue - temp_output_7_0_g76417 );
				float temp_output_7453_0_g76351 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76351 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76417 ) / ( temp_output_10_0_g76417 + 0.0001 ) ) );
				float3 appendResult3482_g76351 = (float3(temp_output_7453_0_g76351 , temp_output_7453_0_g76351 , temp_output_7453_0_g76351));
				half3 ObjectData20_g76415 = appendResult3482_g76351;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76415 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76415 = WorldData19_g76415;
				#else
				float3 staticSwitch14_g76415 = ObjectData20_g76415;
				#endif
				float3 Vertex_SizeFade1740_g76351 = staticSwitch14_g76415;
				float3 lerpResult16_g76420 = lerp( VertexPosition3588_g76351 , ( ( ( Vertex_Motion7493_g76351 + Grass_Perspective2661_g76351 ) * Vertex_Size1741_g76351 * Vertex_SizeFade1740_g76351 ) + Mesh_PivotsOS2291_g76351 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76351 = lerpResult16_g76420;
				float3 Final_VertexPosition890_g76351 = ( temp_output_4912_0_g76351 + _DisableSRPBatcher );
				
				float4 break33_g76581 = _second_uvs_mode;
				float2 temp_output_30_0_g76581 = ( v.texcoord0.xy * break33_g76581.x );
				float2 appendResult21_g76576 = (float2(v.texcoord1.z , v.texcoord1.w));
				float2 Mesh_DetailCoord3_g76351 = appendResult21_g76576;
				float2 temp_output_29_0_g76581 = ( Mesh_DetailCoord3_g76351 * break33_g76581.y );
				float2 temp_output_31_0_g76581 = ( (WorldPosition_Shifted7477_g76351).xz * break33_g76581.z );
				half2 Second_UVs_Tilling7609_g76351 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7610_g76351 = ( 1.0 / Second_UVs_Tilling7609_g76351 );
				float2 lerpResult7614_g76351 = lerp( Second_UVs_Tilling7609_g76351 , Second_UVs_Scale7610_g76351 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7605_g76351 = (_SecondUVs).zw;
				float2 vertexToFrag11_g76377 = ( ( ( temp_output_30_0_g76581 + temp_output_29_0_g76581 + temp_output_31_0_g76581 ) * lerpResult7614_g76351 ) + Second_UVs_Offset7605_g76351 );
				o.ase_texcoord5.xy = vertexToFrag11_g76377;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord6.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord7.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				o.ase_texcoord9.xyz = vertexToFrag3890_g76351;
				o.ase_texcoord10.xyz = vertexToFrag4224_g76351;
				half Global_Noise_A4860_g76351 = break638_g76527.a;
				half Tint_Highlight_Value3231_g76351 = ( Global_Noise_A4860_g76351 * Global_Wind_Power2223_g76351 * Motion_FadeOut4005_g76351 * Mesh_Height1524_g76351 );
				float vertexToFrag11_g76392 = Tint_Highlight_Value3231_g76351;
				o.ase_texcoord5.z = vertexToFrag11_g76392;
				
				o.ase_texcoord4 = v.texcoord0;
				o.ase_color = v.ase_color;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;
				o.ase_texcoord9.w = 0;
				o.ase_texcoord10.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76351;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				o.positionCS = MetaVertexPosition( v.positionOS, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(v.positionOS.xyz, v.texcoord0.xy, v.texcoord1.xy, v.texcoord2.xy, VizUV, LightCoord);
					o.VizUV = float4(VizUV, 0, 0);
					o.LightCoord = LightCoord;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g76351 = ( ( IN.ase_texcoord4.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76351 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76351 );
				float3 lerpResult6223_g76351 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76351).rgb , _MainAlbedoValue);
				float4 tex2DNode35_g76351 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				half Main_Mask57_g76351 = tex2DNode35_g76351.b;
				float clampResult17_g76560 = clamp( Main_Mask57_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76561 = _MainMaskMinValue;
				float temp_output_10_0_g76561 = ( _MainMaskMaxValue - temp_output_7_0_g76561 );
				half Main_Mask_Remap5765_g76351 = saturate( ( ( clampResult17_g76560 - temp_output_7_0_g76561 ) / ( temp_output_10_0_g76561 + 0.0001 ) ) );
				float lerpResult7671_g76351 = lerp( 1.0 , Main_Mask_Remap5765_g76351 , _MainColorMode);
				float4 lerpResult7654_g76351 = lerp( _MainColorTwo , _MainColor , lerpResult7671_g76351);
				half3 Main_Color_RGB7657_g76351 = (lerpResult7654_g76351).rgb;
				half3 Main_Albedo99_g76351 = ( lerpResult6223_g76351 * Main_Color_RGB7657_g76351 );
				float2 vertexToFrag11_g76377 = IN.ase_texcoord5.xy;
				half2 Second_UVs17_g76351 = vertexToFrag11_g76377;
				float4 tex2DNode89_g76351 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76351 );
				float3 lerpResult6225_g76351 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76351).rgb , _SecondAlbedoValue);
				float4 tex2DNode33_g76351 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				half Second_Mask81_g76351 = tex2DNode33_g76351.b;
				float clampResult17_g76563 = clamp( Second_Mask81_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76564 = _SecondMaskMinValue;
				float temp_output_10_0_g76564 = ( _SecondMaskMaxValue - temp_output_7_0_g76564 );
				half Second_Mask_Remap6130_g76351 = saturate( ( ( clampResult17_g76563 - temp_output_7_0_g76564 ) / ( temp_output_10_0_g76564 + 0.0001 ) ) );
				float lerpResult7672_g76351 = lerp( 1.0 , Second_Mask_Remap6130_g76351 , _SecondColorMode);
				float4 lerpResult7662_g76351 = lerp( _SecondColorTwo , _SecondColor , lerpResult7672_g76351);
				half3 Second_Color_RGB7663_g76351 = (lerpResult7662_g76351).rgb;
				half3 Second_Albedo153_g76351 = ( lerpResult6225_g76351 * Second_Color_RGB7663_g76351 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g76393 = 2.0;
				#else
				float staticSwitch1_g76393 = 4.594794;
				#endif
				float3 lerpResult4834_g76351 = lerp( ( Main_Albedo99_g76351 * Second_Albedo153_g76351 * staticSwitch1_g76393 ) , Second_Albedo153_g76351 , _DetailBlendMode);
				float lerpResult6885_g76351 = lerp( Main_Mask57_g76351 , Second_Mask81_g76351 , _DetailMaskMode);
				float clampResult17_g76483 = clamp( lerpResult6885_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76482 = _DetailMaskMinValue;
				float temp_output_10_0_g76482 = ( _DetailMaskMaxValue - temp_output_7_0_g76482 );
				half Blend_Mask_Texture6794_g76351 = saturate( ( ( clampResult17_g76483 - temp_output_7_0_g76482 ) / ( temp_output_10_0_g76482 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76351 = IN.ase_color.b;
				half4 Normal_Packed45_g76559 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				float2 appendResult58_g76559 = (float2(( (Normal_Packed45_g76559).x * (Normal_Packed45_g76559).w ) , (Normal_Packed45_g76559).y));
				half2 Normal_Default50_g76559 = appendResult58_g76559;
				half2 Normal_ASTC41_g76559 = (Normal_Packed45_g76559).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76559 = Normal_ASTC41_g76559;
				#else
				float2 staticSwitch38_g76559 = Normal_Default50_g76559;
				#endif
				half2 Normal_NO_DTX544_g76559 = (Normal_Packed45_g76559).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76559 = Normal_NO_DTX544_g76559;
				#else
				float2 staticSwitch37_g76559 = staticSwitch38_g76559;
				#endif
				float2 temp_output_6555_0_g76351 = ( (staticSwitch37_g76559*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76351 = (float3(temp_output_6555_0_g76351 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord6.xyz;
				float3 ase_worldNormal = IN.ase_texcoord7.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g76351 = appendResult7388_g76351;
				float3 worldNormal7389_g76351 = float3(dot(tanToWorld0,tanNormal7389_g76351), dot(tanToWorld1,tanNormal7389_g76351), dot(tanToWorld2,tanNormal7389_g76351));
				half3 Main_NormalWS7390_g76351 = worldNormal7389_g76351;
				float lerpResult6884_g76351 = lerp( Mesh_DetailMask90_g76351 , ((Main_NormalWS7390_g76351).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76481 = clamp( lerpResult6884_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76480 = _DetailMeshMinValue;
				float temp_output_10_0_g76480 = ( _DetailMeshMaxValue - temp_output_7_0_g76480 );
				half Blend_Mask_Mesh1540_g76351 = saturate( ( ( clampResult17_g76481 - temp_output_7_0_g76480 ) / ( temp_output_10_0_g76480 + 0.0001 ) ) );
				float clampResult17_g76504 = clamp( ( Blend_Mask_Texture6794_g76351 * Blend_Mask_Mesh1540_g76351 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76552 = _DetailBlendMinValue;
				float temp_output_10_0_g76552 = ( _DetailBlendMaxValue - temp_output_7_0_g76552 );
				half Blend_Mask147_g76351 = ( saturate( ( ( clampResult17_g76504 - temp_output_7_0_g76552 ) / ( temp_output_10_0_g76552 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g76351 = lerp( Main_Albedo99_g76351 , lerpResult4834_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float3 staticSwitch255_g76351 = lerpResult235_g76351;
				#else
				float3 staticSwitch255_g76351 = Main_Albedo99_g76351;
				#endif
				half3 Blend_Albedo265_g76351 = staticSwitch255_g76351;
				half Mesh_Height1524_g76351 = IN.ase_color.a;
				float temp_output_7_0_g76402 = _GradientMinValue;
				float temp_output_10_0_g76402 = ( _GradientMaxValue - temp_output_7_0_g76402 );
				half Tint_Gradient_Value2784_g76351 = saturate( ( ( Mesh_Height1524_g76351 - temp_output_7_0_g76402 ) / ( temp_output_10_0_g76402 + 0.0001 ) ) );
				float3 lerpResult2779_g76351 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Tint_Gradient_Value2784_g76351);
				float lerpResult6617_g76351 = lerp( Main_Mask_Remap5765_g76351 , Second_Mask_Remap6130_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6623_g76351 = lerpResult6617_g76351;
				#else
				float staticSwitch6623_g76351 = Main_Mask_Remap5765_g76351;
				#endif
				half Blend_Mask_Remap6621_g76351 = staticSwitch6623_g76351;
				half Tint_Gradient_Mask6207_g76351 = Blend_Mask_Remap6621_g76351;
				float3 lerpResult6208_g76351 = lerp( float3( 1,1,1 ) , lerpResult2779_g76351 , Tint_Gradient_Mask6207_g76351);
				half3 Tint_Gradient_Color5769_g76351 = lerpResult6208_g76351;
				half3 Tint_Noise_Color5770_g76351 = float3(1,1,1);
				half3 Tint_User_Color7335_g76351 = float3(1,1,1);
				float Mesh_Occlusion318_g76351 = IN.ase_color.g;
				float clampResult17_g76399 = clamp( Mesh_Occlusion318_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76405 = _VertexOcclusionMinValue;
				float temp_output_10_0_g76405 = ( _VertexOcclusionMaxValue - temp_output_7_0_g76405 );
				half Occlusion_Mask6432_g76351 = saturate( ( ( clampResult17_g76399 - temp_output_7_0_g76405 ) / ( temp_output_10_0_g76405 + 0.0001 ) ) );
				float3 lerpResult2945_g76351 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g76351);
				half3 Occlusion_Color648_g76351 = lerpResult2945_g76351;
				half3 Matcap_Color7428_g76351 = half3(0,0,0);
				half3 Blend_Albedo_Tinted2808_g76351 = ( ( Blend_Albedo265_g76351 * Tint_Gradient_Color5769_g76351 * Tint_Noise_Color5770_g76351 * Tint_User_Color7335_g76351 * Occlusion_Color648_g76351 ) + Matcap_Color7428_g76351 );
				float3 temp_output_3_0_g76397 = Blend_Albedo_Tinted2808_g76351;
				float dotResult20_g76397 = dot( temp_output_3_0_g76397 , float3(0.2126,0.7152,0.0722) );
				half Blend_Albedo_Grayscale5939_g76351 = dotResult20_g76397;
				float3 temp_cast_1 = (Blend_Albedo_Grayscale5939_g76351).xxx;
				float temp_output_82_0_g76372 = _LayerColorsValue;
				float temp_output_19_0_g76376 = TVE_ColorsUsage[(int)temp_output_82_0_g76372];
				float4 temp_output_91_19_g76372 = TVE_ColorsCoords;
				float3 vertexToFrag3890_g76351 = IN.ase_texcoord9.xyz;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 vertexToFrag4224_g76351 = IN.ase_texcoord10.xyz;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 lerpResult4822_g76351 = lerp( WorldPosition3905_g76351 , ObjectPosition4223_g76351 , _ColorsPositionMode);
				half2 UV94_g76372 = ( (temp_output_91_19_g76372).zw + ( (temp_output_91_19_g76372).xy * (lerpResult4822_g76351).xz ) );
				float4 tex2DArrayNode83_g76372 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, UV94_g76372,temp_output_82_0_g76372, 0.0 );
				float4 temp_output_17_0_g76376 = tex2DArrayNode83_g76372;
				float4 temp_output_92_86_g76372 = TVE_ColorsParams;
				float4 temp_output_3_0_g76376 = temp_output_92_86_g76372;
				float4 ifLocalVar18_g76376 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76376 >= 0.5 )
				ifLocalVar18_g76376 = temp_output_17_0_g76376;
				else
				ifLocalVar18_g76376 = temp_output_3_0_g76376;
				float4 lerpResult22_g76376 = lerp( temp_output_3_0_g76376 , temp_output_17_0_g76376 , temp_output_19_0_g76376);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76376 = lerpResult22_g76376;
				#else
				float4 staticSwitch24_g76376 = ifLocalVar18_g76376;
				#endif
				half4 Global_Colors_Params5434_g76351 = staticSwitch24_g76376;
				float4 temp_output_346_0_g76358 = Global_Colors_Params5434_g76351;
				half Global_Colors_A1701_g76351 = saturate( (temp_output_346_0_g76358).w );
				half Colors_Influence3668_g76351 = Global_Colors_A1701_g76351;
				float temp_output_6306_0_g76351 = ( 1.0 - Colors_Influence3668_g76351 );
				float3 lerpResult3618_g76351 = lerp( Blend_Albedo_Tinted2808_g76351 , temp_cast_1 , ( 1.0 - ( temp_output_6306_0_g76351 * temp_output_6306_0_g76351 ) ));
				half3 Global_Colors_RGB1700_g76351 = (temp_output_346_0_g76358).xyz;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g76389 = 2.0;
				#else
				float staticSwitch1_g76389 = 4.594794;
				#endif
				half3 Colors_RGB1954_g76351 = ( Global_Colors_RGB1700_g76351 * staticSwitch1_g76389 * _ColorsIntensityValue );
				float lerpResult7679_g76351 = lerp( 1.0 , Blend_Mask_Remap6621_g76351 , _ColorsMaskValue);
				half Colors_Value3692_g76351 = ( lerpResult7679_g76351 * _GlobalColors );
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = IN.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				float lerpResult3870_g76351 = lerp( 1.0 , Global_MeshVariation5104_g76351 , _ColorsVariationValue);
				half Colors_Variation3650_g76351 = lerpResult3870_g76351;
				half Occlusion_Alpha6463_g76351 = _VertexOcclusionColor.a;
				float lerpResult6459_g76351 = lerp( Occlusion_Mask6432_g76351 , ( 1.0 - Occlusion_Mask6432_g76351 ) , _VertexOcclusionColorsMode);
				float lerpResult6461_g76351 = lerp( Occlusion_Alpha6463_g76351 , 1.0 , lerpResult6459_g76351);
				half Occlusion_Colors6450_g76351 = lerpResult6461_g76351;
				float3 temp_output_3_0_g76398 = ( Blend_Albedo265_g76351 * Tint_Gradient_Color5769_g76351 * Tint_Noise_Color5770_g76351 );
				float dotResult20_g76398 = dot( temp_output_3_0_g76398 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g76351 = clamp( saturate( ( dotResult20_g76398 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g76351 = clampResult6740_g76351;
				float temp_output_7_0_g76489 = 0.1;
				float temp_output_10_0_g76489 = ( 0.2 - temp_output_7_0_g76489 );
				float lerpResult16_g76390 = lerp( 0.0 , saturate( ( ( ( Colors_Value3692_g76351 * Colors_Influence3668_g76351 * Colors_Variation3650_g76351 * Occlusion_Colors6450_g76351 * Blend_Albedo_Globals6410_g76351 ) - temp_output_7_0_g76489 ) / ( temp_output_10_0_g76489 + 0.0001 ) ) ) , TVE_IsEnabled);
				float3 lerpResult3628_g76351 = lerp( Blend_Albedo_Tinted2808_g76351 , ( lerpResult3618_g76351 * Colors_RGB1954_g76351 ) , lerpResult16_g76390);
				half3 Blend_Albedo_Colored_High6027_g76351 = lerpResult3628_g76351;
				half3 Blend_Albedo_Colored863_g76351 = Blend_Albedo_Colored_High6027_g76351;
				half3 Global_OverlayColor1758_g76351 = (TVE_OverlayColor).rgb;
				float temp_output_84_0_g76367 = _LayerExtrasValue;
				float temp_output_19_0_g76371 = TVE_ExtrasUsage[(int)temp_output_84_0_g76367];
				float4 temp_output_93_19_g76367 = TVE_ExtrasCoords;
				float3 lerpResult4827_g76351 = lerp( WorldPosition3905_g76351 , ObjectPosition4223_g76351 , _ExtrasPositionMode);
				half2 UV96_g76367 = ( (temp_output_93_19_g76367).zw + ( (temp_output_93_19_g76367).xy * (lerpResult4827_g76351).xz ) );
				float4 tex2DArrayNode48_g76367 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76367,temp_output_84_0_g76367, 0.0 );
				float4 temp_output_17_0_g76371 = tex2DArrayNode48_g76367;
				float4 temp_output_94_85_g76367 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76371 = temp_output_94_85_g76367;
				float4 ifLocalVar18_g76371 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76371 >= 0.5 )
				ifLocalVar18_g76371 = temp_output_17_0_g76371;
				else
				ifLocalVar18_g76371 = temp_output_3_0_g76371;
				float4 lerpResult22_g76371 = lerp( temp_output_3_0_g76371 , temp_output_17_0_g76371 , temp_output_19_0_g76371);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76371 = lerpResult22_g76371;
				#else
				float4 staticSwitch24_g76371 = ifLocalVar18_g76371;
				#endif
				half4 Global_Extras_Params5440_g76351 = staticSwitch24_g76371;
				float4 break456_g76381 = Global_Extras_Params5440_g76351;
				half Global_Extras_Overlay156_g76351 = break456_g76381.z;
				float lerpResult1065_g76351 = lerp( 1.0 , Global_MeshVariation5104_g76351 , _OverlayVariationValue);
				half Overlay_Variation4560_g76351 = lerpResult1065_g76351;
				half Overlay_Value5738_g76351 = ( _GlobalOverlay * Global_Extras_Overlay156_g76351 * Overlay_Variation4560_g76351 );
				half2 Main_Normal137_g76351 = temp_output_6555_0_g76351;
				float2 lerpResult3372_g76351 = lerp( float2( 0,0 ) , Main_Normal137_g76351 , _DetailNormalValue);
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				half4 Normal_Packed45_g76562 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				float2 appendResult58_g76562 = (float2(( (Normal_Packed45_g76562).x * (Normal_Packed45_g76562).w ) , (Normal_Packed45_g76562).y));
				half2 Normal_Default50_g76562 = appendResult58_g76562;
				half2 Normal_ASTC41_g76562 = (Normal_Packed45_g76562).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76562 = Normal_ASTC41_g76562;
				#else
				float2 staticSwitch38_g76562 = Normal_Default50_g76562;
				#endif
				half2 Normal_NO_DTX544_g76562 = (Normal_Packed45_g76562).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76562 = Normal_NO_DTX544_g76562;
				#else
				float2 staticSwitch37_g76562 = staticSwitch38_g76562;
				#endif
				float2 temp_output_6560_0_g76351 = ( (staticSwitch37_g76562*2.0 + -1.0) * _SecondNormalValue );
				half2 Normal_Planar45_g76565 = temp_output_6560_0_g76351;
				float2 break64_g76565 = Normal_Planar45_g76565;
				float3 appendResult65_g76565 = (float3(break64_g76565.x , 0.0 , break64_g76565.y));
				float2 temp_output_7603_0_g76351 = (mul( ase_worldToTangent, appendResult65_g76565 )).xy;
				float2 ifLocalVar7604_g76351 = 0;
				if( _SecondUVsMode >= 2.0 )
				ifLocalVar7604_g76351 = temp_output_7603_0_g76351;
				else
				ifLocalVar7604_g76351 = temp_output_6560_0_g76351;
				half2 Second_Normal179_g76351 = ifLocalVar7604_g76351;
				float2 temp_output_36_0_g76394 = ( lerpResult3372_g76351 + Second_Normal179_g76351 );
				float2 lerpResult3376_g76351 = lerp( Main_Normal137_g76351 , temp_output_36_0_g76394 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float2 staticSwitch267_g76351 = lerpResult3376_g76351;
				#else
				float2 staticSwitch267_g76351 = Main_Normal137_g76351;
				#endif
				half2 Blend_Normal312_g76351 = staticSwitch267_g76351;
				float3 appendResult7377_g76351 = (float3(Blend_Normal312_g76351 , 1.0));
				float3 tanNormal7376_g76351 = appendResult7377_g76351;
				float3 worldNormal7376_g76351 = float3(dot(tanToWorld0,tanNormal7376_g76351), dot(tanToWorld1,tanNormal7376_g76351), dot(tanToWorld2,tanNormal7376_g76351));
				half3 Blend_NormalWS7375_g76351 = worldNormal7376_g76351;
				float lerpResult7446_g76351 = lerp( (Blend_NormalWS7375_g76351).y , IN.ase_normal.y , Vertex_DynamicMode5112_g76351);
				float lerpResult6757_g76351 = lerp( 1.0 , saturate( lerpResult7446_g76351 ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g76351 = lerpResult6757_g76351;
				half Overlay_Shading6688_g76351 = Blend_Albedo_Globals6410_g76351;
				half Overlay_Custom6707_g76351 = 1.0;
				float lerpResult7693_g76351 = lerp( Occlusion_Mask6432_g76351 , ( 1.0 - Occlusion_Mask6432_g76351 ) , _VertexOcclusionOverlayMode);
				float lerpResult6467_g76351 = lerp( Occlusion_Alpha6463_g76351 , 1.0 , lerpResult7693_g76351);
				half Occlusion_Overlay6471_g76351 = lerpResult6467_g76351;
				float temp_output_7_0_g76403 = 0.1;
				float temp_output_10_0_g76403 = ( 0.2 - temp_output_7_0_g76403 );
				half Overlay_Mask_High6064_g76351 = saturate( ( ( ( Overlay_Value5738_g76351 * Overlay_Projection6081_g76351 * Overlay_Shading6688_g76351 * Overlay_Custom6707_g76351 * Occlusion_Overlay6471_g76351 ) - temp_output_7_0_g76403 ) / ( temp_output_10_0_g76403 + 0.0001 ) ) );
				half Overlay_Mask269_g76351 = Overlay_Mask_High6064_g76351;
				float3 lerpResult336_g76351 = lerp( Blend_Albedo_Colored863_g76351 , Global_OverlayColor1758_g76351 , Overlay_Mask269_g76351);
				half3 Blend_Albedo_Overlay359_g76351 = lerpResult336_g76351;
				half Global_WetnessContrast6502_g76351 = TVE_WetnessContrast;
				half Global_Extras_Wetness305_g76351 = break456_g76381.y;
				half Wetness_Value6343_g76351 = ( Global_Extras_Wetness305_g76351 * _GlobalWetness );
				float3 lerpResult6367_g76351 = lerp( Blend_Albedo_Overlay359_g76351 , ( Blend_Albedo_Overlay359_g76351 * Blend_Albedo_Overlay359_g76351 ) , ( Global_WetnessContrast6502_g76351 * Wetness_Value6343_g76351 ));
				half3 Blend_Albedo_Wetness6351_g76351 = lerpResult6367_g76351;
				float vertexToFrag11_g76392 = IN.ase_texcoord5.z;
				half3 Tint_Highlight_Color5771_g76351 = ( ( (_MotionHighlightColor).rgb * vertexToFrag11_g76392 ) + float3( 1,1,1 ) );
				float3 temp_output_6309_0_g76351 = ( Blend_Albedo_Wetness6351_g76351 * Tint_Highlight_Color5771_g76351 );
				half3 Subsurface_Color1722_g76351 = ( (_SubsurfaceColor).rgb * Blend_Albedo_Wetness6351_g76351 );
				half Global_Subsurface4041_g76351 = TVE_SubsurfaceValue;
				half Global_OverlaySubsurface5667_g76351 = TVE_OverlaySubsurface;
				float lerpResult7362_g76351 = lerp( 1.0 , Global_OverlaySubsurface5667_g76351 , Overlay_Value5738_g76351);
				half Overlay_Subsurface7361_g76351 = lerpResult7362_g76351;
				half Subsurface_Intensity1752_g76351 = ( _SubsurfaceValue * Global_Subsurface4041_g76351 * Overlay_Subsurface7361_g76351 );
				float lerpResult7680_g76351 = lerp( 1.0 , Blend_Mask_Remap6621_g76351 , _SubsurfaceMaskValue);
				half Subsurface_Mask1557_g76351 = lerpResult7680_g76351;
				half3 MainLight_Direction3926_g76351 = TVE_MainLightDirection;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float dotResult785_g76351 = dot( -MainLight_Direction3926_g76351 , ViewDirection3963_g76351 );
				float saferPower1624_g76351 = abs( saturate( dotResult785_g76351 ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g76351 = 0.0;
				#else
				float staticSwitch1602_g76351 = ( pow( saferPower1624_g76351 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
				#endif
				half Mask_Subsurface_View782_g76351 = staticSwitch1602_g76351;
				half3 Subsurface_Approximation1693_g76351 = ( Subsurface_Color1722_g76351 * Subsurface_Intensity1752_g76351 * Subsurface_Mask1557_g76351 * Mask_Subsurface_View782_g76351 );
				half3 Blend_Albedo_Subsurface149_g76351 = ( temp_output_6309_0_g76351 + Subsurface_Approximation1693_g76351 );
				half3 Blend_Albedo_RimLight7316_g76351 = Blend_Albedo_Subsurface149_g76351;
				
				float3 temp_cast_11 = (0.0).xxx;
				float3 temp_output_7161_0_g76351 = (_EmissiveColor).rgb;
				half3 Emissive_Color7162_g76351 = temp_output_7161_0_g76351;
				half2 Emissive_UVs2468_g76351 = ( ( IN.ase_texcoord4.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float temp_output_7_0_g76582 = _EmissiveTexMinValue;
				float3 temp_cast_12 = (temp_output_7_0_g76582).xxx;
				float temp_output_10_0_g76582 = ( _EmissiveTexMaxValue - temp_output_7_0_g76582 );
				half3 Emissive_Texture7022_g76351 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g76351 )).rgb - temp_cast_12 ) / ( temp_output_10_0_g76582 + 0.0001 ) ) );
				half Global_Extras_Emissive4203_g76351 = break456_g76381.x;
				float lerpResult4206_g76351 = lerp( 1.0 , Global_Extras_Emissive4203_g76351 , _GlobalEmissive);
				half Emissive_Value7024_g76351 = ( ( lerpResult4206_g76351 * _EmissivePhaseValue ) - 1.0 );
				half3 Emissive_Mask6968_g76351 = saturate( ( Emissive_Texture7022_g76351 + Emissive_Value7024_g76351 ) );
				float3 temp_output_3_0_g76584 = ( Emissive_Color7162_g76351 * Emissive_Mask6968_g76351 );
				float temp_output_15_0_g76584 = _emissive_intensity_value;
				float3 temp_output_23_0_g76584 = ( temp_output_3_0_g76584 * temp_output_15_0_g76584 );
				#ifdef TVE_EMISSIVE
				float3 staticSwitch7687_g76351 = temp_output_23_0_g76584;
				#else
				float3 staticSwitch7687_g76351 = temp_cast_11;
				#endif
				half3 Final_Emissive2476_g76351 = staticSwitch7687_g76351;
				
				float localCustomAlphaClip19_g76558 = ( 0.0 );
				half Main_Alpha316_g76351 = tex2DNode29_g76351.a;
				half Second_Alpha5007_g76351 = tex2DNode89_g76351.a;
				float lerpResult6153_g76351 = lerp( Main_Alpha316_g76351 , Second_Alpha5007_g76351 , Blend_Mask147_g76351);
				float lerpResult6785_g76351 = lerp( ( Main_Alpha316_g76351 * Second_Alpha5007_g76351 ) , lerpResult6153_g76351 , _DetailAlphaMode);
				#ifdef TVE_DETAIL
				float staticSwitch6158_g76351 = lerpResult6785_g76351;
				#else
				float staticSwitch6158_g76351 = Main_Alpha316_g76351;
				#endif
				half Blend_Alpha6157_g76351 = staticSwitch6158_g76351;
				half AlphaTreshold2132_g76351 = _AlphaClipValue;
				half Global_Extras_Alpha1033_g76351 = saturate( break456_g76381.w );
				float lerpResult5154_g76351 = lerp( 0.0 , Global_MeshVariation5104_g76351 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76351 = lerpResult5154_g76351;
				float Emissive_Alpha7625_g76351 = 0.0;
				float lerpResult6866_g76351 = lerp( ( 1.0 - Blend_Mask147_g76351 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_DETAIL
				float staticSwitch6612_g76351 = lerpResult6866_g76351;
				#else
				float staticSwitch6612_g76351 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76351 = staticSwitch6612_g76351;
				half Alpha_Mask6234_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5203_g76351 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76351 - saturate( ( Global_Alpha_Variation5158_g76351 + Emissive_Alpha7625_g76351 ) ) ) + ( Global_Extras_Alpha1033_g76351 * 0.1 ) ) ) , ( Alpha_Mask6234_g76351 * _GlobalAlpha ));
				float lerpResult16_g76395 = lerp( 1.0 , lerpResult5203_g76351 , TVE_IsEnabled);
				half Global_Alpha315_g76351 = lerpResult16_g76395;
				float3 normalizeResult3971_g76351 = normalize( cross( ddy( WorldPosition ) , ddx( WorldPosition ) ) );
				float3 WorldNormal_Derivates3972_g76351 = normalizeResult3971_g76351;
				float dotResult3851_g76351 = dot( ViewDirection3963_g76351 , WorldNormal_Derivates3972_g76351 );
				float lerpResult3993_g76351 = lerp( 1.0 , saturate( ( abs( dotResult3851_g76351 ) * 3.0 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g76351 = lerpResult3993_g76351;
				half Fade_Effects_A5360_g76351 = Fade_Glancing3853_g76351;
				float temp_output_7_0_g76404 = TVE_CameraFadeMin;
				float temp_output_10_0_g76404 = ( TVE_CameraFadeMax - temp_output_7_0_g76404 );
				float lerpResult4755_g76351 = lerp( 1.0 , saturate( saturate( ( ( distance( WorldPosition , _WorldSpaceCameraPos ) - temp_output_7_0_g76404 ) / ( temp_output_10_0_g76404 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76351 = lerpResult4755_g76351;
				half Fade_Effects_B6228_g76351 = ( Fade_Effects_A5360_g76351 * Fade_Camera3743_g76351 );
				half Fade_Mask5149_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5141_g76351 = lerp( 1.0 , ( Fade_Effects_B6228_g76351 * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76351);
				half Fade_Effects_C7653_g76351 = lerpResult5141_g76351;
				float temp_output_5865_0_g76351 = saturate( ( Fade_Effects_C7653_g76351 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76351 ) ).r ) );
				half Fade_Alpha3727_g76351 = temp_output_5865_0_g76351;
				half Final_Alpha7344_g76351 = min( ( ( Blend_Alpha6157_g76351 - AlphaTreshold2132_g76351 ) * Global_Alpha315_g76351 ) , Fade_Alpha3727_g76351 );
				float temp_output_3_0_g76558 = Final_Alpha7344_g76351;
				float Alpha19_g76558 = temp_output_3_0_g76558;
				float temp_output_15_0_g76558 = 0.01;
				float Treshold19_g76558 = temp_output_15_0_g76558;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#else
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76351 = (lerpResult7654_g76351).a;
				half Second_Color_Alpha6152_g76351 = (lerpResult7662_g76351).a;
				float lerpResult6168_g76351 = lerp( Main_Color_Alpha6121_g76351 , Second_Color_Alpha6152_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6174_g76351 = lerpResult6168_g76351;
				#else
				float staticSwitch6174_g76351 = Main_Color_Alpha6121_g76351;
				#endif
				half Blend_Color_Alpha6167_g76351 = staticSwitch6174_g76351;
				half Final_Clip914_g76351 = saturate( ( Alpha19_g76558 * Blend_Color_Alpha6167_g76351 ) );
				

				float3 BaseColor = Blend_Albedo_RimLight7316_g76351;
				float3 Emission = Final_Emissive2476_g76351;
				float Alpha = Final_Clip914_g76351;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = IN.VizUV.xy;
					metaInput.LightCoord = IN.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend [_render_src] [_render_dst], One Zero
			ZWrite On
			ZTest LEqual
			Offset 0,0
			ColorMask RGBA

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SecondColor;
			half4 _MotionHighlightColor;
			half4 _SubsurfaceColor;
			half4 _NoiseMaskRemap;
			half4 _MainColorTwo;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColorTwo;
			half4 _MainUVs;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _DetailMeshRemap;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half4 _DetailMaskRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _RimLightRemap;
			half4 _MainColor;
			half3 _render_normals;
			half _SecondColorMode;
			half _DetailBlendMode;
			half _DetailMaskMode;
			half _DetailMaskMinValue;
			half _DetailMaskMaxValue;
			half _MainNormalValue;
			half _DetailMeshMode;
			half _DetailMeshMinValue;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _MainMaskMaxValue;
			half _SecondAlbedoValue;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			half _GlobalSize;
			half _SizeFadeEndValue;
			half _SizeFadeStartValue;
			half _MainAlbedoValue;
			half _MainMaskMinValue;
			half _DetailMeshMaxValue;
			half _MainColorMode;
			half _SecondUVsScaleMode;
			half _SecondMaskMinValue;
			half _DetailBlendMinValue;
			half _GradientMaxValue;
			half _DetailMode;
			half _SubsurfaceValue;
			half _SubsurfaceMaskValue;
			half _EmissiveTexMinValue;
			half _EmissiveTexMaxValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _FadeGlancingValue;
			half _SecondSmoothnessValue;
			half _DetailBlendMaxValue;
			half _VertexOcclusionOverlayMode;
			half _SecondNormalValue;
			half _DetailValue;
			half _GradientMinValue;
			half _MotionAmplitude_20;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _ColorsIntensityValue;
			half _OverlayProjectionValue;
			half _ColorsMaskValue;
			half _ColorsVariationValue;
			half _VertexOcclusionColorsMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _OverlayVariationValue;
			half _DetailNormalValue;
			half _SecondUVsMode;
			half _GlobalColors;
			half _MotionFacingValue;
			half _LayerMotionValue;
			half _MotionVariation_20;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _RenderDirect;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _Cutoff;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _IsVersion;
			half _HasEmissive;
			half _render_src;
			half _render_zw;
			half _render_dst;
			half _render_coverage;
			half _IsStandardShader;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageGlobalsVariation;
			half _IsTVEShader;
			half _HasOcclusion;
			half _IsIdentifier;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _VertexVariationMode;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MessageMotionVariation;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _MessageOcclusion;
			half _EmissiveMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_20;
			half _DetailMaskInvertMode;
			half _CategoryMotion;
			half _ColorsMaskMaxValue;
			half _RenderCoverage;
			half _MessageSubsurface;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderZWrite;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderClip;
			half _ColorsMaskMinValue;
			half _FadeConstantValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			float TVE_ColorsUsage[10];
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			half4 TVE_ColorsParams;
			half4 TVE_OverlayColor;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_SecondNormalTex);
			half TVE_WetnessContrast;
			half TVE_SubsurfaceValue;
			half TVE_OverlaySubsurface;
			half3 TVE_MainLightDirection;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 VertexPosition3588_g76351 = v.positionOS.xyz;
				float3 appendResult60_g76361 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76351 = ( appendResult60_g76361 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76351 = Mesh_PivotsData2831_g76351;
				float3 temp_output_2283_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				half3 VertexPos40_g76486 = temp_output_2283_0_g76351;
				half3 VertexPos40_g76487 = VertexPos40_g76486;
				float3 appendResult74_g76487 = (float3(VertexPos40_g76487.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76487 = appendResult74_g76487;
				float3 break84_g76487 = VertexPos40_g76487;
				float3 appendResult81_g76487 = (float3(0.0 , break84_g76487.y , break84_g76487.z));
				half3 VertexPosOtherAxis82_g76487 = appendResult81_g76487;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g76351 = ase_worldPos;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 WorldPosition_Shifted7477_g76351 = ( WorldPosition3905_g76351 - TVE_WorldOrigin );
				float4x4 break19_g76407 = GetObjectToWorldMatrix();
				float3 appendResult20_g76407 = (float3(break19_g76407[ 0 ][ 3 ] , break19_g76407[ 1 ][ 3 ] , break19_g76407[ 2 ][ 3 ]));
				float3 temp_output_122_0_g76407 = Mesh_PivotsData2831_g76351;
				float3 PivotsOnly105_g76407 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76407 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g76409 = ( appendResult20_g76407 + PivotsOnly105_g76407 );
				half3 WorldData19_g76409 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76409 = WorldData19_g76409;
				#else
				float3 staticSwitch14_g76409 = ObjectData20_g76409;
				#endif
				float3 temp_output_114_0_g76407 = staticSwitch14_g76409;
				float3 vertexToFrag4224_g76351 = temp_output_114_0_g76407;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				float3 lerpResult6766_g76351 = lerp( WorldPosition_Shifted7477_g76351 , ObjectPosition_Shifted7481_g76351 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76351 = lerpResult6766_g76351;
				half3 Input_Position419_g76527 = Motion_10_Position6738_g76351;
				float Input_MotionScale287_g76527 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76527 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76527 = (( Input_Position419_g76527 * Input_MotionScale287_g76527 * NoiseTex_Tilling735_g76527 * 0.0075 )).xz;
				float2 temp_output_447_0_g76356 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76351 = temp_output_447_0_g76356;
				half2 Input_DirectionWS423_g76527 = Global_Wind_DirectionWS4683_g76351;
				float lerpResult128_g76528 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76527 = _MotionSpeed_10;
				half Input_MotionVariation284_g76527 = _MotionVariation_10;
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = v.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				half Input_GlobalMeshVariation569_g76527 = Global_MeshVariation5104_g76351;
				float temp_output_630_0_g76527 = ( ( ( lerpResult128_g76528 * Input_MotionSpeed62_g76527 ) + ( Input_MotionVariation284_g76527 * Input_GlobalMeshVariation569_g76527 ) ) * 0.03 );
				float temp_output_607_0_g76527 = frac( temp_output_630_0_g76527 );
				float4 lerpResult590_g76527 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * temp_output_607_0_g76527 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * frac( ( temp_output_630_0_g76527 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76527 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76527 = lerpResult590_g76527;
				float2 temp_output_645_0_g76527 = ((Noise_Complex703_g76527).rg*2.0 + -1.0);
				float2 break650_g76527 = temp_output_645_0_g76527;
				float3 appendResult649_g76527 = (float3(break650_g76527.x , 0.0 , break650_g76527.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76527 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76510 = Global_Noise_OS5548_g76351;
				float2 break448_g76356 = temp_output_447_0_g76356;
				float3 appendResult452_g76356 = (float3(break448_g76356.x , 0.0 , break448_g76356.y));
				half2 Global_Wind_DirectionOS5692_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76510 = Global_Wind_DirectionOS5692_g76351;
				float temp_output_84_0_g76362 = _LayerMotionValue;
				float temp_output_19_0_g76366 = TVE_MotionUsage[(int)temp_output_84_0_g76362];
				float4 temp_output_91_19_g76362 = TVE_MotionCoords;
				half2 UV94_g76362 = ( (temp_output_91_19_g76362).zw + ( (temp_output_91_19_g76362).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76362 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76362,temp_output_84_0_g76362, 0.0 );
				float4 temp_output_17_0_g76366 = tex2DArrayNode50_g76362;
				float4 temp_output_112_19_g76362 = TVE_MotionParams;
				float4 temp_output_3_0_g76366 = temp_output_112_19_g76362;
				float4 ifLocalVar18_g76366 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76366 >= 0.5 )
				ifLocalVar18_g76366 = temp_output_17_0_g76366;
				else
				ifLocalVar18_g76366 = temp_output_3_0_g76366;
				float4 lerpResult22_g76366 = lerp( temp_output_3_0_g76366 , temp_output_17_0_g76366 , temp_output_19_0_g76366);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76366 = lerpResult22_g76366;
				#else
				float4 staticSwitch24_g76366 = ifLocalVar18_g76366;
				#endif
				half4 Global_Motion_Params3909_g76351 = staticSwitch24_g76366;
				float4 break322_g76356 = Global_Motion_Params3909_g76351;
				float lerpResult457_g76356 = lerp( break322_g76356.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76356 = ( 1.0 - lerpResult457_g76356 );
				half Global_Wind_Power2223_g76351 = ( 1.0 - ( temp_output_459_0_g76356 * temp_output_459_0_g76356 ) );
				half Input_WindPower449_g76510 = Global_Wind_Power2223_g76351;
				float2 lerpResult516_g76510 = lerp( Input_Noise_DirectionOS487_g76510 , Input_Wind_DirectionOS458_g76510 , ( Input_WindPower449_g76510 * 0.6 ));
				half Mesh_Motion_107572_g76351 = v.ase_color.a;
				half Input_MeshHeight388_g76510 = Mesh_Motion_107572_g76351;
				half ObjectData20_g76511 = Input_MeshHeight388_g76510;
				float enc62_g76576 = v.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76576 = DecodeFloatToVector2( enc62_g76576 );
				float2 break63_g76576 = ( localDecodeFloatToVector262_g76576 * 100.0 );
				float Bounds_Height5230_g76351 = break63_g76576.x;
				half Input_BoundsHeight390_g76510 = Bounds_Height5230_g76351;
				half WorldData19_g76511 = ( Input_MeshHeight388_g76510 * Input_MeshHeight388_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76511 = WorldData19_g76511;
				#else
				float staticSwitch14_g76511 = ObjectData20_g76511;
				#endif
				half Final_Motion10_Mask321_g76510 = ( staticSwitch14_g76511 * 2.0 );
				half Input_BendingAmplitude376_g76510 = _MotionAmplitude_10;
				half Global_MotionValue640_g76510 = TVE_MotionValue_10;
				half2 Final_Bending631_g76510 = ( lerpResult516_g76510 * ( Final_Motion10_Mask321_g76510 * Input_BendingAmplitude376_g76510 * Input_WindPower449_g76510 * Input_WindPower449_g76510 * Global_MotionValue640_g76510 ) );
				float2 appendResult433_g76356 = (float2(break322_g76356.x , break322_g76356.y));
				float2 temp_output_436_0_g76356 = (appendResult433_g76356*2.0 + -1.0);
				float2 break441_g76356 = temp_output_436_0_g76356;
				float3 appendResult440_g76356 = (float3(break441_g76356.x , 0.0 , break441_g76356.y));
				half2 Global_React_DirectionOS39_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76510 = Global_React_DirectionOS39_g76351;
				float clampResult17_g76513 = clamp( Input_MeshHeight388_g76510 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76512 = 0.0;
				half Input_InteractionUseMask62_g76510 = _InteractionMaskValue;
				float temp_output_10_0_g76512 = ( Input_InteractionUseMask62_g76510 - temp_output_7_0_g76512 );
				half Final_InteractionRemap594_g76510 = saturate( ( ( clampResult17_g76513 - temp_output_7_0_g76512 ) / ( temp_output_10_0_g76512 + 0.0001 ) ) );
				half ObjectData20_g76514 = Final_InteractionRemap594_g76510;
				half WorldData19_g76514 = ( Final_InteractionRemap594_g76510 * Final_InteractionRemap594_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76514 = WorldData19_g76514;
				#else
				float staticSwitch14_g76514 = ObjectData20_g76514;
				#endif
				half Final_InteractionMask373_g76510 = ( staticSwitch14_g76514 * 2.0 );
				half Input_InteractionAmplitude58_g76510 = _InteractionAmplitude;
				half2 Final_Interaction632_g76510 = ( Input_React_DirectionOS358_g76510 * Final_InteractionMask373_g76510 * Input_InteractionAmplitude58_g76510 );
				half Global_Interaction_Mask66_g76351 = ( break322_g76356.w * break322_g76356.w * break322_g76356.w * break322_g76356.w );
				float Input_InteractionGlobalMask330_g76510 = Global_Interaction_Mask66_g76351;
				half Final_InteractionValue525_g76510 = saturate( ( Input_InteractionAmplitude58_g76510 * Input_InteractionGlobalMask330_g76510 ) );
				float2 lerpResult551_g76510 = lerp( Final_Bending631_g76510 , Final_Interaction632_g76510 , Final_InteractionValue525_g76510);
				float2 break364_g76510 = lerpResult551_g76510;
				float3 appendResult638_g76510 = (float3(break364_g76510.x , 0.0 , break364_g76510.y));
				half3 Motion_10_Interaction7519_g76351 = appendResult638_g76510;
				half3 Angle44_g76486 = Motion_10_Interaction7519_g76351;
				half Angle44_g76487 = (Angle44_g76486).z;
				half3 VertexPos40_g76488 = ( VertexPosRotationAxis50_g76487 + ( VertexPosOtherAxis82_g76487 * cos( Angle44_g76487 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76487 ) * sin( Angle44_g76487 ) ) );
				float3 appendResult74_g76488 = (float3(0.0 , 0.0 , VertexPos40_g76488.z));
				half3 VertexPosRotationAxis50_g76488 = appendResult74_g76488;
				float3 break84_g76488 = VertexPos40_g76488;
				float3 appendResult81_g76488 = (float3(break84_g76488.x , break84_g76488.y , 0.0));
				half3 VertexPosOtherAxis82_g76488 = appendResult81_g76488;
				half Angle44_g76488 = -(Angle44_g76486).x;
				half3 Input_Position419_g76566 = WorldPosition_Shifted7477_g76351;
				float3 break459_g76566 = Input_Position419_g76566;
				float Sum_Position446_g76566 = ( break459_g76566.x + break459_g76566.y + break459_g76566.z );
				half Input_MotionScale321_g76566 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76566 = _MotionVariation_20;
				half Input_GlobalVariation400_g76566 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76567 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76566 = _MotionSpeed_20;
				float temp_output_404_0_g76566 = ( lerpResult128_g76567 * Input_MotionSpeed62_g76566 );
				half Motion_SineA450_g76566 = sin( ( ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) + ( Input_MotionVariation330_g76566 * Input_GlobalVariation400_g76566 ) + temp_output_404_0_g76566 ) );
				half Motion_SineB395_g76566 = sin( ( ( temp_output_404_0_g76566 * 0.6842 ) + ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) ) );
				half3 Input_Position419_g76585 = VertexPosition3588_g76351;
				float3 normalizeResult518_g76585 = normalize( Input_Position419_g76585 );
				half2 Input_DirectionOS423_g76585 = Global_React_DirectionOS39_g76351;
				float2 break521_g76585 = -Input_DirectionOS423_g76585;
				float3 appendResult522_g76585 = (float3(break521_g76585.x , 0.0 , break521_g76585.y));
				float dotResult519_g76585 = dot( normalizeResult518_g76585 , appendResult522_g76585 );
				half Input_Value62_g76585 = _MotionFacingValue;
				float lerpResult524_g76585 = lerp( 1.0 , (dotResult519_g76585*0.5 + 0.5) , Input_Value62_g76585);
				half ObjectData20_g76586 = max( lerpResult524_g76585 , 0.001 );
				half WorldData19_g76586 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76586 = WorldData19_g76586;
				#else
				float staticSwitch14_g76586 = ObjectData20_g76586;
				#endif
				half Motion_FacingMask5214_g76351 = staticSwitch14_g76586;
				half Motion_20_Amplitude4381_g76351 = Motion_FacingMask5214_g76351;
				half Input_MotionAmplitude384_g76566 = Motion_20_Amplitude4381_g76351;
				half Input_GlobalWind407_g76566 = Global_Wind_Power2223_g76351;
				float4 break638_g76527 = abs( Noise_Complex703_g76527 );
				half Global_Noise_B5526_g76351 = break638_g76527.b;
				half Input_GlobalNoise411_g76566 = Global_Noise_B5526_g76351;
				float lerpResult413_g76566 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76566);
				half Motion_Amplitude418_g76566 = ( Input_MotionAmplitude384_g76566 * Input_GlobalWind407_g76566 * pow( Input_GlobalNoise411_g76566 , lerpResult413_g76566 ) );
				half Input_Squash58_g76566 = _MotionAmplitude_20;
				float enc59_g76576 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76576 = DecodeFloatToVector2( enc59_g76576 );
				float2 break61_g76576 = localDecodeFloatToVector259_g76576;
				half Mesh_Motion_2060_g76351 = break61_g76576.x;
				half Input_MeshMotion_20388_g76566 = Mesh_Motion_2060_g76351;
				float Bounds_Radius5231_g76351 = break63_g76576.y;
				half Input_BoundsRadius390_g76566 = Bounds_Radius5231_g76351;
				half Global_MotionValue462_g76566 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76566 = Global_React_DirectionOS39_g76351;
				float2 break371_g76566 = Input_DirectionOS366_g76566;
				float3 appendResult372_g76566 = (float3(break371_g76566.x , ( Motion_SineA450_g76566 * 0.3 ) , break371_g76566.y));
				half3 Motion_20_Squash4418_g76351 = ( ( (max( Motion_SineA450_g76566 , Motion_SineB395_g76566 )*0.5 + 0.5) * Motion_Amplitude418_g76566 * Input_Squash58_g76566 * Input_MeshMotion_20388_g76566 * Input_BoundsRadius390_g76566 * Global_MotionValue462_g76566 ) * appendResult372_g76566 );
				half3 VertexPos40_g76472 = ( ( VertexPosRotationAxis50_g76488 + ( VertexPosOtherAxis82_g76488 * cos( Angle44_g76488 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76488 ) * sin( Angle44_g76488 ) ) ) + Motion_20_Squash4418_g76351 );
				float3 appendResult74_g76472 = (float3(0.0 , VertexPos40_g76472.y , 0.0));
				float3 VertexPosRotationAxis50_g76472 = appendResult74_g76472;
				float3 break84_g76472 = VertexPos40_g76472;
				float3 appendResult81_g76472 = (float3(break84_g76472.x , 0.0 , break84_g76472.z));
				float3 VertexPosOtherAxis82_g76472 = appendResult81_g76472;
				half Input_Rolling379_g76566 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76351 = ( Motion_SineA450_g76566 * Motion_Amplitude418_g76566 * Input_Rolling379_g76566 * Input_MeshMotion_20388_g76566 * Global_MotionValue462_g76566 );
				half Angle44_g76472 = Motion_20_Rolling5257_g76351;
				half3 Input_Position500_g76523 = WorldPosition_Shifted7477_g76351;
				half Input_MotionScale321_g76523 = _MotionScale_32;
				half Input_MotionVariation330_g76523 = _MotionVariation_32;
				half Input_GlobalVariation372_g76523 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76524 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76523 = _MotionSpeed_32;
				float4 tex2DNode460_g76523 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76523).xz * Input_MotionScale321_g76523 * 0.03 ) + ( Input_MotionVariation330_g76523 * Input_GlobalVariation372_g76523 ) + ( lerpResult128_g76524 * Input_MotionSpeed62_g76523 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76523 = (float3(tex2DNode460_g76523.r , tex2DNode460_g76523.g , tex2DNode460_g76523.b));
				half3 Flutter_Texture489_g76523 = (appendResult462_g76523*2.0 + -1.0);
				float temp_output_7_0_g76401 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76401 = ( TVE_MotionFadeStart - temp_output_7_0_g76401 );
				half Motion_FadeOut4005_g76351 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76401 ) / ( temp_output_10_0_g76401 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76351 = ( _MotionAmplitude_32 * Motion_FacingMask5214_g76351 * Motion_FadeOut4005_g76351 );
				half Input_MotionAmplitude58_g76523 = Motion_30_Amplitude4960_g76351;
				half Mesh_Motion_30144_g76351 = break61_g76576.y;
				half Input_MeshMotion_30374_g76523 = Mesh_Motion_30144_g76351;
				half Input_GlobalWind471_g76523 = Global_Wind_Power2223_g76351;
				half Global_MotionValue503_g76523 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g76523 = Global_Noise_B5526_g76351;
				float lerpResult466_g76523 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76523);
				half Flutter_Amplitude491_g76523 = ( Input_MotionAmplitude58_g76523 * Input_MeshMotion_30374_g76523 * Input_GlobalWind471_g76523 * Global_MotionValue503_g76523 * pow( Input_GlobalNoise472_g76523 , lerpResult466_g76523 ) );
				half3 Motion_30_Flutter263_g76351 = ( Flutter_Texture489_g76523 * Flutter_Amplitude491_g76523 );
				float3 Vertex_Motion_Object833_g76351 = ( ( VertexPosRotationAxis50_g76472 + ( VertexPosOtherAxis82_g76472 * cos( Angle44_g76472 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76472 ) * sin( Angle44_g76472 ) ) ) + Motion_30_Flutter263_g76351 );
				half3 ObjectData20_g76419 = Vertex_Motion_Object833_g76351;
				float3 temp_output_3474_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				float3 Vertex_Motion_World1118_g76351 = ( ( ( temp_output_3474_0_g76351 + Motion_10_Interaction7519_g76351 ) + Motion_20_Squash4418_g76351 ) + Motion_30_Flutter263_g76351 );
				half3 WorldData19_g76419 = Vertex_Motion_World1118_g76351;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76419 = WorldData19_g76419;
				#else
				float3 staticSwitch14_g76419 = ObjectData20_g76419;
				#endif
				float3 temp_output_7495_0_g76351 = staticSwitch14_g76419;
				float3 Vertex_Motion7493_g76351 = temp_output_7495_0_g76351;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 break2709_g76351 = cross( ViewDirection3963_g76351 , half3(0,1,0) );
				float3 appendResult2710_g76351 = (float3(-break2709_g76351.z , 0.0 , break2709_g76351.x));
				float3 appendResult2667_g76351 = (float3(Global_MeshVariation5104_g76351 , 0.5 , Global_MeshVariation5104_g76351));
				half Mesh_Height1524_g76351 = v.ase_color.a;
				float dotResult2212_g76351 = dot( ViewDirection3963_g76351 , float3(0,1,0) );
				half Mask_HView2656_g76351 = dotResult2212_g76351;
				float saferPower2652_g76351 = abs( Mask_HView2656_g76351 );
				half3 Grass_Perspective2661_g76351 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76351 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76351*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76351 * pow( saferPower2652_g76351 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76383 = _LayerVertexValue;
				float temp_output_19_0_g76387 = TVE_VertexUsage[(int)temp_output_84_0_g76383];
				float4 temp_output_94_19_g76383 = TVE_VertexCoords;
				half2 UV97_g76383 = ( (temp_output_94_19_g76383).zw + ( (temp_output_94_19_g76383).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76383 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76383,temp_output_84_0_g76383, 0.0 );
				float4 temp_output_17_0_g76387 = tex2DArrayNode50_g76383;
				float4 temp_output_111_19_g76383 = TVE_VertexParams;
				float4 temp_output_3_0_g76387 = temp_output_111_19_g76383;
				float4 ifLocalVar18_g76387 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76387 >= 0.5 )
				ifLocalVar18_g76387 = temp_output_17_0_g76387;
				else
				ifLocalVar18_g76387 = temp_output_3_0_g76387;
				float4 lerpResult22_g76387 = lerp( temp_output_3_0_g76387 , temp_output_17_0_g76387 , temp_output_19_0_g76387);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76387 = lerpResult22_g76387;
				#else
				float4 staticSwitch24_g76387 = ifLocalVar18_g76387;
				#endif
				half4 Global_Vertex_Params4173_g76351 = staticSwitch24_g76387;
				float4 break322_g76388 = Global_Vertex_Params4173_g76351;
				half Global_VertexSize174_g76351 = saturate( break322_g76388.w );
				float lerpResult346_g76351 = lerp( 1.0 , Global_VertexSize174_g76351 , _GlobalSize);
				float3 appendResult3480_g76351 = (float3(lerpResult346_g76351 , lerpResult346_g76351 , lerpResult346_g76351));
				half3 ObjectData20_g76416 = appendResult3480_g76351;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76416 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76416 = WorldData19_g76416;
				#else
				float3 staticSwitch14_g76416 = ObjectData20_g76416;
				#endif
				half3 Vertex_Size1741_g76351 = staticSwitch14_g76416;
				float temp_output_7_0_g76417 = _SizeFadeEndValue;
				float temp_output_10_0_g76417 = ( _SizeFadeStartValue - temp_output_7_0_g76417 );
				float temp_output_7453_0_g76351 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76351 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76417 ) / ( temp_output_10_0_g76417 + 0.0001 ) ) );
				float3 appendResult3482_g76351 = (float3(temp_output_7453_0_g76351 , temp_output_7453_0_g76351 , temp_output_7453_0_g76351));
				half3 ObjectData20_g76415 = appendResult3482_g76351;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76415 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76415 = WorldData19_g76415;
				#else
				float3 staticSwitch14_g76415 = ObjectData20_g76415;
				#endif
				float3 Vertex_SizeFade1740_g76351 = staticSwitch14_g76415;
				float3 lerpResult16_g76420 = lerp( VertexPosition3588_g76351 , ( ( ( Vertex_Motion7493_g76351 + Grass_Perspective2661_g76351 ) * Vertex_Size1741_g76351 * Vertex_SizeFade1740_g76351 ) + Mesh_PivotsOS2291_g76351 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76351 = lerpResult16_g76420;
				float3 Final_VertexPosition890_g76351 = ( temp_output_4912_0_g76351 + _DisableSRPBatcher );
				
				float4 break33_g76581 = _second_uvs_mode;
				float2 temp_output_30_0_g76581 = ( v.ase_texcoord.xy * break33_g76581.x );
				float2 appendResult21_g76576 = (float2(v.ase_texcoord1.z , v.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76351 = appendResult21_g76576;
				float2 temp_output_29_0_g76581 = ( Mesh_DetailCoord3_g76351 * break33_g76581.y );
				float2 temp_output_31_0_g76581 = ( (WorldPosition_Shifted7477_g76351).xz * break33_g76581.z );
				half2 Second_UVs_Tilling7609_g76351 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7610_g76351 = ( 1.0 / Second_UVs_Tilling7609_g76351 );
				float2 lerpResult7614_g76351 = lerp( Second_UVs_Tilling7609_g76351 , Second_UVs_Scale7610_g76351 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7605_g76351 = (_SecondUVs).zw;
				float2 vertexToFrag11_g76377 = ( ( ( temp_output_30_0_g76581 + temp_output_29_0_g76581 + temp_output_31_0_g76581 ) * lerpResult7614_g76351 ) + Second_UVs_Offset7605_g76351 );
				o.ase_texcoord3.xy = vertexToFrag11_g76377;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				o.ase_texcoord7.xyz = vertexToFrag3890_g76351;
				o.ase_texcoord8.xyz = vertexToFrag4224_g76351;
				half Global_Noise_A4860_g76351 = break638_g76527.a;
				half Tint_Highlight_Value3231_g76351 = ( Global_Noise_A4860_g76351 * Global_Wind_Power2223_g76351 * Motion_FadeOut4005_g76351 * Mesh_Height1524_g76351 );
				float vertexToFrag11_g76392 = Tint_Highlight_Value3231_g76351;
				o.ase_texcoord3.z = vertexToFrag11_g76392;
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76351;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g76351 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76351 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76351 );
				float3 lerpResult6223_g76351 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76351).rgb , _MainAlbedoValue);
				float4 tex2DNode35_g76351 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				half Main_Mask57_g76351 = tex2DNode35_g76351.b;
				float clampResult17_g76560 = clamp( Main_Mask57_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76561 = _MainMaskMinValue;
				float temp_output_10_0_g76561 = ( _MainMaskMaxValue - temp_output_7_0_g76561 );
				half Main_Mask_Remap5765_g76351 = saturate( ( ( clampResult17_g76560 - temp_output_7_0_g76561 ) / ( temp_output_10_0_g76561 + 0.0001 ) ) );
				float lerpResult7671_g76351 = lerp( 1.0 , Main_Mask_Remap5765_g76351 , _MainColorMode);
				float4 lerpResult7654_g76351 = lerp( _MainColorTwo , _MainColor , lerpResult7671_g76351);
				half3 Main_Color_RGB7657_g76351 = (lerpResult7654_g76351).rgb;
				half3 Main_Albedo99_g76351 = ( lerpResult6223_g76351 * Main_Color_RGB7657_g76351 );
				float2 vertexToFrag11_g76377 = IN.ase_texcoord3.xy;
				half2 Second_UVs17_g76351 = vertexToFrag11_g76377;
				float4 tex2DNode89_g76351 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76351 );
				float3 lerpResult6225_g76351 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76351).rgb , _SecondAlbedoValue);
				float4 tex2DNode33_g76351 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				half Second_Mask81_g76351 = tex2DNode33_g76351.b;
				float clampResult17_g76563 = clamp( Second_Mask81_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76564 = _SecondMaskMinValue;
				float temp_output_10_0_g76564 = ( _SecondMaskMaxValue - temp_output_7_0_g76564 );
				half Second_Mask_Remap6130_g76351 = saturate( ( ( clampResult17_g76563 - temp_output_7_0_g76564 ) / ( temp_output_10_0_g76564 + 0.0001 ) ) );
				float lerpResult7672_g76351 = lerp( 1.0 , Second_Mask_Remap6130_g76351 , _SecondColorMode);
				float4 lerpResult7662_g76351 = lerp( _SecondColorTwo , _SecondColor , lerpResult7672_g76351);
				half3 Second_Color_RGB7663_g76351 = (lerpResult7662_g76351).rgb;
				half3 Second_Albedo153_g76351 = ( lerpResult6225_g76351 * Second_Color_RGB7663_g76351 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g76393 = 2.0;
				#else
				float staticSwitch1_g76393 = 4.594794;
				#endif
				float3 lerpResult4834_g76351 = lerp( ( Main_Albedo99_g76351 * Second_Albedo153_g76351 * staticSwitch1_g76393 ) , Second_Albedo153_g76351 , _DetailBlendMode);
				float lerpResult6885_g76351 = lerp( Main_Mask57_g76351 , Second_Mask81_g76351 , _DetailMaskMode);
				float clampResult17_g76483 = clamp( lerpResult6885_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76482 = _DetailMaskMinValue;
				float temp_output_10_0_g76482 = ( _DetailMaskMaxValue - temp_output_7_0_g76482 );
				half Blend_Mask_Texture6794_g76351 = saturate( ( ( clampResult17_g76483 - temp_output_7_0_g76482 ) / ( temp_output_10_0_g76482 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76351 = IN.ase_color.b;
				half4 Normal_Packed45_g76559 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				float2 appendResult58_g76559 = (float2(( (Normal_Packed45_g76559).x * (Normal_Packed45_g76559).w ) , (Normal_Packed45_g76559).y));
				half2 Normal_Default50_g76559 = appendResult58_g76559;
				half2 Normal_ASTC41_g76559 = (Normal_Packed45_g76559).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76559 = Normal_ASTC41_g76559;
				#else
				float2 staticSwitch38_g76559 = Normal_Default50_g76559;
				#endif
				half2 Normal_NO_DTX544_g76559 = (Normal_Packed45_g76559).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76559 = Normal_NO_DTX544_g76559;
				#else
				float2 staticSwitch37_g76559 = staticSwitch38_g76559;
				#endif
				float2 temp_output_6555_0_g76351 = ( (staticSwitch37_g76559*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76351 = (float3(temp_output_6555_0_g76351 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g76351 = appendResult7388_g76351;
				float3 worldNormal7389_g76351 = float3(dot(tanToWorld0,tanNormal7389_g76351), dot(tanToWorld1,tanNormal7389_g76351), dot(tanToWorld2,tanNormal7389_g76351));
				half3 Main_NormalWS7390_g76351 = worldNormal7389_g76351;
				float lerpResult6884_g76351 = lerp( Mesh_DetailMask90_g76351 , ((Main_NormalWS7390_g76351).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76481 = clamp( lerpResult6884_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76480 = _DetailMeshMinValue;
				float temp_output_10_0_g76480 = ( _DetailMeshMaxValue - temp_output_7_0_g76480 );
				half Blend_Mask_Mesh1540_g76351 = saturate( ( ( clampResult17_g76481 - temp_output_7_0_g76480 ) / ( temp_output_10_0_g76480 + 0.0001 ) ) );
				float clampResult17_g76504 = clamp( ( Blend_Mask_Texture6794_g76351 * Blend_Mask_Mesh1540_g76351 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76552 = _DetailBlendMinValue;
				float temp_output_10_0_g76552 = ( _DetailBlendMaxValue - temp_output_7_0_g76552 );
				half Blend_Mask147_g76351 = ( saturate( ( ( clampResult17_g76504 - temp_output_7_0_g76552 ) / ( temp_output_10_0_g76552 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g76351 = lerp( Main_Albedo99_g76351 , lerpResult4834_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float3 staticSwitch255_g76351 = lerpResult235_g76351;
				#else
				float3 staticSwitch255_g76351 = Main_Albedo99_g76351;
				#endif
				half3 Blend_Albedo265_g76351 = staticSwitch255_g76351;
				half Mesh_Height1524_g76351 = IN.ase_color.a;
				float temp_output_7_0_g76402 = _GradientMinValue;
				float temp_output_10_0_g76402 = ( _GradientMaxValue - temp_output_7_0_g76402 );
				half Tint_Gradient_Value2784_g76351 = saturate( ( ( Mesh_Height1524_g76351 - temp_output_7_0_g76402 ) / ( temp_output_10_0_g76402 + 0.0001 ) ) );
				float3 lerpResult2779_g76351 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Tint_Gradient_Value2784_g76351);
				float lerpResult6617_g76351 = lerp( Main_Mask_Remap5765_g76351 , Second_Mask_Remap6130_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6623_g76351 = lerpResult6617_g76351;
				#else
				float staticSwitch6623_g76351 = Main_Mask_Remap5765_g76351;
				#endif
				half Blend_Mask_Remap6621_g76351 = staticSwitch6623_g76351;
				half Tint_Gradient_Mask6207_g76351 = Blend_Mask_Remap6621_g76351;
				float3 lerpResult6208_g76351 = lerp( float3( 1,1,1 ) , lerpResult2779_g76351 , Tint_Gradient_Mask6207_g76351);
				half3 Tint_Gradient_Color5769_g76351 = lerpResult6208_g76351;
				half3 Tint_Noise_Color5770_g76351 = float3(1,1,1);
				half3 Tint_User_Color7335_g76351 = float3(1,1,1);
				float Mesh_Occlusion318_g76351 = IN.ase_color.g;
				float clampResult17_g76399 = clamp( Mesh_Occlusion318_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76405 = _VertexOcclusionMinValue;
				float temp_output_10_0_g76405 = ( _VertexOcclusionMaxValue - temp_output_7_0_g76405 );
				half Occlusion_Mask6432_g76351 = saturate( ( ( clampResult17_g76399 - temp_output_7_0_g76405 ) / ( temp_output_10_0_g76405 + 0.0001 ) ) );
				float3 lerpResult2945_g76351 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g76351);
				half3 Occlusion_Color648_g76351 = lerpResult2945_g76351;
				half3 Matcap_Color7428_g76351 = half3(0,0,0);
				half3 Blend_Albedo_Tinted2808_g76351 = ( ( Blend_Albedo265_g76351 * Tint_Gradient_Color5769_g76351 * Tint_Noise_Color5770_g76351 * Tint_User_Color7335_g76351 * Occlusion_Color648_g76351 ) + Matcap_Color7428_g76351 );
				float3 temp_output_3_0_g76397 = Blend_Albedo_Tinted2808_g76351;
				float dotResult20_g76397 = dot( temp_output_3_0_g76397 , float3(0.2126,0.7152,0.0722) );
				half Blend_Albedo_Grayscale5939_g76351 = dotResult20_g76397;
				float3 temp_cast_1 = (Blend_Albedo_Grayscale5939_g76351).xxx;
				float temp_output_82_0_g76372 = _LayerColorsValue;
				float temp_output_19_0_g76376 = TVE_ColorsUsage[(int)temp_output_82_0_g76372];
				float4 temp_output_91_19_g76372 = TVE_ColorsCoords;
				float3 vertexToFrag3890_g76351 = IN.ase_texcoord7.xyz;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 vertexToFrag4224_g76351 = IN.ase_texcoord8.xyz;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 lerpResult4822_g76351 = lerp( WorldPosition3905_g76351 , ObjectPosition4223_g76351 , _ColorsPositionMode);
				half2 UV94_g76372 = ( (temp_output_91_19_g76372).zw + ( (temp_output_91_19_g76372).xy * (lerpResult4822_g76351).xz ) );
				float4 tex2DArrayNode83_g76372 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, UV94_g76372,temp_output_82_0_g76372, 0.0 );
				float4 temp_output_17_0_g76376 = tex2DArrayNode83_g76372;
				float4 temp_output_92_86_g76372 = TVE_ColorsParams;
				float4 temp_output_3_0_g76376 = temp_output_92_86_g76372;
				float4 ifLocalVar18_g76376 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76376 >= 0.5 )
				ifLocalVar18_g76376 = temp_output_17_0_g76376;
				else
				ifLocalVar18_g76376 = temp_output_3_0_g76376;
				float4 lerpResult22_g76376 = lerp( temp_output_3_0_g76376 , temp_output_17_0_g76376 , temp_output_19_0_g76376);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76376 = lerpResult22_g76376;
				#else
				float4 staticSwitch24_g76376 = ifLocalVar18_g76376;
				#endif
				half4 Global_Colors_Params5434_g76351 = staticSwitch24_g76376;
				float4 temp_output_346_0_g76358 = Global_Colors_Params5434_g76351;
				half Global_Colors_A1701_g76351 = saturate( (temp_output_346_0_g76358).w );
				half Colors_Influence3668_g76351 = Global_Colors_A1701_g76351;
				float temp_output_6306_0_g76351 = ( 1.0 - Colors_Influence3668_g76351 );
				float3 lerpResult3618_g76351 = lerp( Blend_Albedo_Tinted2808_g76351 , temp_cast_1 , ( 1.0 - ( temp_output_6306_0_g76351 * temp_output_6306_0_g76351 ) ));
				half3 Global_Colors_RGB1700_g76351 = (temp_output_346_0_g76358).xyz;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g76389 = 2.0;
				#else
				float staticSwitch1_g76389 = 4.594794;
				#endif
				half3 Colors_RGB1954_g76351 = ( Global_Colors_RGB1700_g76351 * staticSwitch1_g76389 * _ColorsIntensityValue );
				float lerpResult7679_g76351 = lerp( 1.0 , Blend_Mask_Remap6621_g76351 , _ColorsMaskValue);
				half Colors_Value3692_g76351 = ( lerpResult7679_g76351 * _GlobalColors );
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = IN.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				float lerpResult3870_g76351 = lerp( 1.0 , Global_MeshVariation5104_g76351 , _ColorsVariationValue);
				half Colors_Variation3650_g76351 = lerpResult3870_g76351;
				half Occlusion_Alpha6463_g76351 = _VertexOcclusionColor.a;
				float lerpResult6459_g76351 = lerp( Occlusion_Mask6432_g76351 , ( 1.0 - Occlusion_Mask6432_g76351 ) , _VertexOcclusionColorsMode);
				float lerpResult6461_g76351 = lerp( Occlusion_Alpha6463_g76351 , 1.0 , lerpResult6459_g76351);
				half Occlusion_Colors6450_g76351 = lerpResult6461_g76351;
				float3 temp_output_3_0_g76398 = ( Blend_Albedo265_g76351 * Tint_Gradient_Color5769_g76351 * Tint_Noise_Color5770_g76351 );
				float dotResult20_g76398 = dot( temp_output_3_0_g76398 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g76351 = clamp( saturate( ( dotResult20_g76398 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g76351 = clampResult6740_g76351;
				float temp_output_7_0_g76489 = 0.1;
				float temp_output_10_0_g76489 = ( 0.2 - temp_output_7_0_g76489 );
				float lerpResult16_g76390 = lerp( 0.0 , saturate( ( ( ( Colors_Value3692_g76351 * Colors_Influence3668_g76351 * Colors_Variation3650_g76351 * Occlusion_Colors6450_g76351 * Blend_Albedo_Globals6410_g76351 ) - temp_output_7_0_g76489 ) / ( temp_output_10_0_g76489 + 0.0001 ) ) ) , TVE_IsEnabled);
				float3 lerpResult3628_g76351 = lerp( Blend_Albedo_Tinted2808_g76351 , ( lerpResult3618_g76351 * Colors_RGB1954_g76351 ) , lerpResult16_g76390);
				half3 Blend_Albedo_Colored_High6027_g76351 = lerpResult3628_g76351;
				half3 Blend_Albedo_Colored863_g76351 = Blend_Albedo_Colored_High6027_g76351;
				half3 Global_OverlayColor1758_g76351 = (TVE_OverlayColor).rgb;
				float temp_output_84_0_g76367 = _LayerExtrasValue;
				float temp_output_19_0_g76371 = TVE_ExtrasUsage[(int)temp_output_84_0_g76367];
				float4 temp_output_93_19_g76367 = TVE_ExtrasCoords;
				float3 lerpResult4827_g76351 = lerp( WorldPosition3905_g76351 , ObjectPosition4223_g76351 , _ExtrasPositionMode);
				half2 UV96_g76367 = ( (temp_output_93_19_g76367).zw + ( (temp_output_93_19_g76367).xy * (lerpResult4827_g76351).xz ) );
				float4 tex2DArrayNode48_g76367 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76367,temp_output_84_0_g76367, 0.0 );
				float4 temp_output_17_0_g76371 = tex2DArrayNode48_g76367;
				float4 temp_output_94_85_g76367 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76371 = temp_output_94_85_g76367;
				float4 ifLocalVar18_g76371 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76371 >= 0.5 )
				ifLocalVar18_g76371 = temp_output_17_0_g76371;
				else
				ifLocalVar18_g76371 = temp_output_3_0_g76371;
				float4 lerpResult22_g76371 = lerp( temp_output_3_0_g76371 , temp_output_17_0_g76371 , temp_output_19_0_g76371);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76371 = lerpResult22_g76371;
				#else
				float4 staticSwitch24_g76371 = ifLocalVar18_g76371;
				#endif
				half4 Global_Extras_Params5440_g76351 = staticSwitch24_g76371;
				float4 break456_g76381 = Global_Extras_Params5440_g76351;
				half Global_Extras_Overlay156_g76351 = break456_g76381.z;
				float lerpResult1065_g76351 = lerp( 1.0 , Global_MeshVariation5104_g76351 , _OverlayVariationValue);
				half Overlay_Variation4560_g76351 = lerpResult1065_g76351;
				half Overlay_Value5738_g76351 = ( _GlobalOverlay * Global_Extras_Overlay156_g76351 * Overlay_Variation4560_g76351 );
				half2 Main_Normal137_g76351 = temp_output_6555_0_g76351;
				float2 lerpResult3372_g76351 = lerp( float2( 0,0 ) , Main_Normal137_g76351 , _DetailNormalValue);
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				half4 Normal_Packed45_g76562 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				float2 appendResult58_g76562 = (float2(( (Normal_Packed45_g76562).x * (Normal_Packed45_g76562).w ) , (Normal_Packed45_g76562).y));
				half2 Normal_Default50_g76562 = appendResult58_g76562;
				half2 Normal_ASTC41_g76562 = (Normal_Packed45_g76562).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76562 = Normal_ASTC41_g76562;
				#else
				float2 staticSwitch38_g76562 = Normal_Default50_g76562;
				#endif
				half2 Normal_NO_DTX544_g76562 = (Normal_Packed45_g76562).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76562 = Normal_NO_DTX544_g76562;
				#else
				float2 staticSwitch37_g76562 = staticSwitch38_g76562;
				#endif
				float2 temp_output_6560_0_g76351 = ( (staticSwitch37_g76562*2.0 + -1.0) * _SecondNormalValue );
				half2 Normal_Planar45_g76565 = temp_output_6560_0_g76351;
				float2 break64_g76565 = Normal_Planar45_g76565;
				float3 appendResult65_g76565 = (float3(break64_g76565.x , 0.0 , break64_g76565.y));
				float2 temp_output_7603_0_g76351 = (mul( ase_worldToTangent, appendResult65_g76565 )).xy;
				float2 ifLocalVar7604_g76351 = 0;
				if( _SecondUVsMode >= 2.0 )
				ifLocalVar7604_g76351 = temp_output_7603_0_g76351;
				else
				ifLocalVar7604_g76351 = temp_output_6560_0_g76351;
				half2 Second_Normal179_g76351 = ifLocalVar7604_g76351;
				float2 temp_output_36_0_g76394 = ( lerpResult3372_g76351 + Second_Normal179_g76351 );
				float2 lerpResult3376_g76351 = lerp( Main_Normal137_g76351 , temp_output_36_0_g76394 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float2 staticSwitch267_g76351 = lerpResult3376_g76351;
				#else
				float2 staticSwitch267_g76351 = Main_Normal137_g76351;
				#endif
				half2 Blend_Normal312_g76351 = staticSwitch267_g76351;
				float3 appendResult7377_g76351 = (float3(Blend_Normal312_g76351 , 1.0));
				float3 tanNormal7376_g76351 = appendResult7377_g76351;
				float3 worldNormal7376_g76351 = float3(dot(tanToWorld0,tanNormal7376_g76351), dot(tanToWorld1,tanNormal7376_g76351), dot(tanToWorld2,tanNormal7376_g76351));
				half3 Blend_NormalWS7375_g76351 = worldNormal7376_g76351;
				float lerpResult7446_g76351 = lerp( (Blend_NormalWS7375_g76351).y , IN.ase_normal.y , Vertex_DynamicMode5112_g76351);
				float lerpResult6757_g76351 = lerp( 1.0 , saturate( lerpResult7446_g76351 ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g76351 = lerpResult6757_g76351;
				half Overlay_Shading6688_g76351 = Blend_Albedo_Globals6410_g76351;
				half Overlay_Custom6707_g76351 = 1.0;
				float lerpResult7693_g76351 = lerp( Occlusion_Mask6432_g76351 , ( 1.0 - Occlusion_Mask6432_g76351 ) , _VertexOcclusionOverlayMode);
				float lerpResult6467_g76351 = lerp( Occlusion_Alpha6463_g76351 , 1.0 , lerpResult7693_g76351);
				half Occlusion_Overlay6471_g76351 = lerpResult6467_g76351;
				float temp_output_7_0_g76403 = 0.1;
				float temp_output_10_0_g76403 = ( 0.2 - temp_output_7_0_g76403 );
				half Overlay_Mask_High6064_g76351 = saturate( ( ( ( Overlay_Value5738_g76351 * Overlay_Projection6081_g76351 * Overlay_Shading6688_g76351 * Overlay_Custom6707_g76351 * Occlusion_Overlay6471_g76351 ) - temp_output_7_0_g76403 ) / ( temp_output_10_0_g76403 + 0.0001 ) ) );
				half Overlay_Mask269_g76351 = Overlay_Mask_High6064_g76351;
				float3 lerpResult336_g76351 = lerp( Blend_Albedo_Colored863_g76351 , Global_OverlayColor1758_g76351 , Overlay_Mask269_g76351);
				half3 Blend_Albedo_Overlay359_g76351 = lerpResult336_g76351;
				half Global_WetnessContrast6502_g76351 = TVE_WetnessContrast;
				half Global_Extras_Wetness305_g76351 = break456_g76381.y;
				half Wetness_Value6343_g76351 = ( Global_Extras_Wetness305_g76351 * _GlobalWetness );
				float3 lerpResult6367_g76351 = lerp( Blend_Albedo_Overlay359_g76351 , ( Blend_Albedo_Overlay359_g76351 * Blend_Albedo_Overlay359_g76351 ) , ( Global_WetnessContrast6502_g76351 * Wetness_Value6343_g76351 ));
				half3 Blend_Albedo_Wetness6351_g76351 = lerpResult6367_g76351;
				float vertexToFrag11_g76392 = IN.ase_texcoord3.z;
				half3 Tint_Highlight_Color5771_g76351 = ( ( (_MotionHighlightColor).rgb * vertexToFrag11_g76392 ) + float3( 1,1,1 ) );
				float3 temp_output_6309_0_g76351 = ( Blend_Albedo_Wetness6351_g76351 * Tint_Highlight_Color5771_g76351 );
				half3 Subsurface_Color1722_g76351 = ( (_SubsurfaceColor).rgb * Blend_Albedo_Wetness6351_g76351 );
				half Global_Subsurface4041_g76351 = TVE_SubsurfaceValue;
				half Global_OverlaySubsurface5667_g76351 = TVE_OverlaySubsurface;
				float lerpResult7362_g76351 = lerp( 1.0 , Global_OverlaySubsurface5667_g76351 , Overlay_Value5738_g76351);
				half Overlay_Subsurface7361_g76351 = lerpResult7362_g76351;
				half Subsurface_Intensity1752_g76351 = ( _SubsurfaceValue * Global_Subsurface4041_g76351 * Overlay_Subsurface7361_g76351 );
				float lerpResult7680_g76351 = lerp( 1.0 , Blend_Mask_Remap6621_g76351 , _SubsurfaceMaskValue);
				half Subsurface_Mask1557_g76351 = lerpResult7680_g76351;
				half3 MainLight_Direction3926_g76351 = TVE_MainLightDirection;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float dotResult785_g76351 = dot( -MainLight_Direction3926_g76351 , ViewDirection3963_g76351 );
				float saferPower1624_g76351 = abs( saturate( dotResult785_g76351 ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g76351 = 0.0;
				#else
				float staticSwitch1602_g76351 = ( pow( saferPower1624_g76351 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
				#endif
				half Mask_Subsurface_View782_g76351 = staticSwitch1602_g76351;
				half3 Subsurface_Approximation1693_g76351 = ( Subsurface_Color1722_g76351 * Subsurface_Intensity1752_g76351 * Subsurface_Mask1557_g76351 * Mask_Subsurface_View782_g76351 );
				half3 Blend_Albedo_Subsurface149_g76351 = ( temp_output_6309_0_g76351 + Subsurface_Approximation1693_g76351 );
				half3 Blend_Albedo_RimLight7316_g76351 = Blend_Albedo_Subsurface149_g76351;
				
				float localCustomAlphaClip19_g76558 = ( 0.0 );
				half Main_Alpha316_g76351 = tex2DNode29_g76351.a;
				half Second_Alpha5007_g76351 = tex2DNode89_g76351.a;
				float lerpResult6153_g76351 = lerp( Main_Alpha316_g76351 , Second_Alpha5007_g76351 , Blend_Mask147_g76351);
				float lerpResult6785_g76351 = lerp( ( Main_Alpha316_g76351 * Second_Alpha5007_g76351 ) , lerpResult6153_g76351 , _DetailAlphaMode);
				#ifdef TVE_DETAIL
				float staticSwitch6158_g76351 = lerpResult6785_g76351;
				#else
				float staticSwitch6158_g76351 = Main_Alpha316_g76351;
				#endif
				half Blend_Alpha6157_g76351 = staticSwitch6158_g76351;
				half AlphaTreshold2132_g76351 = _AlphaClipValue;
				half Global_Extras_Alpha1033_g76351 = saturate( break456_g76381.w );
				float lerpResult5154_g76351 = lerp( 0.0 , Global_MeshVariation5104_g76351 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76351 = lerpResult5154_g76351;
				float Emissive_Alpha7625_g76351 = 0.0;
				float lerpResult6866_g76351 = lerp( ( 1.0 - Blend_Mask147_g76351 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_DETAIL
				float staticSwitch6612_g76351 = lerpResult6866_g76351;
				#else
				float staticSwitch6612_g76351 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76351 = staticSwitch6612_g76351;
				half Alpha_Mask6234_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5203_g76351 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76351 - saturate( ( Global_Alpha_Variation5158_g76351 + Emissive_Alpha7625_g76351 ) ) ) + ( Global_Extras_Alpha1033_g76351 * 0.1 ) ) ) , ( Alpha_Mask6234_g76351 * _GlobalAlpha ));
				float lerpResult16_g76395 = lerp( 1.0 , lerpResult5203_g76351 , TVE_IsEnabled);
				half Global_Alpha315_g76351 = lerpResult16_g76395;
				float3 normalizeResult3971_g76351 = normalize( cross( ddy( WorldPosition ) , ddx( WorldPosition ) ) );
				float3 WorldNormal_Derivates3972_g76351 = normalizeResult3971_g76351;
				float dotResult3851_g76351 = dot( ViewDirection3963_g76351 , WorldNormal_Derivates3972_g76351 );
				float lerpResult3993_g76351 = lerp( 1.0 , saturate( ( abs( dotResult3851_g76351 ) * 3.0 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g76351 = lerpResult3993_g76351;
				half Fade_Effects_A5360_g76351 = Fade_Glancing3853_g76351;
				float temp_output_7_0_g76404 = TVE_CameraFadeMin;
				float temp_output_10_0_g76404 = ( TVE_CameraFadeMax - temp_output_7_0_g76404 );
				float lerpResult4755_g76351 = lerp( 1.0 , saturate( saturate( ( ( distance( WorldPosition , _WorldSpaceCameraPos ) - temp_output_7_0_g76404 ) / ( temp_output_10_0_g76404 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76351 = lerpResult4755_g76351;
				half Fade_Effects_B6228_g76351 = ( Fade_Effects_A5360_g76351 * Fade_Camera3743_g76351 );
				half Fade_Mask5149_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5141_g76351 = lerp( 1.0 , ( Fade_Effects_B6228_g76351 * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76351);
				half Fade_Effects_C7653_g76351 = lerpResult5141_g76351;
				float temp_output_5865_0_g76351 = saturate( ( Fade_Effects_C7653_g76351 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76351 ) ).r ) );
				half Fade_Alpha3727_g76351 = temp_output_5865_0_g76351;
				half Final_Alpha7344_g76351 = min( ( ( Blend_Alpha6157_g76351 - AlphaTreshold2132_g76351 ) * Global_Alpha315_g76351 ) , Fade_Alpha3727_g76351 );
				float temp_output_3_0_g76558 = Final_Alpha7344_g76351;
				float Alpha19_g76558 = temp_output_3_0_g76558;
				float temp_output_15_0_g76558 = 0.01;
				float Treshold19_g76558 = temp_output_15_0_g76558;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#else
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76351 = (lerpResult7654_g76351).a;
				half Second_Color_Alpha6152_g76351 = (lerpResult7662_g76351).a;
				float lerpResult6168_g76351 = lerp( Main_Color_Alpha6121_g76351 , Second_Color_Alpha6152_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6174_g76351 = lerpResult6168_g76351;
				#else
				float staticSwitch6174_g76351 = Main_Color_Alpha6121_g76351;
				#endif
				half Blend_Color_Alpha6167_g76351 = staticSwitch6174_g76351;
				half Final_Clip914_g76351 = saturate( ( Alpha19_g76558 * Blend_Color_Alpha6167_g76351 ) );
				

				float3 BaseColor = Blend_Albedo_RimLight7316_g76351;
				float Alpha = Final_Clip914_g76351;
				float AlphaClipThreshold = 0.5;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY
			//#define SHADERPASS SHADERPASS_DEPTHNORMALS

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				float4 worldTangent : TEXCOORD2;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD3;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD4;
				#endif
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_color : COLOR;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SecondColor;
			half4 _MotionHighlightColor;
			half4 _SubsurfaceColor;
			half4 _NoiseMaskRemap;
			half4 _MainColorTwo;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColorTwo;
			half4 _MainUVs;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _DetailMeshRemap;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half4 _DetailMaskRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _RimLightRemap;
			half4 _MainColor;
			half3 _render_normals;
			half _SecondColorMode;
			half _DetailBlendMode;
			half _DetailMaskMode;
			half _DetailMaskMinValue;
			half _DetailMaskMaxValue;
			half _MainNormalValue;
			half _DetailMeshMode;
			half _DetailMeshMinValue;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _MainMaskMaxValue;
			half _SecondAlbedoValue;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			half _GlobalSize;
			half _SizeFadeEndValue;
			half _SizeFadeStartValue;
			half _MainAlbedoValue;
			half _MainMaskMinValue;
			half _DetailMeshMaxValue;
			half _MainColorMode;
			half _SecondUVsScaleMode;
			half _SecondMaskMinValue;
			half _DetailBlendMinValue;
			half _GradientMaxValue;
			half _DetailMode;
			half _SubsurfaceValue;
			half _SubsurfaceMaskValue;
			half _EmissiveTexMinValue;
			half _EmissiveTexMaxValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _FadeGlancingValue;
			half _SecondSmoothnessValue;
			half _DetailBlendMaxValue;
			half _VertexOcclusionOverlayMode;
			half _SecondNormalValue;
			half _DetailValue;
			half _GradientMinValue;
			half _MotionAmplitude_20;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _ColorsIntensityValue;
			half _OverlayProjectionValue;
			half _ColorsMaskValue;
			half _ColorsVariationValue;
			half _VertexOcclusionColorsMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _OverlayVariationValue;
			half _DetailNormalValue;
			half _SecondUVsMode;
			half _GlobalColors;
			half _MotionFacingValue;
			half _LayerMotionValue;
			half _MotionVariation_20;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _RenderDirect;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _Cutoff;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _IsVersion;
			half _HasEmissive;
			half _render_src;
			half _render_zw;
			half _render_dst;
			half _render_coverage;
			half _IsStandardShader;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageGlobalsVariation;
			half _IsTVEShader;
			half _HasOcclusion;
			half _IsIdentifier;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _VertexVariationMode;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MessageMotionVariation;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _MessageOcclusion;
			half _EmissiveMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_20;
			half _DetailMaskInvertMode;
			half _CategoryMotion;
			half _ColorsMaskMaxValue;
			half _RenderCoverage;
			half _MessageSubsurface;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderZWrite;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderClip;
			half _ColorsMaskMinValue;
			half _FadeConstantValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainNormalTex);
			TEXTURE2D(_SecondNormalTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			half TVE_OverlayNormalValue;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			half TVE_WetnessNormalValue;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g76351 = v.positionOS.xyz;
				float3 appendResult60_g76361 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76351 = ( appendResult60_g76361 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76351 = Mesh_PivotsData2831_g76351;
				float3 temp_output_2283_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				half3 VertexPos40_g76486 = temp_output_2283_0_g76351;
				half3 VertexPos40_g76487 = VertexPos40_g76486;
				float3 appendResult74_g76487 = (float3(VertexPos40_g76487.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76487 = appendResult74_g76487;
				float3 break84_g76487 = VertexPos40_g76487;
				float3 appendResult81_g76487 = (float3(0.0 , break84_g76487.y , break84_g76487.z));
				half3 VertexPosOtherAxis82_g76487 = appendResult81_g76487;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g76351 = ase_worldPos;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 WorldPosition_Shifted7477_g76351 = ( WorldPosition3905_g76351 - TVE_WorldOrigin );
				float4x4 break19_g76407 = GetObjectToWorldMatrix();
				float3 appendResult20_g76407 = (float3(break19_g76407[ 0 ][ 3 ] , break19_g76407[ 1 ][ 3 ] , break19_g76407[ 2 ][ 3 ]));
				float3 temp_output_122_0_g76407 = Mesh_PivotsData2831_g76351;
				float3 PivotsOnly105_g76407 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76407 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g76409 = ( appendResult20_g76407 + PivotsOnly105_g76407 );
				half3 WorldData19_g76409 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76409 = WorldData19_g76409;
				#else
				float3 staticSwitch14_g76409 = ObjectData20_g76409;
				#endif
				float3 temp_output_114_0_g76407 = staticSwitch14_g76409;
				float3 vertexToFrag4224_g76351 = temp_output_114_0_g76407;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				float3 lerpResult6766_g76351 = lerp( WorldPosition_Shifted7477_g76351 , ObjectPosition_Shifted7481_g76351 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76351 = lerpResult6766_g76351;
				half3 Input_Position419_g76527 = Motion_10_Position6738_g76351;
				float Input_MotionScale287_g76527 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76527 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76527 = (( Input_Position419_g76527 * Input_MotionScale287_g76527 * NoiseTex_Tilling735_g76527 * 0.0075 )).xz;
				float2 temp_output_447_0_g76356 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76351 = temp_output_447_0_g76356;
				half2 Input_DirectionWS423_g76527 = Global_Wind_DirectionWS4683_g76351;
				float lerpResult128_g76528 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76527 = _MotionSpeed_10;
				half Input_MotionVariation284_g76527 = _MotionVariation_10;
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = v.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				half Input_GlobalMeshVariation569_g76527 = Global_MeshVariation5104_g76351;
				float temp_output_630_0_g76527 = ( ( ( lerpResult128_g76528 * Input_MotionSpeed62_g76527 ) + ( Input_MotionVariation284_g76527 * Input_GlobalMeshVariation569_g76527 ) ) * 0.03 );
				float temp_output_607_0_g76527 = frac( temp_output_630_0_g76527 );
				float4 lerpResult590_g76527 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * temp_output_607_0_g76527 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * frac( ( temp_output_630_0_g76527 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76527 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76527 = lerpResult590_g76527;
				float2 temp_output_645_0_g76527 = ((Noise_Complex703_g76527).rg*2.0 + -1.0);
				float2 break650_g76527 = temp_output_645_0_g76527;
				float3 appendResult649_g76527 = (float3(break650_g76527.x , 0.0 , break650_g76527.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76527 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76510 = Global_Noise_OS5548_g76351;
				float2 break448_g76356 = temp_output_447_0_g76356;
				float3 appendResult452_g76356 = (float3(break448_g76356.x , 0.0 , break448_g76356.y));
				half2 Global_Wind_DirectionOS5692_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76510 = Global_Wind_DirectionOS5692_g76351;
				float temp_output_84_0_g76362 = _LayerMotionValue;
				float temp_output_19_0_g76366 = TVE_MotionUsage[(int)temp_output_84_0_g76362];
				float4 temp_output_91_19_g76362 = TVE_MotionCoords;
				half2 UV94_g76362 = ( (temp_output_91_19_g76362).zw + ( (temp_output_91_19_g76362).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76362 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76362,temp_output_84_0_g76362, 0.0 );
				float4 temp_output_17_0_g76366 = tex2DArrayNode50_g76362;
				float4 temp_output_112_19_g76362 = TVE_MotionParams;
				float4 temp_output_3_0_g76366 = temp_output_112_19_g76362;
				float4 ifLocalVar18_g76366 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76366 >= 0.5 )
				ifLocalVar18_g76366 = temp_output_17_0_g76366;
				else
				ifLocalVar18_g76366 = temp_output_3_0_g76366;
				float4 lerpResult22_g76366 = lerp( temp_output_3_0_g76366 , temp_output_17_0_g76366 , temp_output_19_0_g76366);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76366 = lerpResult22_g76366;
				#else
				float4 staticSwitch24_g76366 = ifLocalVar18_g76366;
				#endif
				half4 Global_Motion_Params3909_g76351 = staticSwitch24_g76366;
				float4 break322_g76356 = Global_Motion_Params3909_g76351;
				float lerpResult457_g76356 = lerp( break322_g76356.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76356 = ( 1.0 - lerpResult457_g76356 );
				half Global_Wind_Power2223_g76351 = ( 1.0 - ( temp_output_459_0_g76356 * temp_output_459_0_g76356 ) );
				half Input_WindPower449_g76510 = Global_Wind_Power2223_g76351;
				float2 lerpResult516_g76510 = lerp( Input_Noise_DirectionOS487_g76510 , Input_Wind_DirectionOS458_g76510 , ( Input_WindPower449_g76510 * 0.6 ));
				half Mesh_Motion_107572_g76351 = v.ase_color.a;
				half Input_MeshHeight388_g76510 = Mesh_Motion_107572_g76351;
				half ObjectData20_g76511 = Input_MeshHeight388_g76510;
				float enc62_g76576 = v.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76576 = DecodeFloatToVector2( enc62_g76576 );
				float2 break63_g76576 = ( localDecodeFloatToVector262_g76576 * 100.0 );
				float Bounds_Height5230_g76351 = break63_g76576.x;
				half Input_BoundsHeight390_g76510 = Bounds_Height5230_g76351;
				half WorldData19_g76511 = ( Input_MeshHeight388_g76510 * Input_MeshHeight388_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76511 = WorldData19_g76511;
				#else
				float staticSwitch14_g76511 = ObjectData20_g76511;
				#endif
				half Final_Motion10_Mask321_g76510 = ( staticSwitch14_g76511 * 2.0 );
				half Input_BendingAmplitude376_g76510 = _MotionAmplitude_10;
				half Global_MotionValue640_g76510 = TVE_MotionValue_10;
				half2 Final_Bending631_g76510 = ( lerpResult516_g76510 * ( Final_Motion10_Mask321_g76510 * Input_BendingAmplitude376_g76510 * Input_WindPower449_g76510 * Input_WindPower449_g76510 * Global_MotionValue640_g76510 ) );
				float2 appendResult433_g76356 = (float2(break322_g76356.x , break322_g76356.y));
				float2 temp_output_436_0_g76356 = (appendResult433_g76356*2.0 + -1.0);
				float2 break441_g76356 = temp_output_436_0_g76356;
				float3 appendResult440_g76356 = (float3(break441_g76356.x , 0.0 , break441_g76356.y));
				half2 Global_React_DirectionOS39_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76510 = Global_React_DirectionOS39_g76351;
				float clampResult17_g76513 = clamp( Input_MeshHeight388_g76510 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76512 = 0.0;
				half Input_InteractionUseMask62_g76510 = _InteractionMaskValue;
				float temp_output_10_0_g76512 = ( Input_InteractionUseMask62_g76510 - temp_output_7_0_g76512 );
				half Final_InteractionRemap594_g76510 = saturate( ( ( clampResult17_g76513 - temp_output_7_0_g76512 ) / ( temp_output_10_0_g76512 + 0.0001 ) ) );
				half ObjectData20_g76514 = Final_InteractionRemap594_g76510;
				half WorldData19_g76514 = ( Final_InteractionRemap594_g76510 * Final_InteractionRemap594_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76514 = WorldData19_g76514;
				#else
				float staticSwitch14_g76514 = ObjectData20_g76514;
				#endif
				half Final_InteractionMask373_g76510 = ( staticSwitch14_g76514 * 2.0 );
				half Input_InteractionAmplitude58_g76510 = _InteractionAmplitude;
				half2 Final_Interaction632_g76510 = ( Input_React_DirectionOS358_g76510 * Final_InteractionMask373_g76510 * Input_InteractionAmplitude58_g76510 );
				half Global_Interaction_Mask66_g76351 = ( break322_g76356.w * break322_g76356.w * break322_g76356.w * break322_g76356.w );
				float Input_InteractionGlobalMask330_g76510 = Global_Interaction_Mask66_g76351;
				half Final_InteractionValue525_g76510 = saturate( ( Input_InteractionAmplitude58_g76510 * Input_InteractionGlobalMask330_g76510 ) );
				float2 lerpResult551_g76510 = lerp( Final_Bending631_g76510 , Final_Interaction632_g76510 , Final_InteractionValue525_g76510);
				float2 break364_g76510 = lerpResult551_g76510;
				float3 appendResult638_g76510 = (float3(break364_g76510.x , 0.0 , break364_g76510.y));
				half3 Motion_10_Interaction7519_g76351 = appendResult638_g76510;
				half3 Angle44_g76486 = Motion_10_Interaction7519_g76351;
				half Angle44_g76487 = (Angle44_g76486).z;
				half3 VertexPos40_g76488 = ( VertexPosRotationAxis50_g76487 + ( VertexPosOtherAxis82_g76487 * cos( Angle44_g76487 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76487 ) * sin( Angle44_g76487 ) ) );
				float3 appendResult74_g76488 = (float3(0.0 , 0.0 , VertexPos40_g76488.z));
				half3 VertexPosRotationAxis50_g76488 = appendResult74_g76488;
				float3 break84_g76488 = VertexPos40_g76488;
				float3 appendResult81_g76488 = (float3(break84_g76488.x , break84_g76488.y , 0.0));
				half3 VertexPosOtherAxis82_g76488 = appendResult81_g76488;
				half Angle44_g76488 = -(Angle44_g76486).x;
				half3 Input_Position419_g76566 = WorldPosition_Shifted7477_g76351;
				float3 break459_g76566 = Input_Position419_g76566;
				float Sum_Position446_g76566 = ( break459_g76566.x + break459_g76566.y + break459_g76566.z );
				half Input_MotionScale321_g76566 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76566 = _MotionVariation_20;
				half Input_GlobalVariation400_g76566 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76567 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76566 = _MotionSpeed_20;
				float temp_output_404_0_g76566 = ( lerpResult128_g76567 * Input_MotionSpeed62_g76566 );
				half Motion_SineA450_g76566 = sin( ( ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) + ( Input_MotionVariation330_g76566 * Input_GlobalVariation400_g76566 ) + temp_output_404_0_g76566 ) );
				half Motion_SineB395_g76566 = sin( ( ( temp_output_404_0_g76566 * 0.6842 ) + ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) ) );
				half3 Input_Position419_g76585 = VertexPosition3588_g76351;
				float3 normalizeResult518_g76585 = normalize( Input_Position419_g76585 );
				half2 Input_DirectionOS423_g76585 = Global_React_DirectionOS39_g76351;
				float2 break521_g76585 = -Input_DirectionOS423_g76585;
				float3 appendResult522_g76585 = (float3(break521_g76585.x , 0.0 , break521_g76585.y));
				float dotResult519_g76585 = dot( normalizeResult518_g76585 , appendResult522_g76585 );
				half Input_Value62_g76585 = _MotionFacingValue;
				float lerpResult524_g76585 = lerp( 1.0 , (dotResult519_g76585*0.5 + 0.5) , Input_Value62_g76585);
				half ObjectData20_g76586 = max( lerpResult524_g76585 , 0.001 );
				half WorldData19_g76586 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76586 = WorldData19_g76586;
				#else
				float staticSwitch14_g76586 = ObjectData20_g76586;
				#endif
				half Motion_FacingMask5214_g76351 = staticSwitch14_g76586;
				half Motion_20_Amplitude4381_g76351 = Motion_FacingMask5214_g76351;
				half Input_MotionAmplitude384_g76566 = Motion_20_Amplitude4381_g76351;
				half Input_GlobalWind407_g76566 = Global_Wind_Power2223_g76351;
				float4 break638_g76527 = abs( Noise_Complex703_g76527 );
				half Global_Noise_B5526_g76351 = break638_g76527.b;
				half Input_GlobalNoise411_g76566 = Global_Noise_B5526_g76351;
				float lerpResult413_g76566 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76566);
				half Motion_Amplitude418_g76566 = ( Input_MotionAmplitude384_g76566 * Input_GlobalWind407_g76566 * pow( Input_GlobalNoise411_g76566 , lerpResult413_g76566 ) );
				half Input_Squash58_g76566 = _MotionAmplitude_20;
				float enc59_g76576 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76576 = DecodeFloatToVector2( enc59_g76576 );
				float2 break61_g76576 = localDecodeFloatToVector259_g76576;
				half Mesh_Motion_2060_g76351 = break61_g76576.x;
				half Input_MeshMotion_20388_g76566 = Mesh_Motion_2060_g76351;
				float Bounds_Radius5231_g76351 = break63_g76576.y;
				half Input_BoundsRadius390_g76566 = Bounds_Radius5231_g76351;
				half Global_MotionValue462_g76566 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76566 = Global_React_DirectionOS39_g76351;
				float2 break371_g76566 = Input_DirectionOS366_g76566;
				float3 appendResult372_g76566 = (float3(break371_g76566.x , ( Motion_SineA450_g76566 * 0.3 ) , break371_g76566.y));
				half3 Motion_20_Squash4418_g76351 = ( ( (max( Motion_SineA450_g76566 , Motion_SineB395_g76566 )*0.5 + 0.5) * Motion_Amplitude418_g76566 * Input_Squash58_g76566 * Input_MeshMotion_20388_g76566 * Input_BoundsRadius390_g76566 * Global_MotionValue462_g76566 ) * appendResult372_g76566 );
				half3 VertexPos40_g76472 = ( ( VertexPosRotationAxis50_g76488 + ( VertexPosOtherAxis82_g76488 * cos( Angle44_g76488 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76488 ) * sin( Angle44_g76488 ) ) ) + Motion_20_Squash4418_g76351 );
				float3 appendResult74_g76472 = (float3(0.0 , VertexPos40_g76472.y , 0.0));
				float3 VertexPosRotationAxis50_g76472 = appendResult74_g76472;
				float3 break84_g76472 = VertexPos40_g76472;
				float3 appendResult81_g76472 = (float3(break84_g76472.x , 0.0 , break84_g76472.z));
				float3 VertexPosOtherAxis82_g76472 = appendResult81_g76472;
				half Input_Rolling379_g76566 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76351 = ( Motion_SineA450_g76566 * Motion_Amplitude418_g76566 * Input_Rolling379_g76566 * Input_MeshMotion_20388_g76566 * Global_MotionValue462_g76566 );
				half Angle44_g76472 = Motion_20_Rolling5257_g76351;
				half3 Input_Position500_g76523 = WorldPosition_Shifted7477_g76351;
				half Input_MotionScale321_g76523 = _MotionScale_32;
				half Input_MotionVariation330_g76523 = _MotionVariation_32;
				half Input_GlobalVariation372_g76523 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76524 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76523 = _MotionSpeed_32;
				float4 tex2DNode460_g76523 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76523).xz * Input_MotionScale321_g76523 * 0.03 ) + ( Input_MotionVariation330_g76523 * Input_GlobalVariation372_g76523 ) + ( lerpResult128_g76524 * Input_MotionSpeed62_g76523 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76523 = (float3(tex2DNode460_g76523.r , tex2DNode460_g76523.g , tex2DNode460_g76523.b));
				half3 Flutter_Texture489_g76523 = (appendResult462_g76523*2.0 + -1.0);
				float temp_output_7_0_g76401 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76401 = ( TVE_MotionFadeStart - temp_output_7_0_g76401 );
				half Motion_FadeOut4005_g76351 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76401 ) / ( temp_output_10_0_g76401 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76351 = ( _MotionAmplitude_32 * Motion_FacingMask5214_g76351 * Motion_FadeOut4005_g76351 );
				half Input_MotionAmplitude58_g76523 = Motion_30_Amplitude4960_g76351;
				half Mesh_Motion_30144_g76351 = break61_g76576.y;
				half Input_MeshMotion_30374_g76523 = Mesh_Motion_30144_g76351;
				half Input_GlobalWind471_g76523 = Global_Wind_Power2223_g76351;
				half Global_MotionValue503_g76523 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g76523 = Global_Noise_B5526_g76351;
				float lerpResult466_g76523 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76523);
				half Flutter_Amplitude491_g76523 = ( Input_MotionAmplitude58_g76523 * Input_MeshMotion_30374_g76523 * Input_GlobalWind471_g76523 * Global_MotionValue503_g76523 * pow( Input_GlobalNoise472_g76523 , lerpResult466_g76523 ) );
				half3 Motion_30_Flutter263_g76351 = ( Flutter_Texture489_g76523 * Flutter_Amplitude491_g76523 );
				float3 Vertex_Motion_Object833_g76351 = ( ( VertexPosRotationAxis50_g76472 + ( VertexPosOtherAxis82_g76472 * cos( Angle44_g76472 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76472 ) * sin( Angle44_g76472 ) ) ) + Motion_30_Flutter263_g76351 );
				half3 ObjectData20_g76419 = Vertex_Motion_Object833_g76351;
				float3 temp_output_3474_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				float3 Vertex_Motion_World1118_g76351 = ( ( ( temp_output_3474_0_g76351 + Motion_10_Interaction7519_g76351 ) + Motion_20_Squash4418_g76351 ) + Motion_30_Flutter263_g76351 );
				half3 WorldData19_g76419 = Vertex_Motion_World1118_g76351;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76419 = WorldData19_g76419;
				#else
				float3 staticSwitch14_g76419 = ObjectData20_g76419;
				#endif
				float3 temp_output_7495_0_g76351 = staticSwitch14_g76419;
				float3 Vertex_Motion7493_g76351 = temp_output_7495_0_g76351;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 break2709_g76351 = cross( ViewDirection3963_g76351 , half3(0,1,0) );
				float3 appendResult2710_g76351 = (float3(-break2709_g76351.z , 0.0 , break2709_g76351.x));
				float3 appendResult2667_g76351 = (float3(Global_MeshVariation5104_g76351 , 0.5 , Global_MeshVariation5104_g76351));
				half Mesh_Height1524_g76351 = v.ase_color.a;
				float dotResult2212_g76351 = dot( ViewDirection3963_g76351 , float3(0,1,0) );
				half Mask_HView2656_g76351 = dotResult2212_g76351;
				float saferPower2652_g76351 = abs( Mask_HView2656_g76351 );
				half3 Grass_Perspective2661_g76351 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76351 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76351*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76351 * pow( saferPower2652_g76351 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76383 = _LayerVertexValue;
				float temp_output_19_0_g76387 = TVE_VertexUsage[(int)temp_output_84_0_g76383];
				float4 temp_output_94_19_g76383 = TVE_VertexCoords;
				half2 UV97_g76383 = ( (temp_output_94_19_g76383).zw + ( (temp_output_94_19_g76383).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76383 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76383,temp_output_84_0_g76383, 0.0 );
				float4 temp_output_17_0_g76387 = tex2DArrayNode50_g76383;
				float4 temp_output_111_19_g76383 = TVE_VertexParams;
				float4 temp_output_3_0_g76387 = temp_output_111_19_g76383;
				float4 ifLocalVar18_g76387 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76387 >= 0.5 )
				ifLocalVar18_g76387 = temp_output_17_0_g76387;
				else
				ifLocalVar18_g76387 = temp_output_3_0_g76387;
				float4 lerpResult22_g76387 = lerp( temp_output_3_0_g76387 , temp_output_17_0_g76387 , temp_output_19_0_g76387);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76387 = lerpResult22_g76387;
				#else
				float4 staticSwitch24_g76387 = ifLocalVar18_g76387;
				#endif
				half4 Global_Vertex_Params4173_g76351 = staticSwitch24_g76387;
				float4 break322_g76388 = Global_Vertex_Params4173_g76351;
				half Global_VertexSize174_g76351 = saturate( break322_g76388.w );
				float lerpResult346_g76351 = lerp( 1.0 , Global_VertexSize174_g76351 , _GlobalSize);
				float3 appendResult3480_g76351 = (float3(lerpResult346_g76351 , lerpResult346_g76351 , lerpResult346_g76351));
				half3 ObjectData20_g76416 = appendResult3480_g76351;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76416 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76416 = WorldData19_g76416;
				#else
				float3 staticSwitch14_g76416 = ObjectData20_g76416;
				#endif
				half3 Vertex_Size1741_g76351 = staticSwitch14_g76416;
				float temp_output_7_0_g76417 = _SizeFadeEndValue;
				float temp_output_10_0_g76417 = ( _SizeFadeStartValue - temp_output_7_0_g76417 );
				float temp_output_7453_0_g76351 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76351 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76417 ) / ( temp_output_10_0_g76417 + 0.0001 ) ) );
				float3 appendResult3482_g76351 = (float3(temp_output_7453_0_g76351 , temp_output_7453_0_g76351 , temp_output_7453_0_g76351));
				half3 ObjectData20_g76415 = appendResult3482_g76351;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76415 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76415 = WorldData19_g76415;
				#else
				float3 staticSwitch14_g76415 = ObjectData20_g76415;
				#endif
				float3 Vertex_SizeFade1740_g76351 = staticSwitch14_g76415;
				float3 lerpResult16_g76420 = lerp( VertexPosition3588_g76351 , ( ( ( Vertex_Motion7493_g76351 + Grass_Perspective2661_g76351 ) * Vertex_Size1741_g76351 * Vertex_SizeFade1740_g76351 ) + Mesh_PivotsOS2291_g76351 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76351 = lerpResult16_g76420;
				float3 Final_VertexPosition890_g76351 = ( temp_output_4912_0_g76351 + _DisableSRPBatcher );
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(v.tangentOS.xyz);
				float ase_vertexTangentSign = v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				float4 break33_g76581 = _second_uvs_mode;
				float2 temp_output_30_0_g76581 = ( v.ase_texcoord.xy * break33_g76581.x );
				float2 appendResult21_g76576 = (float2(v.ase_texcoord1.z , v.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76351 = appendResult21_g76576;
				float2 temp_output_29_0_g76581 = ( Mesh_DetailCoord3_g76351 * break33_g76581.y );
				float2 temp_output_31_0_g76581 = ( (WorldPosition_Shifted7477_g76351).xz * break33_g76581.z );
				half2 Second_UVs_Tilling7609_g76351 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7610_g76351 = ( 1.0 / Second_UVs_Tilling7609_g76351 );
				float2 lerpResult7614_g76351 = lerp( Second_UVs_Tilling7609_g76351 , Second_UVs_Scale7610_g76351 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7605_g76351 = (_SecondUVs).zw;
				float2 vertexToFrag11_g76377 = ( ( ( temp_output_30_0_g76581 + temp_output_29_0_g76581 + temp_output_31_0_g76581 ) * lerpResult7614_g76351 ) + Second_UVs_Offset7605_g76351 );
				o.ase_texcoord7.xy = vertexToFrag11_g76377;
				o.ase_texcoord8.xyz = vertexToFrag3890_g76351;
				o.ase_texcoord9.xyz = vertexToFrag4224_g76351;
				
				o.ase_texcoord5 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.zw = 0;
				o.ase_texcoord8.w = 0;
				o.ase_texcoord9.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76351;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				float3 normalWS = TransformObjectToWorldNormal( v.normalOS );
				float4 tangentWS = float4( TransformObjectToWorldDir( v.tangentOS.xyz ), v.tangentOS.w );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				o.worldNormal = normalWS;
				o.worldTangent = tangentWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag(	VertexOutput IN
						, out half4 outNormalWS : SV_Target0
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						, bool ase_vface : SV_IsFrontFace )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float3 WorldNormal = IN.worldNormal;
				float4 WorldTangent = IN.worldTangent;

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				half2 Main_UVs15_g76351 = ( ( IN.ase_texcoord5.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				half4 Normal_Packed45_g76559 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				float2 appendResult58_g76559 = (float2(( (Normal_Packed45_g76559).x * (Normal_Packed45_g76559).w ) , (Normal_Packed45_g76559).y));
				half2 Normal_Default50_g76559 = appendResult58_g76559;
				half2 Normal_ASTC41_g76559 = (Normal_Packed45_g76559).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76559 = Normal_ASTC41_g76559;
				#else
				float2 staticSwitch38_g76559 = Normal_Default50_g76559;
				#endif
				half2 Normal_NO_DTX544_g76559 = (Normal_Packed45_g76559).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76559 = Normal_NO_DTX544_g76559;
				#else
				float2 staticSwitch37_g76559 = staticSwitch38_g76559;
				#endif
				float2 temp_output_6555_0_g76351 = ( (staticSwitch37_g76559*2.0 + -1.0) * _MainNormalValue );
				half2 Main_Normal137_g76351 = temp_output_6555_0_g76351;
				float2 lerpResult3372_g76351 = lerp( float2( 0,0 ) , Main_Normal137_g76351 , _DetailNormalValue);
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3x3 ase_worldToTangent = float3x3(WorldTangent.xyz,ase_worldBitangent,WorldNormal);
				float2 vertexToFrag11_g76377 = IN.ase_texcoord7.xy;
				half2 Second_UVs17_g76351 = vertexToFrag11_g76377;
				half4 Normal_Packed45_g76562 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				float2 appendResult58_g76562 = (float2(( (Normal_Packed45_g76562).x * (Normal_Packed45_g76562).w ) , (Normal_Packed45_g76562).y));
				half2 Normal_Default50_g76562 = appendResult58_g76562;
				half2 Normal_ASTC41_g76562 = (Normal_Packed45_g76562).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76562 = Normal_ASTC41_g76562;
				#else
				float2 staticSwitch38_g76562 = Normal_Default50_g76562;
				#endif
				half2 Normal_NO_DTX544_g76562 = (Normal_Packed45_g76562).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76562 = Normal_NO_DTX544_g76562;
				#else
				float2 staticSwitch37_g76562 = staticSwitch38_g76562;
				#endif
				float2 temp_output_6560_0_g76351 = ( (staticSwitch37_g76562*2.0 + -1.0) * _SecondNormalValue );
				half2 Normal_Planar45_g76565 = temp_output_6560_0_g76351;
				float2 break64_g76565 = Normal_Planar45_g76565;
				float3 appendResult65_g76565 = (float3(break64_g76565.x , 0.0 , break64_g76565.y));
				float2 temp_output_7603_0_g76351 = (mul( ase_worldToTangent, appendResult65_g76565 )).xy;
				float2 ifLocalVar7604_g76351 = 0;
				if( _SecondUVsMode >= 2.0 )
				ifLocalVar7604_g76351 = temp_output_7603_0_g76351;
				else
				ifLocalVar7604_g76351 = temp_output_6560_0_g76351;
				half2 Second_Normal179_g76351 = ifLocalVar7604_g76351;
				float2 temp_output_36_0_g76394 = ( lerpResult3372_g76351 + Second_Normal179_g76351 );
				float4 tex2DNode35_g76351 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				half Main_Mask57_g76351 = tex2DNode35_g76351.b;
				float4 tex2DNode33_g76351 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				half Second_Mask81_g76351 = tex2DNode33_g76351.b;
				float lerpResult6885_g76351 = lerp( Main_Mask57_g76351 , Second_Mask81_g76351 , _DetailMaskMode);
				float clampResult17_g76483 = clamp( lerpResult6885_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76482 = _DetailMaskMinValue;
				float temp_output_10_0_g76482 = ( _DetailMaskMaxValue - temp_output_7_0_g76482 );
				half Blend_Mask_Texture6794_g76351 = saturate( ( ( clampResult17_g76483 - temp_output_7_0_g76482 ) / ( temp_output_10_0_g76482 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76351 = IN.ase_color.b;
				float3 appendResult7388_g76351 = (float3(temp_output_6555_0_g76351 , 1.0));
				float3 tanToWorld0 = float3( WorldTangent.xyz.x, ase_worldBitangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.xyz.y, ase_worldBitangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.xyz.z, ase_worldBitangent.z, WorldNormal.z );
				float3 tanNormal7389_g76351 = appendResult7388_g76351;
				float3 worldNormal7389_g76351 = float3(dot(tanToWorld0,tanNormal7389_g76351), dot(tanToWorld1,tanNormal7389_g76351), dot(tanToWorld2,tanNormal7389_g76351));
				half3 Main_NormalWS7390_g76351 = worldNormal7389_g76351;
				float lerpResult6884_g76351 = lerp( Mesh_DetailMask90_g76351 , ((Main_NormalWS7390_g76351).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76481 = clamp( lerpResult6884_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76480 = _DetailMeshMinValue;
				float temp_output_10_0_g76480 = ( _DetailMeshMaxValue - temp_output_7_0_g76480 );
				half Blend_Mask_Mesh1540_g76351 = saturate( ( ( clampResult17_g76481 - temp_output_7_0_g76480 ) / ( temp_output_10_0_g76480 + 0.0001 ) ) );
				float clampResult17_g76504 = clamp( ( Blend_Mask_Texture6794_g76351 * Blend_Mask_Mesh1540_g76351 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76552 = _DetailBlendMinValue;
				float temp_output_10_0_g76552 = ( _DetailBlendMaxValue - temp_output_7_0_g76552 );
				half Blend_Mask147_g76351 = ( saturate( ( ( clampResult17_g76504 - temp_output_7_0_g76552 ) / ( temp_output_10_0_g76552 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float2 lerpResult3376_g76351 = lerp( Main_Normal137_g76351 , temp_output_36_0_g76394 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float2 staticSwitch267_g76351 = lerpResult3376_g76351;
				#else
				float2 staticSwitch267_g76351 = Main_Normal137_g76351;
				#endif
				half2 Blend_Normal312_g76351 = staticSwitch267_g76351;
				half Global_OverlayNormalScale6581_g76351 = TVE_OverlayNormalValue;
				float temp_output_84_0_g76367 = _LayerExtrasValue;
				float temp_output_19_0_g76371 = TVE_ExtrasUsage[(int)temp_output_84_0_g76367];
				float4 temp_output_93_19_g76367 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76351 = IN.ase_texcoord8.xyz;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 vertexToFrag4224_g76351 = IN.ase_texcoord9.xyz;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 lerpResult4827_g76351 = lerp( WorldPosition3905_g76351 , ObjectPosition4223_g76351 , _ExtrasPositionMode);
				half2 UV96_g76367 = ( (temp_output_93_19_g76367).zw + ( (temp_output_93_19_g76367).xy * (lerpResult4827_g76351).xz ) );
				float4 tex2DArrayNode48_g76367 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76367,temp_output_84_0_g76367, 0.0 );
				float4 temp_output_17_0_g76371 = tex2DArrayNode48_g76367;
				float4 temp_output_94_85_g76367 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76371 = temp_output_94_85_g76367;
				float4 ifLocalVar18_g76371 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76371 >= 0.5 )
				ifLocalVar18_g76371 = temp_output_17_0_g76371;
				else
				ifLocalVar18_g76371 = temp_output_3_0_g76371;
				float4 lerpResult22_g76371 = lerp( temp_output_3_0_g76371 , temp_output_17_0_g76371 , temp_output_19_0_g76371);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76371 = lerpResult22_g76371;
				#else
				float4 staticSwitch24_g76371 = ifLocalVar18_g76371;
				#endif
				half4 Global_Extras_Params5440_g76351 = staticSwitch24_g76371;
				float4 break456_g76381 = Global_Extras_Params5440_g76351;
				half Global_Extras_Overlay156_g76351 = break456_g76381.z;
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = IN.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				float lerpResult1065_g76351 = lerp( 1.0 , Global_MeshVariation5104_g76351 , _OverlayVariationValue);
				half Overlay_Variation4560_g76351 = lerpResult1065_g76351;
				half Overlay_Value5738_g76351 = ( _GlobalOverlay * Global_Extras_Overlay156_g76351 * Overlay_Variation4560_g76351 );
				float3 appendResult7377_g76351 = (float3(Blend_Normal312_g76351 , 1.0));
				float3 tanNormal7376_g76351 = appendResult7377_g76351;
				float3 worldNormal7376_g76351 = float3(dot(tanToWorld0,tanNormal7376_g76351), dot(tanToWorld1,tanNormal7376_g76351), dot(tanToWorld2,tanNormal7376_g76351));
				half3 Blend_NormalWS7375_g76351 = worldNormal7376_g76351;
				float lerpResult7446_g76351 = lerp( (Blend_NormalWS7375_g76351).y , IN.ase_normal.y , Vertex_DynamicMode5112_g76351);
				float lerpResult6757_g76351 = lerp( 1.0 , saturate( lerpResult7446_g76351 ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g76351 = lerpResult6757_g76351;
				float4 tex2DNode29_g76351 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76351 );
				float3 lerpResult6223_g76351 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76351).rgb , _MainAlbedoValue);
				float clampResult17_g76560 = clamp( Main_Mask57_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76561 = _MainMaskMinValue;
				float temp_output_10_0_g76561 = ( _MainMaskMaxValue - temp_output_7_0_g76561 );
				half Main_Mask_Remap5765_g76351 = saturate( ( ( clampResult17_g76560 - temp_output_7_0_g76561 ) / ( temp_output_10_0_g76561 + 0.0001 ) ) );
				float lerpResult7671_g76351 = lerp( 1.0 , Main_Mask_Remap5765_g76351 , _MainColorMode);
				float4 lerpResult7654_g76351 = lerp( _MainColorTwo , _MainColor , lerpResult7671_g76351);
				half3 Main_Color_RGB7657_g76351 = (lerpResult7654_g76351).rgb;
				half3 Main_Albedo99_g76351 = ( lerpResult6223_g76351 * Main_Color_RGB7657_g76351 );
				float4 tex2DNode89_g76351 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76351 );
				float3 lerpResult6225_g76351 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76351).rgb , _SecondAlbedoValue);
				float clampResult17_g76563 = clamp( Second_Mask81_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76564 = _SecondMaskMinValue;
				float temp_output_10_0_g76564 = ( _SecondMaskMaxValue - temp_output_7_0_g76564 );
				half Second_Mask_Remap6130_g76351 = saturate( ( ( clampResult17_g76563 - temp_output_7_0_g76564 ) / ( temp_output_10_0_g76564 + 0.0001 ) ) );
				float lerpResult7672_g76351 = lerp( 1.0 , Second_Mask_Remap6130_g76351 , _SecondColorMode);
				float4 lerpResult7662_g76351 = lerp( _SecondColorTwo , _SecondColor , lerpResult7672_g76351);
				half3 Second_Color_RGB7663_g76351 = (lerpResult7662_g76351).rgb;
				half3 Second_Albedo153_g76351 = ( lerpResult6225_g76351 * Second_Color_RGB7663_g76351 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g76393 = 2.0;
				#else
				float staticSwitch1_g76393 = 4.594794;
				#endif
				float3 lerpResult4834_g76351 = lerp( ( Main_Albedo99_g76351 * Second_Albedo153_g76351 * staticSwitch1_g76393 ) , Second_Albedo153_g76351 , _DetailBlendMode);
				float3 lerpResult235_g76351 = lerp( Main_Albedo99_g76351 , lerpResult4834_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float3 staticSwitch255_g76351 = lerpResult235_g76351;
				#else
				float3 staticSwitch255_g76351 = Main_Albedo99_g76351;
				#endif
				half3 Blend_Albedo265_g76351 = staticSwitch255_g76351;
				half Mesh_Height1524_g76351 = IN.ase_color.a;
				float temp_output_7_0_g76402 = _GradientMinValue;
				float temp_output_10_0_g76402 = ( _GradientMaxValue - temp_output_7_0_g76402 );
				half Tint_Gradient_Value2784_g76351 = saturate( ( ( Mesh_Height1524_g76351 - temp_output_7_0_g76402 ) / ( temp_output_10_0_g76402 + 0.0001 ) ) );
				float3 lerpResult2779_g76351 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Tint_Gradient_Value2784_g76351);
				float lerpResult6617_g76351 = lerp( Main_Mask_Remap5765_g76351 , Second_Mask_Remap6130_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6623_g76351 = lerpResult6617_g76351;
				#else
				float staticSwitch6623_g76351 = Main_Mask_Remap5765_g76351;
				#endif
				half Blend_Mask_Remap6621_g76351 = staticSwitch6623_g76351;
				half Tint_Gradient_Mask6207_g76351 = Blend_Mask_Remap6621_g76351;
				float3 lerpResult6208_g76351 = lerp( float3( 1,1,1 ) , lerpResult2779_g76351 , Tint_Gradient_Mask6207_g76351);
				half3 Tint_Gradient_Color5769_g76351 = lerpResult6208_g76351;
				half3 Tint_Noise_Color5770_g76351 = float3(1,1,1);
				float3 temp_output_3_0_g76398 = ( Blend_Albedo265_g76351 * Tint_Gradient_Color5769_g76351 * Tint_Noise_Color5770_g76351 );
				float dotResult20_g76398 = dot( temp_output_3_0_g76398 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g76351 = clamp( saturate( ( dotResult20_g76398 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g76351 = clampResult6740_g76351;
				half Overlay_Shading6688_g76351 = Blend_Albedo_Globals6410_g76351;
				half Overlay_Custom6707_g76351 = 1.0;
				half Occlusion_Alpha6463_g76351 = _VertexOcclusionColor.a;
				float Mesh_Occlusion318_g76351 = IN.ase_color.g;
				float clampResult17_g76399 = clamp( Mesh_Occlusion318_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76405 = _VertexOcclusionMinValue;
				float temp_output_10_0_g76405 = ( _VertexOcclusionMaxValue - temp_output_7_0_g76405 );
				half Occlusion_Mask6432_g76351 = saturate( ( ( clampResult17_g76399 - temp_output_7_0_g76405 ) / ( temp_output_10_0_g76405 + 0.0001 ) ) );
				float lerpResult7693_g76351 = lerp( Occlusion_Mask6432_g76351 , ( 1.0 - Occlusion_Mask6432_g76351 ) , _VertexOcclusionOverlayMode);
				float lerpResult6467_g76351 = lerp( Occlusion_Alpha6463_g76351 , 1.0 , lerpResult7693_g76351);
				half Occlusion_Overlay6471_g76351 = lerpResult6467_g76351;
				float temp_output_7_0_g76403 = 0.1;
				float temp_output_10_0_g76403 = ( 0.2 - temp_output_7_0_g76403 );
				half Overlay_Mask_High6064_g76351 = saturate( ( ( ( Overlay_Value5738_g76351 * Overlay_Projection6081_g76351 * Overlay_Shading6688_g76351 * Overlay_Custom6707_g76351 * Occlusion_Overlay6471_g76351 ) - temp_output_7_0_g76403 ) / ( temp_output_10_0_g76403 + 0.0001 ) ) );
				half Overlay_Mask269_g76351 = Overlay_Mask_High6064_g76351;
				float lerpResult6585_g76351 = lerp( 1.0 , Global_OverlayNormalScale6581_g76351 , Overlay_Mask269_g76351);
				half2 Blend_Normal_Overlay366_g76351 = ( Blend_Normal312_g76351 * lerpResult6585_g76351 );
				half Global_WetnessNormalScale6571_g76351 = TVE_WetnessNormalValue;
				half Global_Extras_Wetness305_g76351 = break456_g76381.y;
				half Wetness_Value6343_g76351 = ( Global_Extras_Wetness305_g76351 * _GlobalWetness );
				float lerpResult6579_g76351 = lerp( 1.0 , Global_WetnessNormalScale6571_g76351 , ( Wetness_Value6343_g76351 * Wetness_Value6343_g76351 ));
				half2 Blend_Normal_Wetness6372_g76351 = ( Blend_Normal_Overlay366_g76351 * lerpResult6579_g76351 );
				float3 appendResult6568_g76351 = (float3(Blend_Normal_Wetness6372_g76351 , 1.0));
				float3 temp_output_13_0_g76382 = appendResult6568_g76351;
				float3 temp_output_33_0_g76382 = ( temp_output_13_0_g76382 * _render_normals );
				float3 switchResult12_g76382 = (((ase_vface>0)?(temp_output_13_0_g76382):(temp_output_33_0_g76382)));
				
				float localCustomAlphaClip19_g76558 = ( 0.0 );
				half Main_Alpha316_g76351 = tex2DNode29_g76351.a;
				half Second_Alpha5007_g76351 = tex2DNode89_g76351.a;
				float lerpResult6153_g76351 = lerp( Main_Alpha316_g76351 , Second_Alpha5007_g76351 , Blend_Mask147_g76351);
				float lerpResult6785_g76351 = lerp( ( Main_Alpha316_g76351 * Second_Alpha5007_g76351 ) , lerpResult6153_g76351 , _DetailAlphaMode);
				#ifdef TVE_DETAIL
				float staticSwitch6158_g76351 = lerpResult6785_g76351;
				#else
				float staticSwitch6158_g76351 = Main_Alpha316_g76351;
				#endif
				half Blend_Alpha6157_g76351 = staticSwitch6158_g76351;
				half AlphaTreshold2132_g76351 = _AlphaClipValue;
				half Global_Extras_Alpha1033_g76351 = saturate( break456_g76381.w );
				float lerpResult5154_g76351 = lerp( 0.0 , Global_MeshVariation5104_g76351 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76351 = lerpResult5154_g76351;
				float Emissive_Alpha7625_g76351 = 0.0;
				float lerpResult6866_g76351 = lerp( ( 1.0 - Blend_Mask147_g76351 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_DETAIL
				float staticSwitch6612_g76351 = lerpResult6866_g76351;
				#else
				float staticSwitch6612_g76351 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76351 = staticSwitch6612_g76351;
				half Alpha_Mask6234_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5203_g76351 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76351 - saturate( ( Global_Alpha_Variation5158_g76351 + Emissive_Alpha7625_g76351 ) ) ) + ( Global_Extras_Alpha1033_g76351 * 0.1 ) ) ) , ( Alpha_Mask6234_g76351 * _GlobalAlpha ));
				float lerpResult16_g76395 = lerp( 1.0 , lerpResult5203_g76351 , TVE_IsEnabled);
				half Global_Alpha315_g76351 = lerpResult16_g76395;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 normalizeResult3971_g76351 = normalize( cross( ddy( WorldPosition ) , ddx( WorldPosition ) ) );
				float3 WorldNormal_Derivates3972_g76351 = normalizeResult3971_g76351;
				float dotResult3851_g76351 = dot( ViewDirection3963_g76351 , WorldNormal_Derivates3972_g76351 );
				float lerpResult3993_g76351 = lerp( 1.0 , saturate( ( abs( dotResult3851_g76351 ) * 3.0 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g76351 = lerpResult3993_g76351;
				half Fade_Effects_A5360_g76351 = Fade_Glancing3853_g76351;
				float temp_output_7_0_g76404 = TVE_CameraFadeMin;
				float temp_output_10_0_g76404 = ( TVE_CameraFadeMax - temp_output_7_0_g76404 );
				float lerpResult4755_g76351 = lerp( 1.0 , saturate( saturate( ( ( distance( WorldPosition , _WorldSpaceCameraPos ) - temp_output_7_0_g76404 ) / ( temp_output_10_0_g76404 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76351 = lerpResult4755_g76351;
				half Fade_Effects_B6228_g76351 = ( Fade_Effects_A5360_g76351 * Fade_Camera3743_g76351 );
				half Fade_Mask5149_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5141_g76351 = lerp( 1.0 , ( Fade_Effects_B6228_g76351 * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76351);
				half Fade_Effects_C7653_g76351 = lerpResult5141_g76351;
				float temp_output_5865_0_g76351 = saturate( ( Fade_Effects_C7653_g76351 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76351 ) ).r ) );
				half Fade_Alpha3727_g76351 = temp_output_5865_0_g76351;
				half Final_Alpha7344_g76351 = min( ( ( Blend_Alpha6157_g76351 - AlphaTreshold2132_g76351 ) * Global_Alpha315_g76351 ) , Fade_Alpha3727_g76351 );
				float temp_output_3_0_g76558 = Final_Alpha7344_g76351;
				float Alpha19_g76558 = temp_output_3_0_g76558;
				float temp_output_15_0_g76558 = 0.01;
				float Treshold19_g76558 = temp_output_15_0_g76558;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#else
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76351 = (lerpResult7654_g76351).a;
				half Second_Color_Alpha6152_g76351 = (lerpResult7662_g76351).a;
				float lerpResult6168_g76351 = lerp( Main_Color_Alpha6121_g76351 , Second_Color_Alpha6152_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6174_g76351 = lerpResult6168_g76351;
				#else
				float staticSwitch6174_g76351 = Main_Color_Alpha6121_g76351;
				#endif
				half Blend_Color_Alpha6167_g76351 = staticSwitch6174_g76351;
				half Final_Clip914_g76351 = saturate( ( Alpha19_g76558 * Blend_Color_Alpha6167_g76351 ) );
				

				float3 Normal = switchResult12_g76382;
				float Alpha = Final_Clip914_g76351;
				float AlphaClipThreshold = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend [_render_src] [_render_dst], One Zero
			ZWrite On
			ZTest LEqual
			Offset 0,0
			ColorMask RGBA
			

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ USE_LEGACY_LIGHTMAPS
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ProbeVolumeVariants.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif
			
			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#if !defined( OUTPUT_SH4 )
				#define OUTPUT_SH4 OUTPUT_SH
			#endif

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_DETAIL
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
				float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_color : COLOR;
				float4 ase_texcoord10 : TEXCOORD10;
				float4 ase_texcoord11 : TEXCOORD11;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SecondColor;
			half4 _MotionHighlightColor;
			half4 _SubsurfaceColor;
			half4 _NoiseMaskRemap;
			half4 _MainColorTwo;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColorTwo;
			half4 _MainUVs;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _DetailMeshRemap;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half4 _DetailMaskRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _RimLightRemap;
			half4 _MainColor;
			half3 _render_normals;
			half _SecondColorMode;
			half _DetailBlendMode;
			half _DetailMaskMode;
			half _DetailMaskMinValue;
			half _DetailMaskMaxValue;
			half _MainNormalValue;
			half _DetailMeshMode;
			half _DetailMeshMinValue;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _MainMaskMaxValue;
			half _SecondAlbedoValue;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			half _GlobalSize;
			half _SizeFadeEndValue;
			half _SizeFadeStartValue;
			half _MainAlbedoValue;
			half _MainMaskMinValue;
			half _DetailMeshMaxValue;
			half _MainColorMode;
			half _SecondUVsScaleMode;
			half _SecondMaskMinValue;
			half _DetailBlendMinValue;
			half _GradientMaxValue;
			half _DetailMode;
			half _SubsurfaceValue;
			half _SubsurfaceMaskValue;
			half _EmissiveTexMinValue;
			half _EmissiveTexMaxValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _FadeGlancingValue;
			half _SecondSmoothnessValue;
			half _DetailBlendMaxValue;
			half _VertexOcclusionOverlayMode;
			half _SecondNormalValue;
			half _DetailValue;
			half _GradientMinValue;
			half _MotionAmplitude_20;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _ColorsIntensityValue;
			half _OverlayProjectionValue;
			half _ColorsMaskValue;
			half _ColorsVariationValue;
			half _VertexOcclusionColorsMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _OverlayVariationValue;
			half _DetailNormalValue;
			half _SecondUVsMode;
			half _GlobalColors;
			half _MotionFacingValue;
			half _LayerMotionValue;
			half _MotionVariation_20;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _RenderDirect;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _Cutoff;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _IsVersion;
			half _HasEmissive;
			half _render_src;
			half _render_zw;
			half _render_dst;
			half _render_coverage;
			half _IsStandardShader;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageGlobalsVariation;
			half _IsTVEShader;
			half _HasOcclusion;
			half _IsIdentifier;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _VertexVariationMode;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MessageMotionVariation;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _MessageOcclusion;
			half _EmissiveMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_20;
			half _DetailMaskInvertMode;
			half _CategoryMotion;
			half _ColorsMaskMaxValue;
			half _RenderCoverage;
			half _MessageSubsurface;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderZWrite;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderClip;
			half _ColorsMaskMinValue;
			half _FadeConstantValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			float TVE_ColorsUsage[10];
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			half4 TVE_ColorsParams;
			half4 TVE_OverlayColor;
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			TEXTURE2D(_SecondNormalTex);
			half TVE_WetnessContrast;
			half TVE_SubsurfaceValue;
			half TVE_OverlaySubsurface;
			half3 TVE_MainLightDirection;
			half TVE_OverlayNormalValue;
			half TVE_WetnessNormalValue;
			TEXTURE2D(_EmissiveTex);
			half TVE_OverlaySmoothness;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g76351 = v.positionOS.xyz;
				float3 appendResult60_g76361 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76351 = ( appendResult60_g76361 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76351 = Mesh_PivotsData2831_g76351;
				float3 temp_output_2283_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				half3 VertexPos40_g76486 = temp_output_2283_0_g76351;
				half3 VertexPos40_g76487 = VertexPos40_g76486;
				float3 appendResult74_g76487 = (float3(VertexPos40_g76487.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76487 = appendResult74_g76487;
				float3 break84_g76487 = VertexPos40_g76487;
				float3 appendResult81_g76487 = (float3(0.0 , break84_g76487.y , break84_g76487.z));
				half3 VertexPosOtherAxis82_g76487 = appendResult81_g76487;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g76351 = ase_worldPos;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 WorldPosition_Shifted7477_g76351 = ( WorldPosition3905_g76351 - TVE_WorldOrigin );
				float4x4 break19_g76407 = GetObjectToWorldMatrix();
				float3 appendResult20_g76407 = (float3(break19_g76407[ 0 ][ 3 ] , break19_g76407[ 1 ][ 3 ] , break19_g76407[ 2 ][ 3 ]));
				float3 temp_output_122_0_g76407 = Mesh_PivotsData2831_g76351;
				float3 PivotsOnly105_g76407 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76407 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g76409 = ( appendResult20_g76407 + PivotsOnly105_g76407 );
				half3 WorldData19_g76409 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76409 = WorldData19_g76409;
				#else
				float3 staticSwitch14_g76409 = ObjectData20_g76409;
				#endif
				float3 temp_output_114_0_g76407 = staticSwitch14_g76409;
				float3 vertexToFrag4224_g76351 = temp_output_114_0_g76407;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				float3 lerpResult6766_g76351 = lerp( WorldPosition_Shifted7477_g76351 , ObjectPosition_Shifted7481_g76351 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76351 = lerpResult6766_g76351;
				half3 Input_Position419_g76527 = Motion_10_Position6738_g76351;
				float Input_MotionScale287_g76527 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76527 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76527 = (( Input_Position419_g76527 * Input_MotionScale287_g76527 * NoiseTex_Tilling735_g76527 * 0.0075 )).xz;
				float2 temp_output_447_0_g76356 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76351 = temp_output_447_0_g76356;
				half2 Input_DirectionWS423_g76527 = Global_Wind_DirectionWS4683_g76351;
				float lerpResult128_g76528 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76527 = _MotionSpeed_10;
				half Input_MotionVariation284_g76527 = _MotionVariation_10;
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = v.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				half Input_GlobalMeshVariation569_g76527 = Global_MeshVariation5104_g76351;
				float temp_output_630_0_g76527 = ( ( ( lerpResult128_g76528 * Input_MotionSpeed62_g76527 ) + ( Input_MotionVariation284_g76527 * Input_GlobalMeshVariation569_g76527 ) ) * 0.03 );
				float temp_output_607_0_g76527 = frac( temp_output_630_0_g76527 );
				float4 lerpResult590_g76527 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * temp_output_607_0_g76527 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * frac( ( temp_output_630_0_g76527 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76527 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76527 = lerpResult590_g76527;
				float2 temp_output_645_0_g76527 = ((Noise_Complex703_g76527).rg*2.0 + -1.0);
				float2 break650_g76527 = temp_output_645_0_g76527;
				float3 appendResult649_g76527 = (float3(break650_g76527.x , 0.0 , break650_g76527.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76527 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76510 = Global_Noise_OS5548_g76351;
				float2 break448_g76356 = temp_output_447_0_g76356;
				float3 appendResult452_g76356 = (float3(break448_g76356.x , 0.0 , break448_g76356.y));
				half2 Global_Wind_DirectionOS5692_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76510 = Global_Wind_DirectionOS5692_g76351;
				float temp_output_84_0_g76362 = _LayerMotionValue;
				float temp_output_19_0_g76366 = TVE_MotionUsage[(int)temp_output_84_0_g76362];
				float4 temp_output_91_19_g76362 = TVE_MotionCoords;
				half2 UV94_g76362 = ( (temp_output_91_19_g76362).zw + ( (temp_output_91_19_g76362).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76362 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76362,temp_output_84_0_g76362, 0.0 );
				float4 temp_output_17_0_g76366 = tex2DArrayNode50_g76362;
				float4 temp_output_112_19_g76362 = TVE_MotionParams;
				float4 temp_output_3_0_g76366 = temp_output_112_19_g76362;
				float4 ifLocalVar18_g76366 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76366 >= 0.5 )
				ifLocalVar18_g76366 = temp_output_17_0_g76366;
				else
				ifLocalVar18_g76366 = temp_output_3_0_g76366;
				float4 lerpResult22_g76366 = lerp( temp_output_3_0_g76366 , temp_output_17_0_g76366 , temp_output_19_0_g76366);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76366 = lerpResult22_g76366;
				#else
				float4 staticSwitch24_g76366 = ifLocalVar18_g76366;
				#endif
				half4 Global_Motion_Params3909_g76351 = staticSwitch24_g76366;
				float4 break322_g76356 = Global_Motion_Params3909_g76351;
				float lerpResult457_g76356 = lerp( break322_g76356.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76356 = ( 1.0 - lerpResult457_g76356 );
				half Global_Wind_Power2223_g76351 = ( 1.0 - ( temp_output_459_0_g76356 * temp_output_459_0_g76356 ) );
				half Input_WindPower449_g76510 = Global_Wind_Power2223_g76351;
				float2 lerpResult516_g76510 = lerp( Input_Noise_DirectionOS487_g76510 , Input_Wind_DirectionOS458_g76510 , ( Input_WindPower449_g76510 * 0.6 ));
				half Mesh_Motion_107572_g76351 = v.ase_color.a;
				half Input_MeshHeight388_g76510 = Mesh_Motion_107572_g76351;
				half ObjectData20_g76511 = Input_MeshHeight388_g76510;
				float enc62_g76576 = v.texcoord.w;
				float2 localDecodeFloatToVector262_g76576 = DecodeFloatToVector2( enc62_g76576 );
				float2 break63_g76576 = ( localDecodeFloatToVector262_g76576 * 100.0 );
				float Bounds_Height5230_g76351 = break63_g76576.x;
				half Input_BoundsHeight390_g76510 = Bounds_Height5230_g76351;
				half WorldData19_g76511 = ( Input_MeshHeight388_g76510 * Input_MeshHeight388_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76511 = WorldData19_g76511;
				#else
				float staticSwitch14_g76511 = ObjectData20_g76511;
				#endif
				half Final_Motion10_Mask321_g76510 = ( staticSwitch14_g76511 * 2.0 );
				half Input_BendingAmplitude376_g76510 = _MotionAmplitude_10;
				half Global_MotionValue640_g76510 = TVE_MotionValue_10;
				half2 Final_Bending631_g76510 = ( lerpResult516_g76510 * ( Final_Motion10_Mask321_g76510 * Input_BendingAmplitude376_g76510 * Input_WindPower449_g76510 * Input_WindPower449_g76510 * Global_MotionValue640_g76510 ) );
				float2 appendResult433_g76356 = (float2(break322_g76356.x , break322_g76356.y));
				float2 temp_output_436_0_g76356 = (appendResult433_g76356*2.0 + -1.0);
				float2 break441_g76356 = temp_output_436_0_g76356;
				float3 appendResult440_g76356 = (float3(break441_g76356.x , 0.0 , break441_g76356.y));
				half2 Global_React_DirectionOS39_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76510 = Global_React_DirectionOS39_g76351;
				float clampResult17_g76513 = clamp( Input_MeshHeight388_g76510 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76512 = 0.0;
				half Input_InteractionUseMask62_g76510 = _InteractionMaskValue;
				float temp_output_10_0_g76512 = ( Input_InteractionUseMask62_g76510 - temp_output_7_0_g76512 );
				half Final_InteractionRemap594_g76510 = saturate( ( ( clampResult17_g76513 - temp_output_7_0_g76512 ) / ( temp_output_10_0_g76512 + 0.0001 ) ) );
				half ObjectData20_g76514 = Final_InteractionRemap594_g76510;
				half WorldData19_g76514 = ( Final_InteractionRemap594_g76510 * Final_InteractionRemap594_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76514 = WorldData19_g76514;
				#else
				float staticSwitch14_g76514 = ObjectData20_g76514;
				#endif
				half Final_InteractionMask373_g76510 = ( staticSwitch14_g76514 * 2.0 );
				half Input_InteractionAmplitude58_g76510 = _InteractionAmplitude;
				half2 Final_Interaction632_g76510 = ( Input_React_DirectionOS358_g76510 * Final_InteractionMask373_g76510 * Input_InteractionAmplitude58_g76510 );
				half Global_Interaction_Mask66_g76351 = ( break322_g76356.w * break322_g76356.w * break322_g76356.w * break322_g76356.w );
				float Input_InteractionGlobalMask330_g76510 = Global_Interaction_Mask66_g76351;
				half Final_InteractionValue525_g76510 = saturate( ( Input_InteractionAmplitude58_g76510 * Input_InteractionGlobalMask330_g76510 ) );
				float2 lerpResult551_g76510 = lerp( Final_Bending631_g76510 , Final_Interaction632_g76510 , Final_InteractionValue525_g76510);
				float2 break364_g76510 = lerpResult551_g76510;
				float3 appendResult638_g76510 = (float3(break364_g76510.x , 0.0 , break364_g76510.y));
				half3 Motion_10_Interaction7519_g76351 = appendResult638_g76510;
				half3 Angle44_g76486 = Motion_10_Interaction7519_g76351;
				half Angle44_g76487 = (Angle44_g76486).z;
				half3 VertexPos40_g76488 = ( VertexPosRotationAxis50_g76487 + ( VertexPosOtherAxis82_g76487 * cos( Angle44_g76487 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76487 ) * sin( Angle44_g76487 ) ) );
				float3 appendResult74_g76488 = (float3(0.0 , 0.0 , VertexPos40_g76488.z));
				half3 VertexPosRotationAxis50_g76488 = appendResult74_g76488;
				float3 break84_g76488 = VertexPos40_g76488;
				float3 appendResult81_g76488 = (float3(break84_g76488.x , break84_g76488.y , 0.0));
				half3 VertexPosOtherAxis82_g76488 = appendResult81_g76488;
				half Angle44_g76488 = -(Angle44_g76486).x;
				half3 Input_Position419_g76566 = WorldPosition_Shifted7477_g76351;
				float3 break459_g76566 = Input_Position419_g76566;
				float Sum_Position446_g76566 = ( break459_g76566.x + break459_g76566.y + break459_g76566.z );
				half Input_MotionScale321_g76566 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76566 = _MotionVariation_20;
				half Input_GlobalVariation400_g76566 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76567 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76566 = _MotionSpeed_20;
				float temp_output_404_0_g76566 = ( lerpResult128_g76567 * Input_MotionSpeed62_g76566 );
				half Motion_SineA450_g76566 = sin( ( ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) + ( Input_MotionVariation330_g76566 * Input_GlobalVariation400_g76566 ) + temp_output_404_0_g76566 ) );
				half Motion_SineB395_g76566 = sin( ( ( temp_output_404_0_g76566 * 0.6842 ) + ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) ) );
				half3 Input_Position419_g76585 = VertexPosition3588_g76351;
				float3 normalizeResult518_g76585 = normalize( Input_Position419_g76585 );
				half2 Input_DirectionOS423_g76585 = Global_React_DirectionOS39_g76351;
				float2 break521_g76585 = -Input_DirectionOS423_g76585;
				float3 appendResult522_g76585 = (float3(break521_g76585.x , 0.0 , break521_g76585.y));
				float dotResult519_g76585 = dot( normalizeResult518_g76585 , appendResult522_g76585 );
				half Input_Value62_g76585 = _MotionFacingValue;
				float lerpResult524_g76585 = lerp( 1.0 , (dotResult519_g76585*0.5 + 0.5) , Input_Value62_g76585);
				half ObjectData20_g76586 = max( lerpResult524_g76585 , 0.001 );
				half WorldData19_g76586 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76586 = WorldData19_g76586;
				#else
				float staticSwitch14_g76586 = ObjectData20_g76586;
				#endif
				half Motion_FacingMask5214_g76351 = staticSwitch14_g76586;
				half Motion_20_Amplitude4381_g76351 = Motion_FacingMask5214_g76351;
				half Input_MotionAmplitude384_g76566 = Motion_20_Amplitude4381_g76351;
				half Input_GlobalWind407_g76566 = Global_Wind_Power2223_g76351;
				float4 break638_g76527 = abs( Noise_Complex703_g76527 );
				half Global_Noise_B5526_g76351 = break638_g76527.b;
				half Input_GlobalNoise411_g76566 = Global_Noise_B5526_g76351;
				float lerpResult413_g76566 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76566);
				half Motion_Amplitude418_g76566 = ( Input_MotionAmplitude384_g76566 * Input_GlobalWind407_g76566 * pow( Input_GlobalNoise411_g76566 , lerpResult413_g76566 ) );
				half Input_Squash58_g76566 = _MotionAmplitude_20;
				float enc59_g76576 = v.texcoord.z;
				float2 localDecodeFloatToVector259_g76576 = DecodeFloatToVector2( enc59_g76576 );
				float2 break61_g76576 = localDecodeFloatToVector259_g76576;
				half Mesh_Motion_2060_g76351 = break61_g76576.x;
				half Input_MeshMotion_20388_g76566 = Mesh_Motion_2060_g76351;
				float Bounds_Radius5231_g76351 = break63_g76576.y;
				half Input_BoundsRadius390_g76566 = Bounds_Radius5231_g76351;
				half Global_MotionValue462_g76566 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76566 = Global_React_DirectionOS39_g76351;
				float2 break371_g76566 = Input_DirectionOS366_g76566;
				float3 appendResult372_g76566 = (float3(break371_g76566.x , ( Motion_SineA450_g76566 * 0.3 ) , break371_g76566.y));
				half3 Motion_20_Squash4418_g76351 = ( ( (max( Motion_SineA450_g76566 , Motion_SineB395_g76566 )*0.5 + 0.5) * Motion_Amplitude418_g76566 * Input_Squash58_g76566 * Input_MeshMotion_20388_g76566 * Input_BoundsRadius390_g76566 * Global_MotionValue462_g76566 ) * appendResult372_g76566 );
				half3 VertexPos40_g76472 = ( ( VertexPosRotationAxis50_g76488 + ( VertexPosOtherAxis82_g76488 * cos( Angle44_g76488 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76488 ) * sin( Angle44_g76488 ) ) ) + Motion_20_Squash4418_g76351 );
				float3 appendResult74_g76472 = (float3(0.0 , VertexPos40_g76472.y , 0.0));
				float3 VertexPosRotationAxis50_g76472 = appendResult74_g76472;
				float3 break84_g76472 = VertexPos40_g76472;
				float3 appendResult81_g76472 = (float3(break84_g76472.x , 0.0 , break84_g76472.z));
				float3 VertexPosOtherAxis82_g76472 = appendResult81_g76472;
				half Input_Rolling379_g76566 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76351 = ( Motion_SineA450_g76566 * Motion_Amplitude418_g76566 * Input_Rolling379_g76566 * Input_MeshMotion_20388_g76566 * Global_MotionValue462_g76566 );
				half Angle44_g76472 = Motion_20_Rolling5257_g76351;
				half3 Input_Position500_g76523 = WorldPosition_Shifted7477_g76351;
				half Input_MotionScale321_g76523 = _MotionScale_32;
				half Input_MotionVariation330_g76523 = _MotionVariation_32;
				half Input_GlobalVariation372_g76523 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76524 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76523 = _MotionSpeed_32;
				float4 tex2DNode460_g76523 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76523).xz * Input_MotionScale321_g76523 * 0.03 ) + ( Input_MotionVariation330_g76523 * Input_GlobalVariation372_g76523 ) + ( lerpResult128_g76524 * Input_MotionSpeed62_g76523 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76523 = (float3(tex2DNode460_g76523.r , tex2DNode460_g76523.g , tex2DNode460_g76523.b));
				half3 Flutter_Texture489_g76523 = (appendResult462_g76523*2.0 + -1.0);
				float temp_output_7_0_g76401 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76401 = ( TVE_MotionFadeStart - temp_output_7_0_g76401 );
				half Motion_FadeOut4005_g76351 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76401 ) / ( temp_output_10_0_g76401 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76351 = ( _MotionAmplitude_32 * Motion_FacingMask5214_g76351 * Motion_FadeOut4005_g76351 );
				half Input_MotionAmplitude58_g76523 = Motion_30_Amplitude4960_g76351;
				half Mesh_Motion_30144_g76351 = break61_g76576.y;
				half Input_MeshMotion_30374_g76523 = Mesh_Motion_30144_g76351;
				half Input_GlobalWind471_g76523 = Global_Wind_Power2223_g76351;
				half Global_MotionValue503_g76523 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g76523 = Global_Noise_B5526_g76351;
				float lerpResult466_g76523 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76523);
				half Flutter_Amplitude491_g76523 = ( Input_MotionAmplitude58_g76523 * Input_MeshMotion_30374_g76523 * Input_GlobalWind471_g76523 * Global_MotionValue503_g76523 * pow( Input_GlobalNoise472_g76523 , lerpResult466_g76523 ) );
				half3 Motion_30_Flutter263_g76351 = ( Flutter_Texture489_g76523 * Flutter_Amplitude491_g76523 );
				float3 Vertex_Motion_Object833_g76351 = ( ( VertexPosRotationAxis50_g76472 + ( VertexPosOtherAxis82_g76472 * cos( Angle44_g76472 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76472 ) * sin( Angle44_g76472 ) ) ) + Motion_30_Flutter263_g76351 );
				half3 ObjectData20_g76419 = Vertex_Motion_Object833_g76351;
				float3 temp_output_3474_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				float3 Vertex_Motion_World1118_g76351 = ( ( ( temp_output_3474_0_g76351 + Motion_10_Interaction7519_g76351 ) + Motion_20_Squash4418_g76351 ) + Motion_30_Flutter263_g76351 );
				half3 WorldData19_g76419 = Vertex_Motion_World1118_g76351;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76419 = WorldData19_g76419;
				#else
				float3 staticSwitch14_g76419 = ObjectData20_g76419;
				#endif
				float3 temp_output_7495_0_g76351 = staticSwitch14_g76419;
				float3 Vertex_Motion7493_g76351 = temp_output_7495_0_g76351;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 break2709_g76351 = cross( ViewDirection3963_g76351 , half3(0,1,0) );
				float3 appendResult2710_g76351 = (float3(-break2709_g76351.z , 0.0 , break2709_g76351.x));
				float3 appendResult2667_g76351 = (float3(Global_MeshVariation5104_g76351 , 0.5 , Global_MeshVariation5104_g76351));
				half Mesh_Height1524_g76351 = v.ase_color.a;
				float dotResult2212_g76351 = dot( ViewDirection3963_g76351 , float3(0,1,0) );
				half Mask_HView2656_g76351 = dotResult2212_g76351;
				float saferPower2652_g76351 = abs( Mask_HView2656_g76351 );
				half3 Grass_Perspective2661_g76351 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76351 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76351*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76351 * pow( saferPower2652_g76351 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76383 = _LayerVertexValue;
				float temp_output_19_0_g76387 = TVE_VertexUsage[(int)temp_output_84_0_g76383];
				float4 temp_output_94_19_g76383 = TVE_VertexCoords;
				half2 UV97_g76383 = ( (temp_output_94_19_g76383).zw + ( (temp_output_94_19_g76383).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76383 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76383,temp_output_84_0_g76383, 0.0 );
				float4 temp_output_17_0_g76387 = tex2DArrayNode50_g76383;
				float4 temp_output_111_19_g76383 = TVE_VertexParams;
				float4 temp_output_3_0_g76387 = temp_output_111_19_g76383;
				float4 ifLocalVar18_g76387 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76387 >= 0.5 )
				ifLocalVar18_g76387 = temp_output_17_0_g76387;
				else
				ifLocalVar18_g76387 = temp_output_3_0_g76387;
				float4 lerpResult22_g76387 = lerp( temp_output_3_0_g76387 , temp_output_17_0_g76387 , temp_output_19_0_g76387);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76387 = lerpResult22_g76387;
				#else
				float4 staticSwitch24_g76387 = ifLocalVar18_g76387;
				#endif
				half4 Global_Vertex_Params4173_g76351 = staticSwitch24_g76387;
				float4 break322_g76388 = Global_Vertex_Params4173_g76351;
				half Global_VertexSize174_g76351 = saturate( break322_g76388.w );
				float lerpResult346_g76351 = lerp( 1.0 , Global_VertexSize174_g76351 , _GlobalSize);
				float3 appendResult3480_g76351 = (float3(lerpResult346_g76351 , lerpResult346_g76351 , lerpResult346_g76351));
				half3 ObjectData20_g76416 = appendResult3480_g76351;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76416 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76416 = WorldData19_g76416;
				#else
				float3 staticSwitch14_g76416 = ObjectData20_g76416;
				#endif
				half3 Vertex_Size1741_g76351 = staticSwitch14_g76416;
				float temp_output_7_0_g76417 = _SizeFadeEndValue;
				float temp_output_10_0_g76417 = ( _SizeFadeStartValue - temp_output_7_0_g76417 );
				float temp_output_7453_0_g76351 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76351 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76417 ) / ( temp_output_10_0_g76417 + 0.0001 ) ) );
				float3 appendResult3482_g76351 = (float3(temp_output_7453_0_g76351 , temp_output_7453_0_g76351 , temp_output_7453_0_g76351));
				half3 ObjectData20_g76415 = appendResult3482_g76351;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76415 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76415 = WorldData19_g76415;
				#else
				float3 staticSwitch14_g76415 = ObjectData20_g76415;
				#endif
				float3 Vertex_SizeFade1740_g76351 = staticSwitch14_g76415;
				float3 lerpResult16_g76420 = lerp( VertexPosition3588_g76351 , ( ( ( Vertex_Motion7493_g76351 + Grass_Perspective2661_g76351 ) * Vertex_Size1741_g76351 * Vertex_SizeFade1740_g76351 ) + Mesh_PivotsOS2291_g76351 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76351 = lerpResult16_g76420;
				float3 Final_VertexPosition890_g76351 = ( temp_output_4912_0_g76351 + _DisableSRPBatcher );
				
				float4 break33_g76581 = _second_uvs_mode;
				float2 temp_output_30_0_g76581 = ( v.texcoord.xy * break33_g76581.x );
				float2 appendResult21_g76576 = (float2(v.texcoord1.z , v.texcoord1.w));
				float2 Mesh_DetailCoord3_g76351 = appendResult21_g76576;
				float2 temp_output_29_0_g76581 = ( Mesh_DetailCoord3_g76351 * break33_g76581.y );
				float2 temp_output_31_0_g76581 = ( (WorldPosition_Shifted7477_g76351).xz * break33_g76581.z );
				half2 Second_UVs_Tilling7609_g76351 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7610_g76351 = ( 1.0 / Second_UVs_Tilling7609_g76351 );
				float2 lerpResult7614_g76351 = lerp( Second_UVs_Tilling7609_g76351 , Second_UVs_Scale7610_g76351 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7605_g76351 = (_SecondUVs).zw;
				float2 vertexToFrag11_g76377 = ( ( ( temp_output_30_0_g76581 + temp_output_29_0_g76581 + temp_output_31_0_g76581 ) * lerpResult7614_g76351 ) + Second_UVs_Offset7605_g76351 );
				o.ase_texcoord9.xy = vertexToFrag11_g76377;
				o.ase_texcoord10.xyz = vertexToFrag3890_g76351;
				o.ase_texcoord11.xyz = vertexToFrag4224_g76351;
				half Global_Noise_A4860_g76351 = break638_g76527.a;
				half Tint_Highlight_Value3231_g76351 = ( Global_Noise_A4860_g76351 * Global_Wind_Power2223_g76351 * Motion_FadeOut4005_g76351 * Mesh_Height1524_g76351 );
				float vertexToFrag11_g76392 = Tint_Highlight_Value3231_g76351;
				o.ase_texcoord9.z = vertexToFrag11_g76392;
				
				o.ase_texcoord8 = v.texcoord;
				o.ase_color = v.ase_color;
				o.ase_normal = v.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.w = 0;
				o.ase_texcoord10.w = 0;
				o.ase_texcoord11.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76351;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				OUTPUT_SH4( vertexInput.positionWS, normalInput.normalWS.xyz, GetWorldSpaceNormalizeViewDir( vertexInput.positionWS ), o.lightmapUVOrVertexSH.xyz );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				o.fogFactorAndVertexLight = half4(0, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.texcoord = v.texcoord;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			FragmentOutput frag ( VertexOutput IN
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								, bool ase_vface : SV_IsFrontFace )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				half2 Main_UVs15_g76351 = ( ( IN.ase_texcoord8.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76351 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76351 );
				float3 lerpResult6223_g76351 = lerp( float3( 1,1,1 ) , (tex2DNode29_g76351).rgb , _MainAlbedoValue);
				float4 tex2DNode35_g76351 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				half Main_Mask57_g76351 = tex2DNode35_g76351.b;
				float clampResult17_g76560 = clamp( Main_Mask57_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76561 = _MainMaskMinValue;
				float temp_output_10_0_g76561 = ( _MainMaskMaxValue - temp_output_7_0_g76561 );
				half Main_Mask_Remap5765_g76351 = saturate( ( ( clampResult17_g76560 - temp_output_7_0_g76561 ) / ( temp_output_10_0_g76561 + 0.0001 ) ) );
				float lerpResult7671_g76351 = lerp( 1.0 , Main_Mask_Remap5765_g76351 , _MainColorMode);
				float4 lerpResult7654_g76351 = lerp( _MainColorTwo , _MainColor , lerpResult7671_g76351);
				half3 Main_Color_RGB7657_g76351 = (lerpResult7654_g76351).rgb;
				half3 Main_Albedo99_g76351 = ( lerpResult6223_g76351 * Main_Color_RGB7657_g76351 );
				float2 vertexToFrag11_g76377 = IN.ase_texcoord9.xy;
				half2 Second_UVs17_g76351 = vertexToFrag11_g76377;
				float4 tex2DNode89_g76351 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76351 );
				float3 lerpResult6225_g76351 = lerp( float3( 1,1,1 ) , (tex2DNode89_g76351).rgb , _SecondAlbedoValue);
				float4 tex2DNode33_g76351 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				half Second_Mask81_g76351 = tex2DNode33_g76351.b;
				float clampResult17_g76563 = clamp( Second_Mask81_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76564 = _SecondMaskMinValue;
				float temp_output_10_0_g76564 = ( _SecondMaskMaxValue - temp_output_7_0_g76564 );
				half Second_Mask_Remap6130_g76351 = saturate( ( ( clampResult17_g76563 - temp_output_7_0_g76564 ) / ( temp_output_10_0_g76564 + 0.0001 ) ) );
				float lerpResult7672_g76351 = lerp( 1.0 , Second_Mask_Remap6130_g76351 , _SecondColorMode);
				float4 lerpResult7662_g76351 = lerp( _SecondColorTwo , _SecondColor , lerpResult7672_g76351);
				half3 Second_Color_RGB7663_g76351 = (lerpResult7662_g76351).rgb;
				half3 Second_Albedo153_g76351 = ( lerpResult6225_g76351 * Second_Color_RGB7663_g76351 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g76393 = 2.0;
				#else
				float staticSwitch1_g76393 = 4.594794;
				#endif
				float3 lerpResult4834_g76351 = lerp( ( Main_Albedo99_g76351 * Second_Albedo153_g76351 * staticSwitch1_g76393 ) , Second_Albedo153_g76351 , _DetailBlendMode);
				float lerpResult6885_g76351 = lerp( Main_Mask57_g76351 , Second_Mask81_g76351 , _DetailMaskMode);
				float clampResult17_g76483 = clamp( lerpResult6885_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76482 = _DetailMaskMinValue;
				float temp_output_10_0_g76482 = ( _DetailMaskMaxValue - temp_output_7_0_g76482 );
				half Blend_Mask_Texture6794_g76351 = saturate( ( ( clampResult17_g76483 - temp_output_7_0_g76482 ) / ( temp_output_10_0_g76482 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76351 = IN.ase_color.b;
				half4 Normal_Packed45_g76559 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				float2 appendResult58_g76559 = (float2(( (Normal_Packed45_g76559).x * (Normal_Packed45_g76559).w ) , (Normal_Packed45_g76559).y));
				half2 Normal_Default50_g76559 = appendResult58_g76559;
				half2 Normal_ASTC41_g76559 = (Normal_Packed45_g76559).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76559 = Normal_ASTC41_g76559;
				#else
				float2 staticSwitch38_g76559 = Normal_Default50_g76559;
				#endif
				half2 Normal_NO_DTX544_g76559 = (Normal_Packed45_g76559).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76559 = Normal_NO_DTX544_g76559;
				#else
				float2 staticSwitch37_g76559 = staticSwitch38_g76559;
				#endif
				float2 temp_output_6555_0_g76351 = ( (staticSwitch37_g76559*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76351 = (float3(temp_output_6555_0_g76351 , 1.0));
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal7389_g76351 = appendResult7388_g76351;
				float3 worldNormal7389_g76351 = float3(dot(tanToWorld0,tanNormal7389_g76351), dot(tanToWorld1,tanNormal7389_g76351), dot(tanToWorld2,tanNormal7389_g76351));
				half3 Main_NormalWS7390_g76351 = worldNormal7389_g76351;
				float lerpResult6884_g76351 = lerp( Mesh_DetailMask90_g76351 , ((Main_NormalWS7390_g76351).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76481 = clamp( lerpResult6884_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76480 = _DetailMeshMinValue;
				float temp_output_10_0_g76480 = ( _DetailMeshMaxValue - temp_output_7_0_g76480 );
				half Blend_Mask_Mesh1540_g76351 = saturate( ( ( clampResult17_g76481 - temp_output_7_0_g76480 ) / ( temp_output_10_0_g76480 + 0.0001 ) ) );
				float clampResult17_g76504 = clamp( ( Blend_Mask_Texture6794_g76351 * Blend_Mask_Mesh1540_g76351 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76552 = _DetailBlendMinValue;
				float temp_output_10_0_g76552 = ( _DetailBlendMaxValue - temp_output_7_0_g76552 );
				half Blend_Mask147_g76351 = ( saturate( ( ( clampResult17_g76504 - temp_output_7_0_g76552 ) / ( temp_output_10_0_g76552 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float3 lerpResult235_g76351 = lerp( Main_Albedo99_g76351 , lerpResult4834_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float3 staticSwitch255_g76351 = lerpResult235_g76351;
				#else
				float3 staticSwitch255_g76351 = Main_Albedo99_g76351;
				#endif
				half3 Blend_Albedo265_g76351 = staticSwitch255_g76351;
				half Mesh_Height1524_g76351 = IN.ase_color.a;
				float temp_output_7_0_g76402 = _GradientMinValue;
				float temp_output_10_0_g76402 = ( _GradientMaxValue - temp_output_7_0_g76402 );
				half Tint_Gradient_Value2784_g76351 = saturate( ( ( Mesh_Height1524_g76351 - temp_output_7_0_g76402 ) / ( temp_output_10_0_g76402 + 0.0001 ) ) );
				float3 lerpResult2779_g76351 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , Tint_Gradient_Value2784_g76351);
				float lerpResult6617_g76351 = lerp( Main_Mask_Remap5765_g76351 , Second_Mask_Remap6130_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6623_g76351 = lerpResult6617_g76351;
				#else
				float staticSwitch6623_g76351 = Main_Mask_Remap5765_g76351;
				#endif
				half Blend_Mask_Remap6621_g76351 = staticSwitch6623_g76351;
				half Tint_Gradient_Mask6207_g76351 = Blend_Mask_Remap6621_g76351;
				float3 lerpResult6208_g76351 = lerp( float3( 1,1,1 ) , lerpResult2779_g76351 , Tint_Gradient_Mask6207_g76351);
				half3 Tint_Gradient_Color5769_g76351 = lerpResult6208_g76351;
				half3 Tint_Noise_Color5770_g76351 = float3(1,1,1);
				half3 Tint_User_Color7335_g76351 = float3(1,1,1);
				float Mesh_Occlusion318_g76351 = IN.ase_color.g;
				float clampResult17_g76399 = clamp( Mesh_Occlusion318_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76405 = _VertexOcclusionMinValue;
				float temp_output_10_0_g76405 = ( _VertexOcclusionMaxValue - temp_output_7_0_g76405 );
				half Occlusion_Mask6432_g76351 = saturate( ( ( clampResult17_g76399 - temp_output_7_0_g76405 ) / ( temp_output_10_0_g76405 + 0.0001 ) ) );
				float3 lerpResult2945_g76351 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Occlusion_Mask6432_g76351);
				half3 Occlusion_Color648_g76351 = lerpResult2945_g76351;
				half3 Matcap_Color7428_g76351 = half3(0,0,0);
				half3 Blend_Albedo_Tinted2808_g76351 = ( ( Blend_Albedo265_g76351 * Tint_Gradient_Color5769_g76351 * Tint_Noise_Color5770_g76351 * Tint_User_Color7335_g76351 * Occlusion_Color648_g76351 ) + Matcap_Color7428_g76351 );
				float3 temp_output_3_0_g76397 = Blend_Albedo_Tinted2808_g76351;
				float dotResult20_g76397 = dot( temp_output_3_0_g76397 , float3(0.2126,0.7152,0.0722) );
				half Blend_Albedo_Grayscale5939_g76351 = dotResult20_g76397;
				float3 temp_cast_1 = (Blend_Albedo_Grayscale5939_g76351).xxx;
				float temp_output_82_0_g76372 = _LayerColorsValue;
				float temp_output_19_0_g76376 = TVE_ColorsUsage[(int)temp_output_82_0_g76372];
				float4 temp_output_91_19_g76372 = TVE_ColorsCoords;
				float3 vertexToFrag3890_g76351 = IN.ase_texcoord10.xyz;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 vertexToFrag4224_g76351 = IN.ase_texcoord11.xyz;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 lerpResult4822_g76351 = lerp( WorldPosition3905_g76351 , ObjectPosition4223_g76351 , _ColorsPositionMode);
				half2 UV94_g76372 = ( (temp_output_91_19_g76372).zw + ( (temp_output_91_19_g76372).xy * (lerpResult4822_g76351).xz ) );
				float4 tex2DArrayNode83_g76372 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_Linear_Clamp, UV94_g76372,temp_output_82_0_g76372, 0.0 );
				float4 temp_output_17_0_g76376 = tex2DArrayNode83_g76372;
				float4 temp_output_92_86_g76372 = TVE_ColorsParams;
				float4 temp_output_3_0_g76376 = temp_output_92_86_g76372;
				float4 ifLocalVar18_g76376 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76376 >= 0.5 )
				ifLocalVar18_g76376 = temp_output_17_0_g76376;
				else
				ifLocalVar18_g76376 = temp_output_3_0_g76376;
				float4 lerpResult22_g76376 = lerp( temp_output_3_0_g76376 , temp_output_17_0_g76376 , temp_output_19_0_g76376);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76376 = lerpResult22_g76376;
				#else
				float4 staticSwitch24_g76376 = ifLocalVar18_g76376;
				#endif
				half4 Global_Colors_Params5434_g76351 = staticSwitch24_g76376;
				float4 temp_output_346_0_g76358 = Global_Colors_Params5434_g76351;
				half Global_Colors_A1701_g76351 = saturate( (temp_output_346_0_g76358).w );
				half Colors_Influence3668_g76351 = Global_Colors_A1701_g76351;
				float temp_output_6306_0_g76351 = ( 1.0 - Colors_Influence3668_g76351 );
				float3 lerpResult3618_g76351 = lerp( Blend_Albedo_Tinted2808_g76351 , temp_cast_1 , ( 1.0 - ( temp_output_6306_0_g76351 * temp_output_6306_0_g76351 ) ));
				half3 Global_Colors_RGB1700_g76351 = (temp_output_346_0_g76358).xyz;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g76389 = 2.0;
				#else
				float staticSwitch1_g76389 = 4.594794;
				#endif
				half3 Colors_RGB1954_g76351 = ( Global_Colors_RGB1700_g76351 * staticSwitch1_g76389 * _ColorsIntensityValue );
				float lerpResult7679_g76351 = lerp( 1.0 , Blend_Mask_Remap6621_g76351 , _ColorsMaskValue);
				half Colors_Value3692_g76351 = ( lerpResult7679_g76351 * _GlobalColors );
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = IN.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				float lerpResult3870_g76351 = lerp( 1.0 , Global_MeshVariation5104_g76351 , _ColorsVariationValue);
				half Colors_Variation3650_g76351 = lerpResult3870_g76351;
				half Occlusion_Alpha6463_g76351 = _VertexOcclusionColor.a;
				float lerpResult6459_g76351 = lerp( Occlusion_Mask6432_g76351 , ( 1.0 - Occlusion_Mask6432_g76351 ) , _VertexOcclusionColorsMode);
				float lerpResult6461_g76351 = lerp( Occlusion_Alpha6463_g76351 , 1.0 , lerpResult6459_g76351);
				half Occlusion_Colors6450_g76351 = lerpResult6461_g76351;
				float3 temp_output_3_0_g76398 = ( Blend_Albedo265_g76351 * Tint_Gradient_Color5769_g76351 * Tint_Noise_Color5770_g76351 );
				float dotResult20_g76398 = dot( temp_output_3_0_g76398 , float3(0.2126,0.7152,0.0722) );
				float clampResult6740_g76351 = clamp( saturate( ( dotResult20_g76398 * 5.0 ) ) , 0.2 , 1.0 );
				half Blend_Albedo_Globals6410_g76351 = clampResult6740_g76351;
				float temp_output_7_0_g76489 = 0.1;
				float temp_output_10_0_g76489 = ( 0.2 - temp_output_7_0_g76489 );
				float lerpResult16_g76390 = lerp( 0.0 , saturate( ( ( ( Colors_Value3692_g76351 * Colors_Influence3668_g76351 * Colors_Variation3650_g76351 * Occlusion_Colors6450_g76351 * Blend_Albedo_Globals6410_g76351 ) - temp_output_7_0_g76489 ) / ( temp_output_10_0_g76489 + 0.0001 ) ) ) , TVE_IsEnabled);
				float3 lerpResult3628_g76351 = lerp( Blend_Albedo_Tinted2808_g76351 , ( lerpResult3618_g76351 * Colors_RGB1954_g76351 ) , lerpResult16_g76390);
				half3 Blend_Albedo_Colored_High6027_g76351 = lerpResult3628_g76351;
				half3 Blend_Albedo_Colored863_g76351 = Blend_Albedo_Colored_High6027_g76351;
				half3 Global_OverlayColor1758_g76351 = (TVE_OverlayColor).rgb;
				float temp_output_84_0_g76367 = _LayerExtrasValue;
				float temp_output_19_0_g76371 = TVE_ExtrasUsage[(int)temp_output_84_0_g76367];
				float4 temp_output_93_19_g76367 = TVE_ExtrasCoords;
				float3 lerpResult4827_g76351 = lerp( WorldPosition3905_g76351 , ObjectPosition4223_g76351 , _ExtrasPositionMode);
				half2 UV96_g76367 = ( (temp_output_93_19_g76367).zw + ( (temp_output_93_19_g76367).xy * (lerpResult4827_g76351).xz ) );
				float4 tex2DArrayNode48_g76367 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76367,temp_output_84_0_g76367, 0.0 );
				float4 temp_output_17_0_g76371 = tex2DArrayNode48_g76367;
				float4 temp_output_94_85_g76367 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76371 = temp_output_94_85_g76367;
				float4 ifLocalVar18_g76371 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76371 >= 0.5 )
				ifLocalVar18_g76371 = temp_output_17_0_g76371;
				else
				ifLocalVar18_g76371 = temp_output_3_0_g76371;
				float4 lerpResult22_g76371 = lerp( temp_output_3_0_g76371 , temp_output_17_0_g76371 , temp_output_19_0_g76371);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76371 = lerpResult22_g76371;
				#else
				float4 staticSwitch24_g76371 = ifLocalVar18_g76371;
				#endif
				half4 Global_Extras_Params5440_g76351 = staticSwitch24_g76371;
				float4 break456_g76381 = Global_Extras_Params5440_g76351;
				half Global_Extras_Overlay156_g76351 = break456_g76381.z;
				float lerpResult1065_g76351 = lerp( 1.0 , Global_MeshVariation5104_g76351 , _OverlayVariationValue);
				half Overlay_Variation4560_g76351 = lerpResult1065_g76351;
				half Overlay_Value5738_g76351 = ( _GlobalOverlay * Global_Extras_Overlay156_g76351 * Overlay_Variation4560_g76351 );
				half2 Main_Normal137_g76351 = temp_output_6555_0_g76351;
				float2 lerpResult3372_g76351 = lerp( float2( 0,0 ) , Main_Normal137_g76351 , _DetailNormalValue);
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				half4 Normal_Packed45_g76562 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				float2 appendResult58_g76562 = (float2(( (Normal_Packed45_g76562).x * (Normal_Packed45_g76562).w ) , (Normal_Packed45_g76562).y));
				half2 Normal_Default50_g76562 = appendResult58_g76562;
				half2 Normal_ASTC41_g76562 = (Normal_Packed45_g76562).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76562 = Normal_ASTC41_g76562;
				#else
				float2 staticSwitch38_g76562 = Normal_Default50_g76562;
				#endif
				half2 Normal_NO_DTX544_g76562 = (Normal_Packed45_g76562).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76562 = Normal_NO_DTX544_g76562;
				#else
				float2 staticSwitch37_g76562 = staticSwitch38_g76562;
				#endif
				float2 temp_output_6560_0_g76351 = ( (staticSwitch37_g76562*2.0 + -1.0) * _SecondNormalValue );
				half2 Normal_Planar45_g76565 = temp_output_6560_0_g76351;
				float2 break64_g76565 = Normal_Planar45_g76565;
				float3 appendResult65_g76565 = (float3(break64_g76565.x , 0.0 , break64_g76565.y));
				float2 temp_output_7603_0_g76351 = (mul( ase_worldToTangent, appendResult65_g76565 )).xy;
				float2 ifLocalVar7604_g76351 = 0;
				if( _SecondUVsMode >= 2.0 )
				ifLocalVar7604_g76351 = temp_output_7603_0_g76351;
				else
				ifLocalVar7604_g76351 = temp_output_6560_0_g76351;
				half2 Second_Normal179_g76351 = ifLocalVar7604_g76351;
				float2 temp_output_36_0_g76394 = ( lerpResult3372_g76351 + Second_Normal179_g76351 );
				float2 lerpResult3376_g76351 = lerp( Main_Normal137_g76351 , temp_output_36_0_g76394 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float2 staticSwitch267_g76351 = lerpResult3376_g76351;
				#else
				float2 staticSwitch267_g76351 = Main_Normal137_g76351;
				#endif
				half2 Blend_Normal312_g76351 = staticSwitch267_g76351;
				float3 appendResult7377_g76351 = (float3(Blend_Normal312_g76351 , 1.0));
				float3 tanNormal7376_g76351 = appendResult7377_g76351;
				float3 worldNormal7376_g76351 = float3(dot(tanToWorld0,tanNormal7376_g76351), dot(tanToWorld1,tanNormal7376_g76351), dot(tanToWorld2,tanNormal7376_g76351));
				half3 Blend_NormalWS7375_g76351 = worldNormal7376_g76351;
				float lerpResult7446_g76351 = lerp( (Blend_NormalWS7375_g76351).y , IN.ase_normal.y , Vertex_DynamicMode5112_g76351);
				float lerpResult6757_g76351 = lerp( 1.0 , saturate( lerpResult7446_g76351 ) , _OverlayProjectionValue);
				half Overlay_Projection6081_g76351 = lerpResult6757_g76351;
				half Overlay_Shading6688_g76351 = Blend_Albedo_Globals6410_g76351;
				half Overlay_Custom6707_g76351 = 1.0;
				float lerpResult7693_g76351 = lerp( Occlusion_Mask6432_g76351 , ( 1.0 - Occlusion_Mask6432_g76351 ) , _VertexOcclusionOverlayMode);
				float lerpResult6467_g76351 = lerp( Occlusion_Alpha6463_g76351 , 1.0 , lerpResult7693_g76351);
				half Occlusion_Overlay6471_g76351 = lerpResult6467_g76351;
				float temp_output_7_0_g76403 = 0.1;
				float temp_output_10_0_g76403 = ( 0.2 - temp_output_7_0_g76403 );
				half Overlay_Mask_High6064_g76351 = saturate( ( ( ( Overlay_Value5738_g76351 * Overlay_Projection6081_g76351 * Overlay_Shading6688_g76351 * Overlay_Custom6707_g76351 * Occlusion_Overlay6471_g76351 ) - temp_output_7_0_g76403 ) / ( temp_output_10_0_g76403 + 0.0001 ) ) );
				half Overlay_Mask269_g76351 = Overlay_Mask_High6064_g76351;
				float3 lerpResult336_g76351 = lerp( Blend_Albedo_Colored863_g76351 , Global_OverlayColor1758_g76351 , Overlay_Mask269_g76351);
				half3 Blend_Albedo_Overlay359_g76351 = lerpResult336_g76351;
				half Global_WetnessContrast6502_g76351 = TVE_WetnessContrast;
				half Global_Extras_Wetness305_g76351 = break456_g76381.y;
				half Wetness_Value6343_g76351 = ( Global_Extras_Wetness305_g76351 * _GlobalWetness );
				float3 lerpResult6367_g76351 = lerp( Blend_Albedo_Overlay359_g76351 , ( Blend_Albedo_Overlay359_g76351 * Blend_Albedo_Overlay359_g76351 ) , ( Global_WetnessContrast6502_g76351 * Wetness_Value6343_g76351 ));
				half3 Blend_Albedo_Wetness6351_g76351 = lerpResult6367_g76351;
				float vertexToFrag11_g76392 = IN.ase_texcoord9.z;
				half3 Tint_Highlight_Color5771_g76351 = ( ( (_MotionHighlightColor).rgb * vertexToFrag11_g76392 ) + float3( 1,1,1 ) );
				float3 temp_output_6309_0_g76351 = ( Blend_Albedo_Wetness6351_g76351 * Tint_Highlight_Color5771_g76351 );
				half3 Subsurface_Color1722_g76351 = ( (_SubsurfaceColor).rgb * Blend_Albedo_Wetness6351_g76351 );
				half Global_Subsurface4041_g76351 = TVE_SubsurfaceValue;
				half Global_OverlaySubsurface5667_g76351 = TVE_OverlaySubsurface;
				float lerpResult7362_g76351 = lerp( 1.0 , Global_OverlaySubsurface5667_g76351 , Overlay_Value5738_g76351);
				half Overlay_Subsurface7361_g76351 = lerpResult7362_g76351;
				half Subsurface_Intensity1752_g76351 = ( _SubsurfaceValue * Global_Subsurface4041_g76351 * Overlay_Subsurface7361_g76351 );
				float lerpResult7680_g76351 = lerp( 1.0 , Blend_Mask_Remap6621_g76351 , _SubsurfaceMaskValue);
				half Subsurface_Mask1557_g76351 = lerpResult7680_g76351;
				half3 MainLight_Direction3926_g76351 = TVE_MainLightDirection;
				float3 normalizeResult2169_g76351 = normalize( WorldViewDirection );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float dotResult785_g76351 = dot( -MainLight_Direction3926_g76351 , ViewDirection3963_g76351 );
				float saferPower1624_g76351 = abs( saturate( dotResult785_g76351 ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g76351 = 0.0;
				#else
				float staticSwitch1602_g76351 = ( pow( saferPower1624_g76351 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
				#endif
				half Mask_Subsurface_View782_g76351 = staticSwitch1602_g76351;
				half3 Subsurface_Approximation1693_g76351 = ( Subsurface_Color1722_g76351 * Subsurface_Intensity1752_g76351 * Subsurface_Mask1557_g76351 * Mask_Subsurface_View782_g76351 );
				half3 Blend_Albedo_Subsurface149_g76351 = ( temp_output_6309_0_g76351 + Subsurface_Approximation1693_g76351 );
				half3 Blend_Albedo_RimLight7316_g76351 = Blend_Albedo_Subsurface149_g76351;
				
				half Global_OverlayNormalScale6581_g76351 = TVE_OverlayNormalValue;
				float lerpResult6585_g76351 = lerp( 1.0 , Global_OverlayNormalScale6581_g76351 , Overlay_Mask269_g76351);
				half2 Blend_Normal_Overlay366_g76351 = ( Blend_Normal312_g76351 * lerpResult6585_g76351 );
				half Global_WetnessNormalScale6571_g76351 = TVE_WetnessNormalValue;
				float lerpResult6579_g76351 = lerp( 1.0 , Global_WetnessNormalScale6571_g76351 , ( Wetness_Value6343_g76351 * Wetness_Value6343_g76351 ));
				half2 Blend_Normal_Wetness6372_g76351 = ( Blend_Normal_Overlay366_g76351 * lerpResult6579_g76351 );
				float3 appendResult6568_g76351 = (float3(Blend_Normal_Wetness6372_g76351 , 1.0));
				float3 temp_output_13_0_g76382 = appendResult6568_g76351;
				float3 temp_output_33_0_g76382 = ( temp_output_13_0_g76382 * _render_normals );
				float3 switchResult12_g76382 = (((ase_vface>0)?(temp_output_13_0_g76382):(temp_output_33_0_g76382)));
				
				float3 temp_cast_11 = (0.0).xxx;
				float3 temp_output_7161_0_g76351 = (_EmissiveColor).rgb;
				half3 Emissive_Color7162_g76351 = temp_output_7161_0_g76351;
				half2 Emissive_UVs2468_g76351 = ( ( IN.ase_texcoord8.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float temp_output_7_0_g76582 = _EmissiveTexMinValue;
				float3 temp_cast_12 = (temp_output_7_0_g76582).xxx;
				float temp_output_10_0_g76582 = ( _EmissiveTexMaxValue - temp_output_7_0_g76582 );
				half3 Emissive_Texture7022_g76351 = saturate( ( ( (SAMPLE_TEXTURE2D( _EmissiveTex, sampler_Linear_Repeat, Emissive_UVs2468_g76351 )).rgb - temp_cast_12 ) / ( temp_output_10_0_g76582 + 0.0001 ) ) );
				half Global_Extras_Emissive4203_g76351 = break456_g76381.x;
				float lerpResult4206_g76351 = lerp( 1.0 , Global_Extras_Emissive4203_g76351 , _GlobalEmissive);
				half Emissive_Value7024_g76351 = ( ( lerpResult4206_g76351 * _EmissivePhaseValue ) - 1.0 );
				half3 Emissive_Mask6968_g76351 = saturate( ( Emissive_Texture7022_g76351 + Emissive_Value7024_g76351 ) );
				float3 temp_output_3_0_g76584 = ( Emissive_Color7162_g76351 * Emissive_Mask6968_g76351 );
				float temp_output_15_0_g76584 = _emissive_intensity_value;
				float3 temp_output_23_0_g76584 = ( temp_output_3_0_g76584 * temp_output_15_0_g76584 );
				#ifdef TVE_EMISSIVE
				float3 staticSwitch7687_g76351 = temp_output_23_0_g76584;
				#else
				float3 staticSwitch7687_g76351 = temp_cast_11;
				#endif
				half3 Final_Emissive2476_g76351 = staticSwitch7687_g76351;
				
				half Render_Specular4861_g76351 = _RenderSpecular;
				float3 temp_cast_13 = (( 0.04 * Render_Specular4861_g76351 )).xxx;
				
				half Main_Smoothness227_g76351 = ( tex2DNode35_g76351.a * _MainSmoothnessValue );
				half Second_Smoothness236_g76351 = ( tex2DNode33_g76351.a * _SecondSmoothnessValue );
				float lerpResult266_g76351 = lerp( Main_Smoothness227_g76351 , Second_Smoothness236_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch297_g76351 = lerpResult266_g76351;
				#else
				float staticSwitch297_g76351 = Main_Smoothness227_g76351;
				#endif
				half Blend_Smoothness314_g76351 = staticSwitch297_g76351;
				half Global_OverlaySmoothness311_g76351 = TVE_OverlaySmoothness;
				float lerpResult343_g76351 = lerp( Blend_Smoothness314_g76351 , Global_OverlaySmoothness311_g76351 , Overlay_Mask269_g76351);
				half Blend_Smoothness_Overlay371_g76351 = lerpResult343_g76351;
				float temp_output_6499_0_g76351 = ( 1.0 - Wetness_Value6343_g76351 );
				half Blend_Smoothness_Wetness4130_g76351 = saturate( ( Blend_Smoothness_Overlay371_g76351 + ( 1.0 - ( temp_output_6499_0_g76351 * temp_output_6499_0_g76351 ) ) ) );
				
				float lerpResult240_g76351 = lerp( 1.0 , tex2DNode35_g76351.g , _MainOcclusionValue);
				half Main_Occlusion247_g76351 = lerpResult240_g76351;
				float lerpResult239_g76351 = lerp( 1.0 , tex2DNode33_g76351.g , _SecondOcclusionValue);
				half Second_Occlusion251_g76351 = lerpResult239_g76351;
				float lerpResult294_g76351 = lerp( Main_Occlusion247_g76351 , Second_Occlusion251_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch310_g76351 = lerpResult294_g76351;
				#else
				float staticSwitch310_g76351 = Main_Occlusion247_g76351;
				#endif
				half Blend_Occlusion323_g76351 = staticSwitch310_g76351;
				
				float localCustomAlphaClip19_g76558 = ( 0.0 );
				half Main_Alpha316_g76351 = tex2DNode29_g76351.a;
				half Second_Alpha5007_g76351 = tex2DNode89_g76351.a;
				float lerpResult6153_g76351 = lerp( Main_Alpha316_g76351 , Second_Alpha5007_g76351 , Blend_Mask147_g76351);
				float lerpResult6785_g76351 = lerp( ( Main_Alpha316_g76351 * Second_Alpha5007_g76351 ) , lerpResult6153_g76351 , _DetailAlphaMode);
				#ifdef TVE_DETAIL
				float staticSwitch6158_g76351 = lerpResult6785_g76351;
				#else
				float staticSwitch6158_g76351 = Main_Alpha316_g76351;
				#endif
				half Blend_Alpha6157_g76351 = staticSwitch6158_g76351;
				half AlphaTreshold2132_g76351 = _AlphaClipValue;
				half Global_Extras_Alpha1033_g76351 = saturate( break456_g76381.w );
				float lerpResult5154_g76351 = lerp( 0.0 , Global_MeshVariation5104_g76351 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76351 = lerpResult5154_g76351;
				float Emissive_Alpha7625_g76351 = 0.0;
				float lerpResult6866_g76351 = lerp( ( 1.0 - Blend_Mask147_g76351 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_DETAIL
				float staticSwitch6612_g76351 = lerpResult6866_g76351;
				#else
				float staticSwitch6612_g76351 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76351 = staticSwitch6612_g76351;
				half Alpha_Mask6234_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5203_g76351 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76351 - saturate( ( Global_Alpha_Variation5158_g76351 + Emissive_Alpha7625_g76351 ) ) ) + ( Global_Extras_Alpha1033_g76351 * 0.1 ) ) ) , ( Alpha_Mask6234_g76351 * _GlobalAlpha ));
				float lerpResult16_g76395 = lerp( 1.0 , lerpResult5203_g76351 , TVE_IsEnabled);
				half Global_Alpha315_g76351 = lerpResult16_g76395;
				float3 normalizeResult3971_g76351 = normalize( cross( ddy( WorldPosition ) , ddx( WorldPosition ) ) );
				float3 WorldNormal_Derivates3972_g76351 = normalizeResult3971_g76351;
				float dotResult3851_g76351 = dot( ViewDirection3963_g76351 , WorldNormal_Derivates3972_g76351 );
				float lerpResult3993_g76351 = lerp( 1.0 , saturate( ( abs( dotResult3851_g76351 ) * 3.0 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g76351 = lerpResult3993_g76351;
				half Fade_Effects_A5360_g76351 = Fade_Glancing3853_g76351;
				float temp_output_7_0_g76404 = TVE_CameraFadeMin;
				float temp_output_10_0_g76404 = ( TVE_CameraFadeMax - temp_output_7_0_g76404 );
				float lerpResult4755_g76351 = lerp( 1.0 , saturate( saturate( ( ( distance( WorldPosition , _WorldSpaceCameraPos ) - temp_output_7_0_g76404 ) / ( temp_output_10_0_g76404 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76351 = lerpResult4755_g76351;
				half Fade_Effects_B6228_g76351 = ( Fade_Effects_A5360_g76351 * Fade_Camera3743_g76351 );
				half Fade_Mask5149_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5141_g76351 = lerp( 1.0 , ( Fade_Effects_B6228_g76351 * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76351);
				half Fade_Effects_C7653_g76351 = lerpResult5141_g76351;
				float temp_output_5865_0_g76351 = saturate( ( Fade_Effects_C7653_g76351 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76351 ) ).r ) );
				half Fade_Alpha3727_g76351 = temp_output_5865_0_g76351;
				half Final_Alpha7344_g76351 = min( ( ( Blend_Alpha6157_g76351 - AlphaTreshold2132_g76351 ) * Global_Alpha315_g76351 ) , Fade_Alpha3727_g76351 );
				float temp_output_3_0_g76558 = Final_Alpha7344_g76351;
				float Alpha19_g76558 = temp_output_3_0_g76558;
				float temp_output_15_0_g76558 = 0.01;
				float Treshold19_g76558 = temp_output_15_0_g76558;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#else
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#endif
				}
				half Main_Color_Alpha6121_g76351 = (lerpResult7654_g76351).a;
				half Second_Color_Alpha6152_g76351 = (lerpResult7662_g76351).a;
				float lerpResult6168_g76351 = lerp( Main_Color_Alpha6121_g76351 , Second_Color_Alpha6152_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6174_g76351 = lerpResult6168_g76351;
				#else
				float staticSwitch6174_g76351 = Main_Color_Alpha6121_g76351;
				#endif
				half Blend_Color_Alpha6167_g76351 = staticSwitch6174_g76351;
				half Final_Clip914_g76351 = saturate( ( Alpha19_g76558 * Blend_Color_Alpha6167_g76351 ) );
				

				float3 BaseColor = Blend_Albedo_RimLight7316_g76351;
				float3 Normal = switchResult12_g76382;
				float3 Emission = Final_Emissive2476_g76351;
				float3 Specular = temp_cast_13;
				float Metallic = 0;
				float Smoothness = Blend_Smoothness_Wetness4130_g76351;
				float Occlusion = Blend_Occlusion323_g76351;
				float Alpha = Final_Clip914_g76351;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.positionCS;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = WorldNormal;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( WorldViewDirection );

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#else
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
					#elif !defined(LIGHTMAP_ON) && (defined(PROBE_VOLUMES_L1) || defined(PROBE_VOLUMES_L2))
						inputData.bakedGI = SAMPLE_GI( SH,
							GetAbsolutePositionWS(inputData.positionWS),
							inputData.normalWS,
							inputData.viewDirectionWS,
							inputData.positionCS.xy);
					#else
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
						#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				#ifdef _DBUFFER
					ApplyDecal(IN.positionCS,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData
				(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SecondColor;
			half4 _MotionHighlightColor;
			half4 _SubsurfaceColor;
			half4 _NoiseMaskRemap;
			half4 _MainColorTwo;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColorTwo;
			half4 _MainUVs;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _DetailMeshRemap;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half4 _DetailMaskRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _RimLightRemap;
			half4 _MainColor;
			half3 _render_normals;
			half _SecondColorMode;
			half _DetailBlendMode;
			half _DetailMaskMode;
			half _DetailMaskMinValue;
			half _DetailMaskMaxValue;
			half _MainNormalValue;
			half _DetailMeshMode;
			half _DetailMeshMinValue;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _MainMaskMaxValue;
			half _SecondAlbedoValue;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			half _GlobalSize;
			half _SizeFadeEndValue;
			half _SizeFadeStartValue;
			half _MainAlbedoValue;
			half _MainMaskMinValue;
			half _DetailMeshMaxValue;
			half _MainColorMode;
			half _SecondUVsScaleMode;
			half _SecondMaskMinValue;
			half _DetailBlendMinValue;
			half _GradientMaxValue;
			half _DetailMode;
			half _SubsurfaceValue;
			half _SubsurfaceMaskValue;
			half _EmissiveTexMinValue;
			half _EmissiveTexMaxValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _FadeGlancingValue;
			half _SecondSmoothnessValue;
			half _DetailBlendMaxValue;
			half _VertexOcclusionOverlayMode;
			half _SecondNormalValue;
			half _DetailValue;
			half _GradientMinValue;
			half _MotionAmplitude_20;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _ColorsIntensityValue;
			half _OverlayProjectionValue;
			half _ColorsMaskValue;
			half _ColorsVariationValue;
			half _VertexOcclusionColorsMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _OverlayVariationValue;
			half _DetailNormalValue;
			half _SecondUVsMode;
			half _GlobalColors;
			half _MotionFacingValue;
			half _LayerMotionValue;
			half _MotionVariation_20;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _RenderDirect;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _Cutoff;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _IsVersion;
			half _HasEmissive;
			half _render_src;
			half _render_zw;
			half _render_dst;
			half _render_coverage;
			half _IsStandardShader;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageGlobalsVariation;
			half _IsTVEShader;
			half _HasOcclusion;
			half _IsIdentifier;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _VertexVariationMode;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MessageMotionVariation;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _MessageOcclusion;
			half _EmissiveMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_20;
			half _DetailMaskInvertMode;
			half _CategoryMotion;
			half _ColorsMaskMaxValue;
			half _RenderCoverage;
			half _MessageSubsurface;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderZWrite;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderClip;
			half _ColorsMaskMinValue;
			half _FadeConstantValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g76351 = v.positionOS.xyz;
				float3 appendResult60_g76361 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76351 = ( appendResult60_g76361 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76351 = Mesh_PivotsData2831_g76351;
				float3 temp_output_2283_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				half3 VertexPos40_g76486 = temp_output_2283_0_g76351;
				half3 VertexPos40_g76487 = VertexPos40_g76486;
				float3 appendResult74_g76487 = (float3(VertexPos40_g76487.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76487 = appendResult74_g76487;
				float3 break84_g76487 = VertexPos40_g76487;
				float3 appendResult81_g76487 = (float3(0.0 , break84_g76487.y , break84_g76487.z));
				half3 VertexPosOtherAxis82_g76487 = appendResult81_g76487;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g76351 = ase_worldPos;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 WorldPosition_Shifted7477_g76351 = ( WorldPosition3905_g76351 - TVE_WorldOrigin );
				float4x4 break19_g76407 = GetObjectToWorldMatrix();
				float3 appendResult20_g76407 = (float3(break19_g76407[ 0 ][ 3 ] , break19_g76407[ 1 ][ 3 ] , break19_g76407[ 2 ][ 3 ]));
				float3 temp_output_122_0_g76407 = Mesh_PivotsData2831_g76351;
				float3 PivotsOnly105_g76407 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76407 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g76409 = ( appendResult20_g76407 + PivotsOnly105_g76407 );
				half3 WorldData19_g76409 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76409 = WorldData19_g76409;
				#else
				float3 staticSwitch14_g76409 = ObjectData20_g76409;
				#endif
				float3 temp_output_114_0_g76407 = staticSwitch14_g76409;
				float3 vertexToFrag4224_g76351 = temp_output_114_0_g76407;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				float3 lerpResult6766_g76351 = lerp( WorldPosition_Shifted7477_g76351 , ObjectPosition_Shifted7481_g76351 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76351 = lerpResult6766_g76351;
				half3 Input_Position419_g76527 = Motion_10_Position6738_g76351;
				float Input_MotionScale287_g76527 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76527 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76527 = (( Input_Position419_g76527 * Input_MotionScale287_g76527 * NoiseTex_Tilling735_g76527 * 0.0075 )).xz;
				float2 temp_output_447_0_g76356 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76351 = temp_output_447_0_g76356;
				half2 Input_DirectionWS423_g76527 = Global_Wind_DirectionWS4683_g76351;
				float lerpResult128_g76528 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76527 = _MotionSpeed_10;
				half Input_MotionVariation284_g76527 = _MotionVariation_10;
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = v.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				half Input_GlobalMeshVariation569_g76527 = Global_MeshVariation5104_g76351;
				float temp_output_630_0_g76527 = ( ( ( lerpResult128_g76528 * Input_MotionSpeed62_g76527 ) + ( Input_MotionVariation284_g76527 * Input_GlobalMeshVariation569_g76527 ) ) * 0.03 );
				float temp_output_607_0_g76527 = frac( temp_output_630_0_g76527 );
				float4 lerpResult590_g76527 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * temp_output_607_0_g76527 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * frac( ( temp_output_630_0_g76527 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76527 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76527 = lerpResult590_g76527;
				float2 temp_output_645_0_g76527 = ((Noise_Complex703_g76527).rg*2.0 + -1.0);
				float2 break650_g76527 = temp_output_645_0_g76527;
				float3 appendResult649_g76527 = (float3(break650_g76527.x , 0.0 , break650_g76527.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76527 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76510 = Global_Noise_OS5548_g76351;
				float2 break448_g76356 = temp_output_447_0_g76356;
				float3 appendResult452_g76356 = (float3(break448_g76356.x , 0.0 , break448_g76356.y));
				half2 Global_Wind_DirectionOS5692_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76510 = Global_Wind_DirectionOS5692_g76351;
				float temp_output_84_0_g76362 = _LayerMotionValue;
				float temp_output_19_0_g76366 = TVE_MotionUsage[(int)temp_output_84_0_g76362];
				float4 temp_output_91_19_g76362 = TVE_MotionCoords;
				half2 UV94_g76362 = ( (temp_output_91_19_g76362).zw + ( (temp_output_91_19_g76362).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76362 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76362,temp_output_84_0_g76362, 0.0 );
				float4 temp_output_17_0_g76366 = tex2DArrayNode50_g76362;
				float4 temp_output_112_19_g76362 = TVE_MotionParams;
				float4 temp_output_3_0_g76366 = temp_output_112_19_g76362;
				float4 ifLocalVar18_g76366 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76366 >= 0.5 )
				ifLocalVar18_g76366 = temp_output_17_0_g76366;
				else
				ifLocalVar18_g76366 = temp_output_3_0_g76366;
				float4 lerpResult22_g76366 = lerp( temp_output_3_0_g76366 , temp_output_17_0_g76366 , temp_output_19_0_g76366);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76366 = lerpResult22_g76366;
				#else
				float4 staticSwitch24_g76366 = ifLocalVar18_g76366;
				#endif
				half4 Global_Motion_Params3909_g76351 = staticSwitch24_g76366;
				float4 break322_g76356 = Global_Motion_Params3909_g76351;
				float lerpResult457_g76356 = lerp( break322_g76356.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76356 = ( 1.0 - lerpResult457_g76356 );
				half Global_Wind_Power2223_g76351 = ( 1.0 - ( temp_output_459_0_g76356 * temp_output_459_0_g76356 ) );
				half Input_WindPower449_g76510 = Global_Wind_Power2223_g76351;
				float2 lerpResult516_g76510 = lerp( Input_Noise_DirectionOS487_g76510 , Input_Wind_DirectionOS458_g76510 , ( Input_WindPower449_g76510 * 0.6 ));
				half Mesh_Motion_107572_g76351 = v.ase_color.a;
				half Input_MeshHeight388_g76510 = Mesh_Motion_107572_g76351;
				half ObjectData20_g76511 = Input_MeshHeight388_g76510;
				float enc62_g76576 = v.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76576 = DecodeFloatToVector2( enc62_g76576 );
				float2 break63_g76576 = ( localDecodeFloatToVector262_g76576 * 100.0 );
				float Bounds_Height5230_g76351 = break63_g76576.x;
				half Input_BoundsHeight390_g76510 = Bounds_Height5230_g76351;
				half WorldData19_g76511 = ( Input_MeshHeight388_g76510 * Input_MeshHeight388_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76511 = WorldData19_g76511;
				#else
				float staticSwitch14_g76511 = ObjectData20_g76511;
				#endif
				half Final_Motion10_Mask321_g76510 = ( staticSwitch14_g76511 * 2.0 );
				half Input_BendingAmplitude376_g76510 = _MotionAmplitude_10;
				half Global_MotionValue640_g76510 = TVE_MotionValue_10;
				half2 Final_Bending631_g76510 = ( lerpResult516_g76510 * ( Final_Motion10_Mask321_g76510 * Input_BendingAmplitude376_g76510 * Input_WindPower449_g76510 * Input_WindPower449_g76510 * Global_MotionValue640_g76510 ) );
				float2 appendResult433_g76356 = (float2(break322_g76356.x , break322_g76356.y));
				float2 temp_output_436_0_g76356 = (appendResult433_g76356*2.0 + -1.0);
				float2 break441_g76356 = temp_output_436_0_g76356;
				float3 appendResult440_g76356 = (float3(break441_g76356.x , 0.0 , break441_g76356.y));
				half2 Global_React_DirectionOS39_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76510 = Global_React_DirectionOS39_g76351;
				float clampResult17_g76513 = clamp( Input_MeshHeight388_g76510 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76512 = 0.0;
				half Input_InteractionUseMask62_g76510 = _InteractionMaskValue;
				float temp_output_10_0_g76512 = ( Input_InteractionUseMask62_g76510 - temp_output_7_0_g76512 );
				half Final_InteractionRemap594_g76510 = saturate( ( ( clampResult17_g76513 - temp_output_7_0_g76512 ) / ( temp_output_10_0_g76512 + 0.0001 ) ) );
				half ObjectData20_g76514 = Final_InteractionRemap594_g76510;
				half WorldData19_g76514 = ( Final_InteractionRemap594_g76510 * Final_InteractionRemap594_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76514 = WorldData19_g76514;
				#else
				float staticSwitch14_g76514 = ObjectData20_g76514;
				#endif
				half Final_InteractionMask373_g76510 = ( staticSwitch14_g76514 * 2.0 );
				half Input_InteractionAmplitude58_g76510 = _InteractionAmplitude;
				half2 Final_Interaction632_g76510 = ( Input_React_DirectionOS358_g76510 * Final_InteractionMask373_g76510 * Input_InteractionAmplitude58_g76510 );
				half Global_Interaction_Mask66_g76351 = ( break322_g76356.w * break322_g76356.w * break322_g76356.w * break322_g76356.w );
				float Input_InteractionGlobalMask330_g76510 = Global_Interaction_Mask66_g76351;
				half Final_InteractionValue525_g76510 = saturate( ( Input_InteractionAmplitude58_g76510 * Input_InteractionGlobalMask330_g76510 ) );
				float2 lerpResult551_g76510 = lerp( Final_Bending631_g76510 , Final_Interaction632_g76510 , Final_InteractionValue525_g76510);
				float2 break364_g76510 = lerpResult551_g76510;
				float3 appendResult638_g76510 = (float3(break364_g76510.x , 0.0 , break364_g76510.y));
				half3 Motion_10_Interaction7519_g76351 = appendResult638_g76510;
				half3 Angle44_g76486 = Motion_10_Interaction7519_g76351;
				half Angle44_g76487 = (Angle44_g76486).z;
				half3 VertexPos40_g76488 = ( VertexPosRotationAxis50_g76487 + ( VertexPosOtherAxis82_g76487 * cos( Angle44_g76487 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76487 ) * sin( Angle44_g76487 ) ) );
				float3 appendResult74_g76488 = (float3(0.0 , 0.0 , VertexPos40_g76488.z));
				half3 VertexPosRotationAxis50_g76488 = appendResult74_g76488;
				float3 break84_g76488 = VertexPos40_g76488;
				float3 appendResult81_g76488 = (float3(break84_g76488.x , break84_g76488.y , 0.0));
				half3 VertexPosOtherAxis82_g76488 = appendResult81_g76488;
				half Angle44_g76488 = -(Angle44_g76486).x;
				half3 Input_Position419_g76566 = WorldPosition_Shifted7477_g76351;
				float3 break459_g76566 = Input_Position419_g76566;
				float Sum_Position446_g76566 = ( break459_g76566.x + break459_g76566.y + break459_g76566.z );
				half Input_MotionScale321_g76566 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76566 = _MotionVariation_20;
				half Input_GlobalVariation400_g76566 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76567 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76566 = _MotionSpeed_20;
				float temp_output_404_0_g76566 = ( lerpResult128_g76567 * Input_MotionSpeed62_g76566 );
				half Motion_SineA450_g76566 = sin( ( ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) + ( Input_MotionVariation330_g76566 * Input_GlobalVariation400_g76566 ) + temp_output_404_0_g76566 ) );
				half Motion_SineB395_g76566 = sin( ( ( temp_output_404_0_g76566 * 0.6842 ) + ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) ) );
				half3 Input_Position419_g76585 = VertexPosition3588_g76351;
				float3 normalizeResult518_g76585 = normalize( Input_Position419_g76585 );
				half2 Input_DirectionOS423_g76585 = Global_React_DirectionOS39_g76351;
				float2 break521_g76585 = -Input_DirectionOS423_g76585;
				float3 appendResult522_g76585 = (float3(break521_g76585.x , 0.0 , break521_g76585.y));
				float dotResult519_g76585 = dot( normalizeResult518_g76585 , appendResult522_g76585 );
				half Input_Value62_g76585 = _MotionFacingValue;
				float lerpResult524_g76585 = lerp( 1.0 , (dotResult519_g76585*0.5 + 0.5) , Input_Value62_g76585);
				half ObjectData20_g76586 = max( lerpResult524_g76585 , 0.001 );
				half WorldData19_g76586 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76586 = WorldData19_g76586;
				#else
				float staticSwitch14_g76586 = ObjectData20_g76586;
				#endif
				half Motion_FacingMask5214_g76351 = staticSwitch14_g76586;
				half Motion_20_Amplitude4381_g76351 = Motion_FacingMask5214_g76351;
				half Input_MotionAmplitude384_g76566 = Motion_20_Amplitude4381_g76351;
				half Input_GlobalWind407_g76566 = Global_Wind_Power2223_g76351;
				float4 break638_g76527 = abs( Noise_Complex703_g76527 );
				half Global_Noise_B5526_g76351 = break638_g76527.b;
				half Input_GlobalNoise411_g76566 = Global_Noise_B5526_g76351;
				float lerpResult413_g76566 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76566);
				half Motion_Amplitude418_g76566 = ( Input_MotionAmplitude384_g76566 * Input_GlobalWind407_g76566 * pow( Input_GlobalNoise411_g76566 , lerpResult413_g76566 ) );
				half Input_Squash58_g76566 = _MotionAmplitude_20;
				float enc59_g76576 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76576 = DecodeFloatToVector2( enc59_g76576 );
				float2 break61_g76576 = localDecodeFloatToVector259_g76576;
				half Mesh_Motion_2060_g76351 = break61_g76576.x;
				half Input_MeshMotion_20388_g76566 = Mesh_Motion_2060_g76351;
				float Bounds_Radius5231_g76351 = break63_g76576.y;
				half Input_BoundsRadius390_g76566 = Bounds_Radius5231_g76351;
				half Global_MotionValue462_g76566 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76566 = Global_React_DirectionOS39_g76351;
				float2 break371_g76566 = Input_DirectionOS366_g76566;
				float3 appendResult372_g76566 = (float3(break371_g76566.x , ( Motion_SineA450_g76566 * 0.3 ) , break371_g76566.y));
				half3 Motion_20_Squash4418_g76351 = ( ( (max( Motion_SineA450_g76566 , Motion_SineB395_g76566 )*0.5 + 0.5) * Motion_Amplitude418_g76566 * Input_Squash58_g76566 * Input_MeshMotion_20388_g76566 * Input_BoundsRadius390_g76566 * Global_MotionValue462_g76566 ) * appendResult372_g76566 );
				half3 VertexPos40_g76472 = ( ( VertexPosRotationAxis50_g76488 + ( VertexPosOtherAxis82_g76488 * cos( Angle44_g76488 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76488 ) * sin( Angle44_g76488 ) ) ) + Motion_20_Squash4418_g76351 );
				float3 appendResult74_g76472 = (float3(0.0 , VertexPos40_g76472.y , 0.0));
				float3 VertexPosRotationAxis50_g76472 = appendResult74_g76472;
				float3 break84_g76472 = VertexPos40_g76472;
				float3 appendResult81_g76472 = (float3(break84_g76472.x , 0.0 , break84_g76472.z));
				float3 VertexPosOtherAxis82_g76472 = appendResult81_g76472;
				half Input_Rolling379_g76566 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76351 = ( Motion_SineA450_g76566 * Motion_Amplitude418_g76566 * Input_Rolling379_g76566 * Input_MeshMotion_20388_g76566 * Global_MotionValue462_g76566 );
				half Angle44_g76472 = Motion_20_Rolling5257_g76351;
				half3 Input_Position500_g76523 = WorldPosition_Shifted7477_g76351;
				half Input_MotionScale321_g76523 = _MotionScale_32;
				half Input_MotionVariation330_g76523 = _MotionVariation_32;
				half Input_GlobalVariation372_g76523 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76524 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76523 = _MotionSpeed_32;
				float4 tex2DNode460_g76523 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76523).xz * Input_MotionScale321_g76523 * 0.03 ) + ( Input_MotionVariation330_g76523 * Input_GlobalVariation372_g76523 ) + ( lerpResult128_g76524 * Input_MotionSpeed62_g76523 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76523 = (float3(tex2DNode460_g76523.r , tex2DNode460_g76523.g , tex2DNode460_g76523.b));
				half3 Flutter_Texture489_g76523 = (appendResult462_g76523*2.0 + -1.0);
				float temp_output_7_0_g76401 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76401 = ( TVE_MotionFadeStart - temp_output_7_0_g76401 );
				half Motion_FadeOut4005_g76351 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76401 ) / ( temp_output_10_0_g76401 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76351 = ( _MotionAmplitude_32 * Motion_FacingMask5214_g76351 * Motion_FadeOut4005_g76351 );
				half Input_MotionAmplitude58_g76523 = Motion_30_Amplitude4960_g76351;
				half Mesh_Motion_30144_g76351 = break61_g76576.y;
				half Input_MeshMotion_30374_g76523 = Mesh_Motion_30144_g76351;
				half Input_GlobalWind471_g76523 = Global_Wind_Power2223_g76351;
				half Global_MotionValue503_g76523 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g76523 = Global_Noise_B5526_g76351;
				float lerpResult466_g76523 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76523);
				half Flutter_Amplitude491_g76523 = ( Input_MotionAmplitude58_g76523 * Input_MeshMotion_30374_g76523 * Input_GlobalWind471_g76523 * Global_MotionValue503_g76523 * pow( Input_GlobalNoise472_g76523 , lerpResult466_g76523 ) );
				half3 Motion_30_Flutter263_g76351 = ( Flutter_Texture489_g76523 * Flutter_Amplitude491_g76523 );
				float3 Vertex_Motion_Object833_g76351 = ( ( VertexPosRotationAxis50_g76472 + ( VertexPosOtherAxis82_g76472 * cos( Angle44_g76472 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76472 ) * sin( Angle44_g76472 ) ) ) + Motion_30_Flutter263_g76351 );
				half3 ObjectData20_g76419 = Vertex_Motion_Object833_g76351;
				float3 temp_output_3474_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				float3 Vertex_Motion_World1118_g76351 = ( ( ( temp_output_3474_0_g76351 + Motion_10_Interaction7519_g76351 ) + Motion_20_Squash4418_g76351 ) + Motion_30_Flutter263_g76351 );
				half3 WorldData19_g76419 = Vertex_Motion_World1118_g76351;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76419 = WorldData19_g76419;
				#else
				float3 staticSwitch14_g76419 = ObjectData20_g76419;
				#endif
				float3 temp_output_7495_0_g76351 = staticSwitch14_g76419;
				float3 Vertex_Motion7493_g76351 = temp_output_7495_0_g76351;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 break2709_g76351 = cross( ViewDirection3963_g76351 , half3(0,1,0) );
				float3 appendResult2710_g76351 = (float3(-break2709_g76351.z , 0.0 , break2709_g76351.x));
				float3 appendResult2667_g76351 = (float3(Global_MeshVariation5104_g76351 , 0.5 , Global_MeshVariation5104_g76351));
				half Mesh_Height1524_g76351 = v.ase_color.a;
				float dotResult2212_g76351 = dot( ViewDirection3963_g76351 , float3(0,1,0) );
				half Mask_HView2656_g76351 = dotResult2212_g76351;
				float saferPower2652_g76351 = abs( Mask_HView2656_g76351 );
				half3 Grass_Perspective2661_g76351 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76351 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76351*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76351 * pow( saferPower2652_g76351 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76383 = _LayerVertexValue;
				float temp_output_19_0_g76387 = TVE_VertexUsage[(int)temp_output_84_0_g76383];
				float4 temp_output_94_19_g76383 = TVE_VertexCoords;
				half2 UV97_g76383 = ( (temp_output_94_19_g76383).zw + ( (temp_output_94_19_g76383).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76383 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76383,temp_output_84_0_g76383, 0.0 );
				float4 temp_output_17_0_g76387 = tex2DArrayNode50_g76383;
				float4 temp_output_111_19_g76383 = TVE_VertexParams;
				float4 temp_output_3_0_g76387 = temp_output_111_19_g76383;
				float4 ifLocalVar18_g76387 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76387 >= 0.5 )
				ifLocalVar18_g76387 = temp_output_17_0_g76387;
				else
				ifLocalVar18_g76387 = temp_output_3_0_g76387;
				float4 lerpResult22_g76387 = lerp( temp_output_3_0_g76387 , temp_output_17_0_g76387 , temp_output_19_0_g76387);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76387 = lerpResult22_g76387;
				#else
				float4 staticSwitch24_g76387 = ifLocalVar18_g76387;
				#endif
				half4 Global_Vertex_Params4173_g76351 = staticSwitch24_g76387;
				float4 break322_g76388 = Global_Vertex_Params4173_g76351;
				half Global_VertexSize174_g76351 = saturate( break322_g76388.w );
				float lerpResult346_g76351 = lerp( 1.0 , Global_VertexSize174_g76351 , _GlobalSize);
				float3 appendResult3480_g76351 = (float3(lerpResult346_g76351 , lerpResult346_g76351 , lerpResult346_g76351));
				half3 ObjectData20_g76416 = appendResult3480_g76351;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76416 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76416 = WorldData19_g76416;
				#else
				float3 staticSwitch14_g76416 = ObjectData20_g76416;
				#endif
				half3 Vertex_Size1741_g76351 = staticSwitch14_g76416;
				float temp_output_7_0_g76417 = _SizeFadeEndValue;
				float temp_output_10_0_g76417 = ( _SizeFadeStartValue - temp_output_7_0_g76417 );
				float temp_output_7453_0_g76351 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76351 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76417 ) / ( temp_output_10_0_g76417 + 0.0001 ) ) );
				float3 appendResult3482_g76351 = (float3(temp_output_7453_0_g76351 , temp_output_7453_0_g76351 , temp_output_7453_0_g76351));
				half3 ObjectData20_g76415 = appendResult3482_g76351;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76415 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76415 = WorldData19_g76415;
				#else
				float3 staticSwitch14_g76415 = ObjectData20_g76415;
				#endif
				float3 Vertex_SizeFade1740_g76351 = staticSwitch14_g76415;
				float3 lerpResult16_g76420 = lerp( VertexPosition3588_g76351 , ( ( ( Vertex_Motion7493_g76351 + Grass_Perspective2661_g76351 ) * Vertex_Size1741_g76351 * Vertex_SizeFade1740_g76351 ) + Mesh_PivotsOS2291_g76351 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76351 = lerpResult16_g76420;
				float3 Final_VertexPosition890_g76351 = ( temp_output_4912_0_g76351 + _DisableSRPBatcher );
				
				float4 break33_g76581 = _second_uvs_mode;
				float2 temp_output_30_0_g76581 = ( v.ase_texcoord.xy * break33_g76581.x );
				float2 appendResult21_g76576 = (float2(v.ase_texcoord1.z , v.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76351 = appendResult21_g76576;
				float2 temp_output_29_0_g76581 = ( Mesh_DetailCoord3_g76351 * break33_g76581.y );
				float2 temp_output_31_0_g76581 = ( (WorldPosition_Shifted7477_g76351).xz * break33_g76581.z );
				half2 Second_UVs_Tilling7609_g76351 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7610_g76351 = ( 1.0 / Second_UVs_Tilling7609_g76351 );
				float2 lerpResult7614_g76351 = lerp( Second_UVs_Tilling7609_g76351 , Second_UVs_Scale7610_g76351 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7605_g76351 = (_SecondUVs).zw;
				float2 vertexToFrag11_g76377 = ( ( ( temp_output_30_0_g76581 + temp_output_29_0_g76581 + temp_output_31_0_g76581 ) * lerpResult7614_g76351 ) + Second_UVs_Offset7605_g76351 );
				o.ase_texcoord1.xy = vertexToFrag11_g76377;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord2.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord4.xyz = ase_worldBitangent;
				o.ase_texcoord5.xyz = vertexToFrag3890_g76351;
				o.ase_texcoord6.xyz = vertexToFrag4224_g76351;
				o.ase_texcoord7.xyz = ase_worldPos;
				
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76351;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float localCustomAlphaClip19_g76558 = ( 0.0 );
				half2 Main_UVs15_g76351 = ( ( IN.ase_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76351 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76351 );
				half Main_Alpha316_g76351 = tex2DNode29_g76351.a;
				float2 vertexToFrag11_g76377 = IN.ase_texcoord1.xy;
				half2 Second_UVs17_g76351 = vertexToFrag11_g76377;
				float4 tex2DNode89_g76351 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76351 );
				half Second_Alpha5007_g76351 = tex2DNode89_g76351.a;
				float4 tex2DNode35_g76351 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				half Main_Mask57_g76351 = tex2DNode35_g76351.b;
				float4 tex2DNode33_g76351 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				half Second_Mask81_g76351 = tex2DNode33_g76351.b;
				float lerpResult6885_g76351 = lerp( Main_Mask57_g76351 , Second_Mask81_g76351 , _DetailMaskMode);
				float clampResult17_g76483 = clamp( lerpResult6885_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76482 = _DetailMaskMinValue;
				float temp_output_10_0_g76482 = ( _DetailMaskMaxValue - temp_output_7_0_g76482 );
				half Blend_Mask_Texture6794_g76351 = saturate( ( ( clampResult17_g76483 - temp_output_7_0_g76482 ) / ( temp_output_10_0_g76482 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76351 = IN.ase_color.b;
				half4 Normal_Packed45_g76559 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				float2 appendResult58_g76559 = (float2(( (Normal_Packed45_g76559).x * (Normal_Packed45_g76559).w ) , (Normal_Packed45_g76559).y));
				half2 Normal_Default50_g76559 = appendResult58_g76559;
				half2 Normal_ASTC41_g76559 = (Normal_Packed45_g76559).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76559 = Normal_ASTC41_g76559;
				#else
				float2 staticSwitch38_g76559 = Normal_Default50_g76559;
				#endif
				half2 Normal_NO_DTX544_g76559 = (Normal_Packed45_g76559).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76559 = Normal_NO_DTX544_g76559;
				#else
				float2 staticSwitch37_g76559 = staticSwitch38_g76559;
				#endif
				float2 temp_output_6555_0_g76351 = ( (staticSwitch37_g76559*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76351 = (float3(temp_output_6555_0_g76351 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord2.xyz;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g76351 = appendResult7388_g76351;
				float3 worldNormal7389_g76351 = float3(dot(tanToWorld0,tanNormal7389_g76351), dot(tanToWorld1,tanNormal7389_g76351), dot(tanToWorld2,tanNormal7389_g76351));
				half3 Main_NormalWS7390_g76351 = worldNormal7389_g76351;
				float lerpResult6884_g76351 = lerp( Mesh_DetailMask90_g76351 , ((Main_NormalWS7390_g76351).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76481 = clamp( lerpResult6884_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76480 = _DetailMeshMinValue;
				float temp_output_10_0_g76480 = ( _DetailMeshMaxValue - temp_output_7_0_g76480 );
				half Blend_Mask_Mesh1540_g76351 = saturate( ( ( clampResult17_g76481 - temp_output_7_0_g76480 ) / ( temp_output_10_0_g76480 + 0.0001 ) ) );
				float clampResult17_g76504 = clamp( ( Blend_Mask_Texture6794_g76351 * Blend_Mask_Mesh1540_g76351 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76552 = _DetailBlendMinValue;
				float temp_output_10_0_g76552 = ( _DetailBlendMaxValue - temp_output_7_0_g76552 );
				half Blend_Mask147_g76351 = ( saturate( ( ( clampResult17_g76504 - temp_output_7_0_g76552 ) / ( temp_output_10_0_g76552 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g76351 = lerp( Main_Alpha316_g76351 , Second_Alpha5007_g76351 , Blend_Mask147_g76351);
				float lerpResult6785_g76351 = lerp( ( Main_Alpha316_g76351 * Second_Alpha5007_g76351 ) , lerpResult6153_g76351 , _DetailAlphaMode);
				#ifdef TVE_DETAIL
				float staticSwitch6158_g76351 = lerpResult6785_g76351;
				#else
				float staticSwitch6158_g76351 = Main_Alpha316_g76351;
				#endif
				half Blend_Alpha6157_g76351 = staticSwitch6158_g76351;
				half AlphaTreshold2132_g76351 = _AlphaClipValue;
				float temp_output_84_0_g76367 = _LayerExtrasValue;
				float temp_output_19_0_g76371 = TVE_ExtrasUsage[(int)temp_output_84_0_g76367];
				float4 temp_output_93_19_g76367 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76351 = IN.ase_texcoord5.xyz;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 vertexToFrag4224_g76351 = IN.ase_texcoord6.xyz;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 lerpResult4827_g76351 = lerp( WorldPosition3905_g76351 , ObjectPosition4223_g76351 , _ExtrasPositionMode);
				half2 UV96_g76367 = ( (temp_output_93_19_g76367).zw + ( (temp_output_93_19_g76367).xy * (lerpResult4827_g76351).xz ) );
				float4 tex2DArrayNode48_g76367 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76367,temp_output_84_0_g76367, 0.0 );
				float4 temp_output_17_0_g76371 = tex2DArrayNode48_g76367;
				float4 temp_output_94_85_g76367 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76371 = temp_output_94_85_g76367;
				float4 ifLocalVar18_g76371 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76371 >= 0.5 )
				ifLocalVar18_g76371 = temp_output_17_0_g76371;
				else
				ifLocalVar18_g76371 = temp_output_3_0_g76371;
				float4 lerpResult22_g76371 = lerp( temp_output_3_0_g76371 , temp_output_17_0_g76371 , temp_output_19_0_g76371);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76371 = lerpResult22_g76371;
				#else
				float4 staticSwitch24_g76371 = ifLocalVar18_g76371;
				#endif
				half4 Global_Extras_Params5440_g76351 = staticSwitch24_g76371;
				float4 break456_g76381 = Global_Extras_Params5440_g76351;
				half Global_Extras_Alpha1033_g76351 = saturate( break456_g76381.w );
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = IN.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				float lerpResult5154_g76351 = lerp( 0.0 , Global_MeshVariation5104_g76351 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76351 = lerpResult5154_g76351;
				float Emissive_Alpha7625_g76351 = 0.0;
				float lerpResult6866_g76351 = lerp( ( 1.0 - Blend_Mask147_g76351 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_DETAIL
				float staticSwitch6612_g76351 = lerpResult6866_g76351;
				#else
				float staticSwitch6612_g76351 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76351 = staticSwitch6612_g76351;
				half Alpha_Mask6234_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5203_g76351 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76351 - saturate( ( Global_Alpha_Variation5158_g76351 + Emissive_Alpha7625_g76351 ) ) ) + ( Global_Extras_Alpha1033_g76351 * 0.1 ) ) ) , ( Alpha_Mask6234_g76351 * _GlobalAlpha ));
				float lerpResult16_g76395 = lerp( 1.0 , lerpResult5203_g76351 , TVE_IsEnabled);
				half Global_Alpha315_g76351 = lerpResult16_g76395;
				float3 ase_worldPos = IN.ase_texcoord7.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 normalizeResult3971_g76351 = normalize( cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) ) );
				float3 WorldNormal_Derivates3972_g76351 = normalizeResult3971_g76351;
				float dotResult3851_g76351 = dot( ViewDirection3963_g76351 , WorldNormal_Derivates3972_g76351 );
				float lerpResult3993_g76351 = lerp( 1.0 , saturate( ( abs( dotResult3851_g76351 ) * 3.0 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g76351 = lerpResult3993_g76351;
				half Fade_Effects_A5360_g76351 = Fade_Glancing3853_g76351;
				float temp_output_7_0_g76404 = TVE_CameraFadeMin;
				float temp_output_10_0_g76404 = ( TVE_CameraFadeMax - temp_output_7_0_g76404 );
				float lerpResult4755_g76351 = lerp( 1.0 , saturate( saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76404 ) / ( temp_output_10_0_g76404 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76351 = lerpResult4755_g76351;
				half Fade_Effects_B6228_g76351 = ( Fade_Effects_A5360_g76351 * Fade_Camera3743_g76351 );
				half Fade_Mask5149_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5141_g76351 = lerp( 1.0 , ( Fade_Effects_B6228_g76351 * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76351);
				half Fade_Effects_C7653_g76351 = lerpResult5141_g76351;
				float temp_output_5865_0_g76351 = saturate( ( Fade_Effects_C7653_g76351 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76351 ) ).r ) );
				half Fade_Alpha3727_g76351 = temp_output_5865_0_g76351;
				half Final_Alpha7344_g76351 = min( ( ( Blend_Alpha6157_g76351 - AlphaTreshold2132_g76351 ) * Global_Alpha315_g76351 ) , Fade_Alpha3727_g76351 );
				float temp_output_3_0_g76558 = Final_Alpha7344_g76351;
				float Alpha19_g76558 = temp_output_3_0_g76558;
				float temp_output_15_0_g76558 = 0.01;
				float Treshold19_g76558 = temp_output_15_0_g76558;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#else
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#endif
				}
				float clampResult17_g76560 = clamp( Main_Mask57_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76561 = _MainMaskMinValue;
				float temp_output_10_0_g76561 = ( _MainMaskMaxValue - temp_output_7_0_g76561 );
				half Main_Mask_Remap5765_g76351 = saturate( ( ( clampResult17_g76560 - temp_output_7_0_g76561 ) / ( temp_output_10_0_g76561 + 0.0001 ) ) );
				float lerpResult7671_g76351 = lerp( 1.0 , Main_Mask_Remap5765_g76351 , _MainColorMode);
				float4 lerpResult7654_g76351 = lerp( _MainColorTwo , _MainColor , lerpResult7671_g76351);
				half Main_Color_Alpha6121_g76351 = (lerpResult7654_g76351).a;
				float clampResult17_g76563 = clamp( Second_Mask81_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76564 = _SecondMaskMinValue;
				float temp_output_10_0_g76564 = ( _SecondMaskMaxValue - temp_output_7_0_g76564 );
				half Second_Mask_Remap6130_g76351 = saturate( ( ( clampResult17_g76563 - temp_output_7_0_g76564 ) / ( temp_output_10_0_g76564 + 0.0001 ) ) );
				float lerpResult7672_g76351 = lerp( 1.0 , Second_Mask_Remap6130_g76351 , _SecondColorMode);
				float4 lerpResult7662_g76351 = lerp( _SecondColorTwo , _SecondColor , lerpResult7672_g76351);
				half Second_Color_Alpha6152_g76351 = (lerpResult7662_g76351).a;
				float lerpResult6168_g76351 = lerp( Main_Color_Alpha6121_g76351 , Second_Color_Alpha6152_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6174_g76351 = lerpResult6168_g76351;
				#else
				float staticSwitch6174_g76351 = Main_Color_Alpha6121_g76351;
				#endif
				half Blend_Color_Alpha6167_g76351 = staticSwitch6174_g76351;
				half Final_Clip914_g76351 = saturate( ( Alpha19_g76558 * Blend_Color_Alpha6167_g76351 ) );
				

				surfaceDescription.Alpha = Final_Clip914_g76351;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SecondColor;
			half4 _MotionHighlightColor;
			half4 _SubsurfaceColor;
			half4 _NoiseMaskRemap;
			half4 _MainColorTwo;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColorTwo;
			half4 _MainUVs;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _DetailMeshRemap;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half4 _DetailMaskRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _RimLightRemap;
			half4 _MainColor;
			half3 _render_normals;
			half _SecondColorMode;
			half _DetailBlendMode;
			half _DetailMaskMode;
			half _DetailMaskMinValue;
			half _DetailMaskMaxValue;
			half _MainNormalValue;
			half _DetailMeshMode;
			half _DetailMeshMinValue;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _MainMaskMaxValue;
			half _SecondAlbedoValue;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			half _GlobalSize;
			half _SizeFadeEndValue;
			half _SizeFadeStartValue;
			half _MainAlbedoValue;
			half _MainMaskMinValue;
			half _DetailMeshMaxValue;
			half _MainColorMode;
			half _SecondUVsScaleMode;
			half _SecondMaskMinValue;
			half _DetailBlendMinValue;
			half _GradientMaxValue;
			half _DetailMode;
			half _SubsurfaceValue;
			half _SubsurfaceMaskValue;
			half _EmissiveTexMinValue;
			half _EmissiveTexMaxValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _FadeGlancingValue;
			half _SecondSmoothnessValue;
			half _DetailBlendMaxValue;
			half _VertexOcclusionOverlayMode;
			half _SecondNormalValue;
			half _DetailValue;
			half _GradientMinValue;
			half _MotionAmplitude_20;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _ColorsIntensityValue;
			half _OverlayProjectionValue;
			half _ColorsMaskValue;
			half _ColorsVariationValue;
			half _VertexOcclusionColorsMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _OverlayVariationValue;
			half _DetailNormalValue;
			half _SecondUVsMode;
			half _GlobalColors;
			half _MotionFacingValue;
			half _LayerMotionValue;
			half _MotionVariation_20;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _RenderDirect;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _Cutoff;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _IsVersion;
			half _HasEmissive;
			half _render_src;
			half _render_zw;
			half _render_dst;
			half _render_coverage;
			half _IsStandardShader;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageGlobalsVariation;
			half _IsTVEShader;
			half _HasOcclusion;
			half _IsIdentifier;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _VertexVariationMode;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MessageMotionVariation;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _MessageOcclusion;
			half _EmissiveMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_20;
			half _DetailMaskInvertMode;
			half _CategoryMotion;
			half _ColorsMaskMaxValue;
			half _RenderCoverage;
			half _MessageSubsurface;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderZWrite;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderClip;
			half _ColorsMaskMinValue;
			half _FadeConstantValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g76351 = v.positionOS.xyz;
				float3 appendResult60_g76361 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76351 = ( appendResult60_g76361 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76351 = Mesh_PivotsData2831_g76351;
				float3 temp_output_2283_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				half3 VertexPos40_g76486 = temp_output_2283_0_g76351;
				half3 VertexPos40_g76487 = VertexPos40_g76486;
				float3 appendResult74_g76487 = (float3(VertexPos40_g76487.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76487 = appendResult74_g76487;
				float3 break84_g76487 = VertexPos40_g76487;
				float3 appendResult81_g76487 = (float3(0.0 , break84_g76487.y , break84_g76487.z));
				half3 VertexPosOtherAxis82_g76487 = appendResult81_g76487;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g76351 = ase_worldPos;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 WorldPosition_Shifted7477_g76351 = ( WorldPosition3905_g76351 - TVE_WorldOrigin );
				float4x4 break19_g76407 = GetObjectToWorldMatrix();
				float3 appendResult20_g76407 = (float3(break19_g76407[ 0 ][ 3 ] , break19_g76407[ 1 ][ 3 ] , break19_g76407[ 2 ][ 3 ]));
				float3 temp_output_122_0_g76407 = Mesh_PivotsData2831_g76351;
				float3 PivotsOnly105_g76407 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76407 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g76409 = ( appendResult20_g76407 + PivotsOnly105_g76407 );
				half3 WorldData19_g76409 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76409 = WorldData19_g76409;
				#else
				float3 staticSwitch14_g76409 = ObjectData20_g76409;
				#endif
				float3 temp_output_114_0_g76407 = staticSwitch14_g76409;
				float3 vertexToFrag4224_g76351 = temp_output_114_0_g76407;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				float3 lerpResult6766_g76351 = lerp( WorldPosition_Shifted7477_g76351 , ObjectPosition_Shifted7481_g76351 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76351 = lerpResult6766_g76351;
				half3 Input_Position419_g76527 = Motion_10_Position6738_g76351;
				float Input_MotionScale287_g76527 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76527 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76527 = (( Input_Position419_g76527 * Input_MotionScale287_g76527 * NoiseTex_Tilling735_g76527 * 0.0075 )).xz;
				float2 temp_output_447_0_g76356 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76351 = temp_output_447_0_g76356;
				half2 Input_DirectionWS423_g76527 = Global_Wind_DirectionWS4683_g76351;
				float lerpResult128_g76528 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76527 = _MotionSpeed_10;
				half Input_MotionVariation284_g76527 = _MotionVariation_10;
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = v.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				half Input_GlobalMeshVariation569_g76527 = Global_MeshVariation5104_g76351;
				float temp_output_630_0_g76527 = ( ( ( lerpResult128_g76528 * Input_MotionSpeed62_g76527 ) + ( Input_MotionVariation284_g76527 * Input_GlobalMeshVariation569_g76527 ) ) * 0.03 );
				float temp_output_607_0_g76527 = frac( temp_output_630_0_g76527 );
				float4 lerpResult590_g76527 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * temp_output_607_0_g76527 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * frac( ( temp_output_630_0_g76527 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76527 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76527 = lerpResult590_g76527;
				float2 temp_output_645_0_g76527 = ((Noise_Complex703_g76527).rg*2.0 + -1.0);
				float2 break650_g76527 = temp_output_645_0_g76527;
				float3 appendResult649_g76527 = (float3(break650_g76527.x , 0.0 , break650_g76527.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76527 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76510 = Global_Noise_OS5548_g76351;
				float2 break448_g76356 = temp_output_447_0_g76356;
				float3 appendResult452_g76356 = (float3(break448_g76356.x , 0.0 , break448_g76356.y));
				half2 Global_Wind_DirectionOS5692_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76510 = Global_Wind_DirectionOS5692_g76351;
				float temp_output_84_0_g76362 = _LayerMotionValue;
				float temp_output_19_0_g76366 = TVE_MotionUsage[(int)temp_output_84_0_g76362];
				float4 temp_output_91_19_g76362 = TVE_MotionCoords;
				half2 UV94_g76362 = ( (temp_output_91_19_g76362).zw + ( (temp_output_91_19_g76362).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76362 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76362,temp_output_84_0_g76362, 0.0 );
				float4 temp_output_17_0_g76366 = tex2DArrayNode50_g76362;
				float4 temp_output_112_19_g76362 = TVE_MotionParams;
				float4 temp_output_3_0_g76366 = temp_output_112_19_g76362;
				float4 ifLocalVar18_g76366 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76366 >= 0.5 )
				ifLocalVar18_g76366 = temp_output_17_0_g76366;
				else
				ifLocalVar18_g76366 = temp_output_3_0_g76366;
				float4 lerpResult22_g76366 = lerp( temp_output_3_0_g76366 , temp_output_17_0_g76366 , temp_output_19_0_g76366);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76366 = lerpResult22_g76366;
				#else
				float4 staticSwitch24_g76366 = ifLocalVar18_g76366;
				#endif
				half4 Global_Motion_Params3909_g76351 = staticSwitch24_g76366;
				float4 break322_g76356 = Global_Motion_Params3909_g76351;
				float lerpResult457_g76356 = lerp( break322_g76356.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76356 = ( 1.0 - lerpResult457_g76356 );
				half Global_Wind_Power2223_g76351 = ( 1.0 - ( temp_output_459_0_g76356 * temp_output_459_0_g76356 ) );
				half Input_WindPower449_g76510 = Global_Wind_Power2223_g76351;
				float2 lerpResult516_g76510 = lerp( Input_Noise_DirectionOS487_g76510 , Input_Wind_DirectionOS458_g76510 , ( Input_WindPower449_g76510 * 0.6 ));
				half Mesh_Motion_107572_g76351 = v.ase_color.a;
				half Input_MeshHeight388_g76510 = Mesh_Motion_107572_g76351;
				half ObjectData20_g76511 = Input_MeshHeight388_g76510;
				float enc62_g76576 = v.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76576 = DecodeFloatToVector2( enc62_g76576 );
				float2 break63_g76576 = ( localDecodeFloatToVector262_g76576 * 100.0 );
				float Bounds_Height5230_g76351 = break63_g76576.x;
				half Input_BoundsHeight390_g76510 = Bounds_Height5230_g76351;
				half WorldData19_g76511 = ( Input_MeshHeight388_g76510 * Input_MeshHeight388_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76511 = WorldData19_g76511;
				#else
				float staticSwitch14_g76511 = ObjectData20_g76511;
				#endif
				half Final_Motion10_Mask321_g76510 = ( staticSwitch14_g76511 * 2.0 );
				half Input_BendingAmplitude376_g76510 = _MotionAmplitude_10;
				half Global_MotionValue640_g76510 = TVE_MotionValue_10;
				half2 Final_Bending631_g76510 = ( lerpResult516_g76510 * ( Final_Motion10_Mask321_g76510 * Input_BendingAmplitude376_g76510 * Input_WindPower449_g76510 * Input_WindPower449_g76510 * Global_MotionValue640_g76510 ) );
				float2 appendResult433_g76356 = (float2(break322_g76356.x , break322_g76356.y));
				float2 temp_output_436_0_g76356 = (appendResult433_g76356*2.0 + -1.0);
				float2 break441_g76356 = temp_output_436_0_g76356;
				float3 appendResult440_g76356 = (float3(break441_g76356.x , 0.0 , break441_g76356.y));
				half2 Global_React_DirectionOS39_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76510 = Global_React_DirectionOS39_g76351;
				float clampResult17_g76513 = clamp( Input_MeshHeight388_g76510 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76512 = 0.0;
				half Input_InteractionUseMask62_g76510 = _InteractionMaskValue;
				float temp_output_10_0_g76512 = ( Input_InteractionUseMask62_g76510 - temp_output_7_0_g76512 );
				half Final_InteractionRemap594_g76510 = saturate( ( ( clampResult17_g76513 - temp_output_7_0_g76512 ) / ( temp_output_10_0_g76512 + 0.0001 ) ) );
				half ObjectData20_g76514 = Final_InteractionRemap594_g76510;
				half WorldData19_g76514 = ( Final_InteractionRemap594_g76510 * Final_InteractionRemap594_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76514 = WorldData19_g76514;
				#else
				float staticSwitch14_g76514 = ObjectData20_g76514;
				#endif
				half Final_InteractionMask373_g76510 = ( staticSwitch14_g76514 * 2.0 );
				half Input_InteractionAmplitude58_g76510 = _InteractionAmplitude;
				half2 Final_Interaction632_g76510 = ( Input_React_DirectionOS358_g76510 * Final_InteractionMask373_g76510 * Input_InteractionAmplitude58_g76510 );
				half Global_Interaction_Mask66_g76351 = ( break322_g76356.w * break322_g76356.w * break322_g76356.w * break322_g76356.w );
				float Input_InteractionGlobalMask330_g76510 = Global_Interaction_Mask66_g76351;
				half Final_InteractionValue525_g76510 = saturate( ( Input_InteractionAmplitude58_g76510 * Input_InteractionGlobalMask330_g76510 ) );
				float2 lerpResult551_g76510 = lerp( Final_Bending631_g76510 , Final_Interaction632_g76510 , Final_InteractionValue525_g76510);
				float2 break364_g76510 = lerpResult551_g76510;
				float3 appendResult638_g76510 = (float3(break364_g76510.x , 0.0 , break364_g76510.y));
				half3 Motion_10_Interaction7519_g76351 = appendResult638_g76510;
				half3 Angle44_g76486 = Motion_10_Interaction7519_g76351;
				half Angle44_g76487 = (Angle44_g76486).z;
				half3 VertexPos40_g76488 = ( VertexPosRotationAxis50_g76487 + ( VertexPosOtherAxis82_g76487 * cos( Angle44_g76487 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76487 ) * sin( Angle44_g76487 ) ) );
				float3 appendResult74_g76488 = (float3(0.0 , 0.0 , VertexPos40_g76488.z));
				half3 VertexPosRotationAxis50_g76488 = appendResult74_g76488;
				float3 break84_g76488 = VertexPos40_g76488;
				float3 appendResult81_g76488 = (float3(break84_g76488.x , break84_g76488.y , 0.0));
				half3 VertexPosOtherAxis82_g76488 = appendResult81_g76488;
				half Angle44_g76488 = -(Angle44_g76486).x;
				half3 Input_Position419_g76566 = WorldPosition_Shifted7477_g76351;
				float3 break459_g76566 = Input_Position419_g76566;
				float Sum_Position446_g76566 = ( break459_g76566.x + break459_g76566.y + break459_g76566.z );
				half Input_MotionScale321_g76566 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76566 = _MotionVariation_20;
				half Input_GlobalVariation400_g76566 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76567 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76566 = _MotionSpeed_20;
				float temp_output_404_0_g76566 = ( lerpResult128_g76567 * Input_MotionSpeed62_g76566 );
				half Motion_SineA450_g76566 = sin( ( ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) + ( Input_MotionVariation330_g76566 * Input_GlobalVariation400_g76566 ) + temp_output_404_0_g76566 ) );
				half Motion_SineB395_g76566 = sin( ( ( temp_output_404_0_g76566 * 0.6842 ) + ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) ) );
				half3 Input_Position419_g76585 = VertexPosition3588_g76351;
				float3 normalizeResult518_g76585 = normalize( Input_Position419_g76585 );
				half2 Input_DirectionOS423_g76585 = Global_React_DirectionOS39_g76351;
				float2 break521_g76585 = -Input_DirectionOS423_g76585;
				float3 appendResult522_g76585 = (float3(break521_g76585.x , 0.0 , break521_g76585.y));
				float dotResult519_g76585 = dot( normalizeResult518_g76585 , appendResult522_g76585 );
				half Input_Value62_g76585 = _MotionFacingValue;
				float lerpResult524_g76585 = lerp( 1.0 , (dotResult519_g76585*0.5 + 0.5) , Input_Value62_g76585);
				half ObjectData20_g76586 = max( lerpResult524_g76585 , 0.001 );
				half WorldData19_g76586 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76586 = WorldData19_g76586;
				#else
				float staticSwitch14_g76586 = ObjectData20_g76586;
				#endif
				half Motion_FacingMask5214_g76351 = staticSwitch14_g76586;
				half Motion_20_Amplitude4381_g76351 = Motion_FacingMask5214_g76351;
				half Input_MotionAmplitude384_g76566 = Motion_20_Amplitude4381_g76351;
				half Input_GlobalWind407_g76566 = Global_Wind_Power2223_g76351;
				float4 break638_g76527 = abs( Noise_Complex703_g76527 );
				half Global_Noise_B5526_g76351 = break638_g76527.b;
				half Input_GlobalNoise411_g76566 = Global_Noise_B5526_g76351;
				float lerpResult413_g76566 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76566);
				half Motion_Amplitude418_g76566 = ( Input_MotionAmplitude384_g76566 * Input_GlobalWind407_g76566 * pow( Input_GlobalNoise411_g76566 , lerpResult413_g76566 ) );
				half Input_Squash58_g76566 = _MotionAmplitude_20;
				float enc59_g76576 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76576 = DecodeFloatToVector2( enc59_g76576 );
				float2 break61_g76576 = localDecodeFloatToVector259_g76576;
				half Mesh_Motion_2060_g76351 = break61_g76576.x;
				half Input_MeshMotion_20388_g76566 = Mesh_Motion_2060_g76351;
				float Bounds_Radius5231_g76351 = break63_g76576.y;
				half Input_BoundsRadius390_g76566 = Bounds_Radius5231_g76351;
				half Global_MotionValue462_g76566 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76566 = Global_React_DirectionOS39_g76351;
				float2 break371_g76566 = Input_DirectionOS366_g76566;
				float3 appendResult372_g76566 = (float3(break371_g76566.x , ( Motion_SineA450_g76566 * 0.3 ) , break371_g76566.y));
				half3 Motion_20_Squash4418_g76351 = ( ( (max( Motion_SineA450_g76566 , Motion_SineB395_g76566 )*0.5 + 0.5) * Motion_Amplitude418_g76566 * Input_Squash58_g76566 * Input_MeshMotion_20388_g76566 * Input_BoundsRadius390_g76566 * Global_MotionValue462_g76566 ) * appendResult372_g76566 );
				half3 VertexPos40_g76472 = ( ( VertexPosRotationAxis50_g76488 + ( VertexPosOtherAxis82_g76488 * cos( Angle44_g76488 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76488 ) * sin( Angle44_g76488 ) ) ) + Motion_20_Squash4418_g76351 );
				float3 appendResult74_g76472 = (float3(0.0 , VertexPos40_g76472.y , 0.0));
				float3 VertexPosRotationAxis50_g76472 = appendResult74_g76472;
				float3 break84_g76472 = VertexPos40_g76472;
				float3 appendResult81_g76472 = (float3(break84_g76472.x , 0.0 , break84_g76472.z));
				float3 VertexPosOtherAxis82_g76472 = appendResult81_g76472;
				half Input_Rolling379_g76566 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76351 = ( Motion_SineA450_g76566 * Motion_Amplitude418_g76566 * Input_Rolling379_g76566 * Input_MeshMotion_20388_g76566 * Global_MotionValue462_g76566 );
				half Angle44_g76472 = Motion_20_Rolling5257_g76351;
				half3 Input_Position500_g76523 = WorldPosition_Shifted7477_g76351;
				half Input_MotionScale321_g76523 = _MotionScale_32;
				half Input_MotionVariation330_g76523 = _MotionVariation_32;
				half Input_GlobalVariation372_g76523 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76524 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76523 = _MotionSpeed_32;
				float4 tex2DNode460_g76523 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76523).xz * Input_MotionScale321_g76523 * 0.03 ) + ( Input_MotionVariation330_g76523 * Input_GlobalVariation372_g76523 ) + ( lerpResult128_g76524 * Input_MotionSpeed62_g76523 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76523 = (float3(tex2DNode460_g76523.r , tex2DNode460_g76523.g , tex2DNode460_g76523.b));
				half3 Flutter_Texture489_g76523 = (appendResult462_g76523*2.0 + -1.0);
				float temp_output_7_0_g76401 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76401 = ( TVE_MotionFadeStart - temp_output_7_0_g76401 );
				half Motion_FadeOut4005_g76351 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76401 ) / ( temp_output_10_0_g76401 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76351 = ( _MotionAmplitude_32 * Motion_FacingMask5214_g76351 * Motion_FadeOut4005_g76351 );
				half Input_MotionAmplitude58_g76523 = Motion_30_Amplitude4960_g76351;
				half Mesh_Motion_30144_g76351 = break61_g76576.y;
				half Input_MeshMotion_30374_g76523 = Mesh_Motion_30144_g76351;
				half Input_GlobalWind471_g76523 = Global_Wind_Power2223_g76351;
				half Global_MotionValue503_g76523 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g76523 = Global_Noise_B5526_g76351;
				float lerpResult466_g76523 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76523);
				half Flutter_Amplitude491_g76523 = ( Input_MotionAmplitude58_g76523 * Input_MeshMotion_30374_g76523 * Input_GlobalWind471_g76523 * Global_MotionValue503_g76523 * pow( Input_GlobalNoise472_g76523 , lerpResult466_g76523 ) );
				half3 Motion_30_Flutter263_g76351 = ( Flutter_Texture489_g76523 * Flutter_Amplitude491_g76523 );
				float3 Vertex_Motion_Object833_g76351 = ( ( VertexPosRotationAxis50_g76472 + ( VertexPosOtherAxis82_g76472 * cos( Angle44_g76472 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76472 ) * sin( Angle44_g76472 ) ) ) + Motion_30_Flutter263_g76351 );
				half3 ObjectData20_g76419 = Vertex_Motion_Object833_g76351;
				float3 temp_output_3474_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				float3 Vertex_Motion_World1118_g76351 = ( ( ( temp_output_3474_0_g76351 + Motion_10_Interaction7519_g76351 ) + Motion_20_Squash4418_g76351 ) + Motion_30_Flutter263_g76351 );
				half3 WorldData19_g76419 = Vertex_Motion_World1118_g76351;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76419 = WorldData19_g76419;
				#else
				float3 staticSwitch14_g76419 = ObjectData20_g76419;
				#endif
				float3 temp_output_7495_0_g76351 = staticSwitch14_g76419;
				float3 Vertex_Motion7493_g76351 = temp_output_7495_0_g76351;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 break2709_g76351 = cross( ViewDirection3963_g76351 , half3(0,1,0) );
				float3 appendResult2710_g76351 = (float3(-break2709_g76351.z , 0.0 , break2709_g76351.x));
				float3 appendResult2667_g76351 = (float3(Global_MeshVariation5104_g76351 , 0.5 , Global_MeshVariation5104_g76351));
				half Mesh_Height1524_g76351 = v.ase_color.a;
				float dotResult2212_g76351 = dot( ViewDirection3963_g76351 , float3(0,1,0) );
				half Mask_HView2656_g76351 = dotResult2212_g76351;
				float saferPower2652_g76351 = abs( Mask_HView2656_g76351 );
				half3 Grass_Perspective2661_g76351 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76351 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76351*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76351 * pow( saferPower2652_g76351 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76383 = _LayerVertexValue;
				float temp_output_19_0_g76387 = TVE_VertexUsage[(int)temp_output_84_0_g76383];
				float4 temp_output_94_19_g76383 = TVE_VertexCoords;
				half2 UV97_g76383 = ( (temp_output_94_19_g76383).zw + ( (temp_output_94_19_g76383).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76383 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76383,temp_output_84_0_g76383, 0.0 );
				float4 temp_output_17_0_g76387 = tex2DArrayNode50_g76383;
				float4 temp_output_111_19_g76383 = TVE_VertexParams;
				float4 temp_output_3_0_g76387 = temp_output_111_19_g76383;
				float4 ifLocalVar18_g76387 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76387 >= 0.5 )
				ifLocalVar18_g76387 = temp_output_17_0_g76387;
				else
				ifLocalVar18_g76387 = temp_output_3_0_g76387;
				float4 lerpResult22_g76387 = lerp( temp_output_3_0_g76387 , temp_output_17_0_g76387 , temp_output_19_0_g76387);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76387 = lerpResult22_g76387;
				#else
				float4 staticSwitch24_g76387 = ifLocalVar18_g76387;
				#endif
				half4 Global_Vertex_Params4173_g76351 = staticSwitch24_g76387;
				float4 break322_g76388 = Global_Vertex_Params4173_g76351;
				half Global_VertexSize174_g76351 = saturate( break322_g76388.w );
				float lerpResult346_g76351 = lerp( 1.0 , Global_VertexSize174_g76351 , _GlobalSize);
				float3 appendResult3480_g76351 = (float3(lerpResult346_g76351 , lerpResult346_g76351 , lerpResult346_g76351));
				half3 ObjectData20_g76416 = appendResult3480_g76351;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76416 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76416 = WorldData19_g76416;
				#else
				float3 staticSwitch14_g76416 = ObjectData20_g76416;
				#endif
				half3 Vertex_Size1741_g76351 = staticSwitch14_g76416;
				float temp_output_7_0_g76417 = _SizeFadeEndValue;
				float temp_output_10_0_g76417 = ( _SizeFadeStartValue - temp_output_7_0_g76417 );
				float temp_output_7453_0_g76351 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76351 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76417 ) / ( temp_output_10_0_g76417 + 0.0001 ) ) );
				float3 appendResult3482_g76351 = (float3(temp_output_7453_0_g76351 , temp_output_7453_0_g76351 , temp_output_7453_0_g76351));
				half3 ObjectData20_g76415 = appendResult3482_g76351;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76415 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76415 = WorldData19_g76415;
				#else
				float3 staticSwitch14_g76415 = ObjectData20_g76415;
				#endif
				float3 Vertex_SizeFade1740_g76351 = staticSwitch14_g76415;
				float3 lerpResult16_g76420 = lerp( VertexPosition3588_g76351 , ( ( ( Vertex_Motion7493_g76351 + Grass_Perspective2661_g76351 ) * Vertex_Size1741_g76351 * Vertex_SizeFade1740_g76351 ) + Mesh_PivotsOS2291_g76351 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76351 = lerpResult16_g76420;
				float3 Final_VertexPosition890_g76351 = ( temp_output_4912_0_g76351 + _DisableSRPBatcher );
				
				float4 break33_g76581 = _second_uvs_mode;
				float2 temp_output_30_0_g76581 = ( v.ase_texcoord.xy * break33_g76581.x );
				float2 appendResult21_g76576 = (float2(v.ase_texcoord1.z , v.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76351 = appendResult21_g76576;
				float2 temp_output_29_0_g76581 = ( Mesh_DetailCoord3_g76351 * break33_g76581.y );
				float2 temp_output_31_0_g76581 = ( (WorldPosition_Shifted7477_g76351).xz * break33_g76581.z );
				half2 Second_UVs_Tilling7609_g76351 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7610_g76351 = ( 1.0 / Second_UVs_Tilling7609_g76351 );
				float2 lerpResult7614_g76351 = lerp( Second_UVs_Tilling7609_g76351 , Second_UVs_Scale7610_g76351 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7605_g76351 = (_SecondUVs).zw;
				float2 vertexToFrag11_g76377 = ( ( ( temp_output_30_0_g76581 + temp_output_29_0_g76581 + temp_output_31_0_g76581 ) * lerpResult7614_g76351 ) + Second_UVs_Offset7605_g76351 );
				o.ase_texcoord1.xy = vertexToFrag11_g76377;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord2.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord4.xyz = ase_worldBitangent;
				o.ase_texcoord5.xyz = vertexToFrag3890_g76351;
				o.ase_texcoord6.xyz = vertexToFrag4224_g76351;
				o.ase_texcoord7.xyz = ase_worldPos;
				
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76351;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );
				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float localCustomAlphaClip19_g76558 = ( 0.0 );
				half2 Main_UVs15_g76351 = ( ( IN.ase_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76351 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76351 );
				half Main_Alpha316_g76351 = tex2DNode29_g76351.a;
				float2 vertexToFrag11_g76377 = IN.ase_texcoord1.xy;
				half2 Second_UVs17_g76351 = vertexToFrag11_g76377;
				float4 tex2DNode89_g76351 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76351 );
				half Second_Alpha5007_g76351 = tex2DNode89_g76351.a;
				float4 tex2DNode35_g76351 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				half Main_Mask57_g76351 = tex2DNode35_g76351.b;
				float4 tex2DNode33_g76351 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				half Second_Mask81_g76351 = tex2DNode33_g76351.b;
				float lerpResult6885_g76351 = lerp( Main_Mask57_g76351 , Second_Mask81_g76351 , _DetailMaskMode);
				float clampResult17_g76483 = clamp( lerpResult6885_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76482 = _DetailMaskMinValue;
				float temp_output_10_0_g76482 = ( _DetailMaskMaxValue - temp_output_7_0_g76482 );
				half Blend_Mask_Texture6794_g76351 = saturate( ( ( clampResult17_g76483 - temp_output_7_0_g76482 ) / ( temp_output_10_0_g76482 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76351 = IN.ase_color.b;
				half4 Normal_Packed45_g76559 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				float2 appendResult58_g76559 = (float2(( (Normal_Packed45_g76559).x * (Normal_Packed45_g76559).w ) , (Normal_Packed45_g76559).y));
				half2 Normal_Default50_g76559 = appendResult58_g76559;
				half2 Normal_ASTC41_g76559 = (Normal_Packed45_g76559).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76559 = Normal_ASTC41_g76559;
				#else
				float2 staticSwitch38_g76559 = Normal_Default50_g76559;
				#endif
				half2 Normal_NO_DTX544_g76559 = (Normal_Packed45_g76559).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76559 = Normal_NO_DTX544_g76559;
				#else
				float2 staticSwitch37_g76559 = staticSwitch38_g76559;
				#endif
				float2 temp_output_6555_0_g76351 = ( (staticSwitch37_g76559*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76351 = (float3(temp_output_6555_0_g76351 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord2.xyz;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g76351 = appendResult7388_g76351;
				float3 worldNormal7389_g76351 = float3(dot(tanToWorld0,tanNormal7389_g76351), dot(tanToWorld1,tanNormal7389_g76351), dot(tanToWorld2,tanNormal7389_g76351));
				half3 Main_NormalWS7390_g76351 = worldNormal7389_g76351;
				float lerpResult6884_g76351 = lerp( Mesh_DetailMask90_g76351 , ((Main_NormalWS7390_g76351).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76481 = clamp( lerpResult6884_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76480 = _DetailMeshMinValue;
				float temp_output_10_0_g76480 = ( _DetailMeshMaxValue - temp_output_7_0_g76480 );
				half Blend_Mask_Mesh1540_g76351 = saturate( ( ( clampResult17_g76481 - temp_output_7_0_g76480 ) / ( temp_output_10_0_g76480 + 0.0001 ) ) );
				float clampResult17_g76504 = clamp( ( Blend_Mask_Texture6794_g76351 * Blend_Mask_Mesh1540_g76351 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76552 = _DetailBlendMinValue;
				float temp_output_10_0_g76552 = ( _DetailBlendMaxValue - temp_output_7_0_g76552 );
				half Blend_Mask147_g76351 = ( saturate( ( ( clampResult17_g76504 - temp_output_7_0_g76552 ) / ( temp_output_10_0_g76552 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g76351 = lerp( Main_Alpha316_g76351 , Second_Alpha5007_g76351 , Blend_Mask147_g76351);
				float lerpResult6785_g76351 = lerp( ( Main_Alpha316_g76351 * Second_Alpha5007_g76351 ) , lerpResult6153_g76351 , _DetailAlphaMode);
				#ifdef TVE_DETAIL
				float staticSwitch6158_g76351 = lerpResult6785_g76351;
				#else
				float staticSwitch6158_g76351 = Main_Alpha316_g76351;
				#endif
				half Blend_Alpha6157_g76351 = staticSwitch6158_g76351;
				half AlphaTreshold2132_g76351 = _AlphaClipValue;
				float temp_output_84_0_g76367 = _LayerExtrasValue;
				float temp_output_19_0_g76371 = TVE_ExtrasUsage[(int)temp_output_84_0_g76367];
				float4 temp_output_93_19_g76367 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76351 = IN.ase_texcoord5.xyz;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 vertexToFrag4224_g76351 = IN.ase_texcoord6.xyz;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 lerpResult4827_g76351 = lerp( WorldPosition3905_g76351 , ObjectPosition4223_g76351 , _ExtrasPositionMode);
				half2 UV96_g76367 = ( (temp_output_93_19_g76367).zw + ( (temp_output_93_19_g76367).xy * (lerpResult4827_g76351).xz ) );
				float4 tex2DArrayNode48_g76367 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76367,temp_output_84_0_g76367, 0.0 );
				float4 temp_output_17_0_g76371 = tex2DArrayNode48_g76367;
				float4 temp_output_94_85_g76367 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76371 = temp_output_94_85_g76367;
				float4 ifLocalVar18_g76371 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76371 >= 0.5 )
				ifLocalVar18_g76371 = temp_output_17_0_g76371;
				else
				ifLocalVar18_g76371 = temp_output_3_0_g76371;
				float4 lerpResult22_g76371 = lerp( temp_output_3_0_g76371 , temp_output_17_0_g76371 , temp_output_19_0_g76371);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76371 = lerpResult22_g76371;
				#else
				float4 staticSwitch24_g76371 = ifLocalVar18_g76371;
				#endif
				half4 Global_Extras_Params5440_g76351 = staticSwitch24_g76371;
				float4 break456_g76381 = Global_Extras_Params5440_g76351;
				half Global_Extras_Alpha1033_g76351 = saturate( break456_g76381.w );
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = IN.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				float lerpResult5154_g76351 = lerp( 0.0 , Global_MeshVariation5104_g76351 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76351 = lerpResult5154_g76351;
				float Emissive_Alpha7625_g76351 = 0.0;
				float lerpResult6866_g76351 = lerp( ( 1.0 - Blend_Mask147_g76351 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_DETAIL
				float staticSwitch6612_g76351 = lerpResult6866_g76351;
				#else
				float staticSwitch6612_g76351 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76351 = staticSwitch6612_g76351;
				half Alpha_Mask6234_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5203_g76351 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76351 - saturate( ( Global_Alpha_Variation5158_g76351 + Emissive_Alpha7625_g76351 ) ) ) + ( Global_Extras_Alpha1033_g76351 * 0.1 ) ) ) , ( Alpha_Mask6234_g76351 * _GlobalAlpha ));
				float lerpResult16_g76395 = lerp( 1.0 , lerpResult5203_g76351 , TVE_IsEnabled);
				half Global_Alpha315_g76351 = lerpResult16_g76395;
				float3 ase_worldPos = IN.ase_texcoord7.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 normalizeResult3971_g76351 = normalize( cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) ) );
				float3 WorldNormal_Derivates3972_g76351 = normalizeResult3971_g76351;
				float dotResult3851_g76351 = dot( ViewDirection3963_g76351 , WorldNormal_Derivates3972_g76351 );
				float lerpResult3993_g76351 = lerp( 1.0 , saturate( ( abs( dotResult3851_g76351 ) * 3.0 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g76351 = lerpResult3993_g76351;
				half Fade_Effects_A5360_g76351 = Fade_Glancing3853_g76351;
				float temp_output_7_0_g76404 = TVE_CameraFadeMin;
				float temp_output_10_0_g76404 = ( TVE_CameraFadeMax - temp_output_7_0_g76404 );
				float lerpResult4755_g76351 = lerp( 1.0 , saturate( saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76404 ) / ( temp_output_10_0_g76404 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76351 = lerpResult4755_g76351;
				half Fade_Effects_B6228_g76351 = ( Fade_Effects_A5360_g76351 * Fade_Camera3743_g76351 );
				half Fade_Mask5149_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5141_g76351 = lerp( 1.0 , ( Fade_Effects_B6228_g76351 * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76351);
				half Fade_Effects_C7653_g76351 = lerpResult5141_g76351;
				float temp_output_5865_0_g76351 = saturate( ( Fade_Effects_C7653_g76351 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76351 ) ).r ) );
				half Fade_Alpha3727_g76351 = temp_output_5865_0_g76351;
				half Final_Alpha7344_g76351 = min( ( ( Blend_Alpha6157_g76351 - AlphaTreshold2132_g76351 ) * Global_Alpha315_g76351 ) , Fade_Alpha3727_g76351 );
				float temp_output_3_0_g76558 = Final_Alpha7344_g76351;
				float Alpha19_g76558 = temp_output_3_0_g76558;
				float temp_output_15_0_g76558 = 0.01;
				float Treshold19_g76558 = temp_output_15_0_g76558;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#else
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#endif
				}
				float clampResult17_g76560 = clamp( Main_Mask57_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76561 = _MainMaskMinValue;
				float temp_output_10_0_g76561 = ( _MainMaskMaxValue - temp_output_7_0_g76561 );
				half Main_Mask_Remap5765_g76351 = saturate( ( ( clampResult17_g76560 - temp_output_7_0_g76561 ) / ( temp_output_10_0_g76561 + 0.0001 ) ) );
				float lerpResult7671_g76351 = lerp( 1.0 , Main_Mask_Remap5765_g76351 , _MainColorMode);
				float4 lerpResult7654_g76351 = lerp( _MainColorTwo , _MainColor , lerpResult7671_g76351);
				half Main_Color_Alpha6121_g76351 = (lerpResult7654_g76351).a;
				float clampResult17_g76563 = clamp( Second_Mask81_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76564 = _SecondMaskMinValue;
				float temp_output_10_0_g76564 = ( _SecondMaskMaxValue - temp_output_7_0_g76564 );
				half Second_Mask_Remap6130_g76351 = saturate( ( ( clampResult17_g76563 - temp_output_7_0_g76564 ) / ( temp_output_10_0_g76564 + 0.0001 ) ) );
				float lerpResult7672_g76351 = lerp( 1.0 , Second_Mask_Remap6130_g76351 , _SecondColorMode);
				float4 lerpResult7662_g76351 = lerp( _SecondColorTwo , _SecondColor , lerpResult7672_g76351);
				half Second_Color_Alpha6152_g76351 = (lerpResult7662_g76351).a;
				float lerpResult6168_g76351 = lerp( Main_Color_Alpha6121_g76351 , Second_Color_Alpha6152_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6174_g76351 = lerpResult6168_g76351;
				#else
				float staticSwitch6174_g76351 = Main_Color_Alpha6121_g76351;
				#endif
				half Blend_Color_Alpha6167_g76351 = staticSwitch6174_g76351;
				half Final_Clip914_g76351 = saturate( ( Alpha19_g76558 * Blend_Color_Alpha6167_g76351 ) );
				

				surfaceDescription.Alpha = Final_Clip914_g76351;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "MotionVectors"
			Tags { "LightMode"="MotionVectors" }

			ColorMask RG

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag
	
            #define SHADERPASS SHADERPASS_MOTION_VECTORS

            #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
				#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
			#endif

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MotionVectorsCommon.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_fragment TVE_ALPHA_CLIP
			#pragma shader_feature_local TVE_DETAIL
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_STANDARD_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 positionOld : TEXCOORD4;
				#if _ADD_PRECOMPUTED_VELOCITY
					float3 alembicMotionVector : TEXCOORD5;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_tangent : TANGENT;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 positionCSNoJitter : TEXCOORD0;
				float4 previousPositionCSNoJitter : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SecondColor;
			half4 _MotionHighlightColor;
			half4 _SubsurfaceColor;
			half4 _NoiseMaskRemap;
			half4 _MainColorTwo;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			half4 _SecondColorTwo;
			half4 _MainUVs;
			half4 _Color;
			half4 _DetailBlendRemap;
			half4 _EmissiveTexRemap;
			half4 _GradientMaskRemap;
			half4 _VertexOcclusionRemap;
			half4 _second_uvs_mode;
			half4 _SecondUVs;
			float4 _MaxBoundsInfo;
			half4 _VertexOcclusionColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _DetailMeshRemap;
			half4 _MainMaskRemap;
			half4 _SecondMaskRemap;
			half4 _DetailMaskRemap;
			half4 _GradientColorOne;
			half4 _GradientColorTwo;
			half4 _RimLightRemap;
			half4 _MainColor;
			half3 _render_normals;
			half _SecondColorMode;
			half _DetailBlendMode;
			half _DetailMaskMode;
			half _DetailMaskMinValue;
			half _DetailMaskMaxValue;
			half _MainNormalValue;
			half _DetailMeshMode;
			half _DetailMeshMinValue;
			half _SecondMaskMaxValue;
			half _render_cull;
			half _MainMaskMaxValue;
			half _SecondAlbedoValue;
			half _MotionAmplitude_22;
			float _MotionScale_32;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionAmplitude_32;
			half _PerspectivePushValue;
			half _PerspectiveNoiseValue;
			half _PerspectiveAngleValue;
			half _LayerVertexValue;
			half _GlobalSize;
			half _SizeFadeEndValue;
			half _SizeFadeStartValue;
			half _MainAlbedoValue;
			half _MainMaskMinValue;
			half _DetailMeshMaxValue;
			half _MainColorMode;
			half _SecondUVsScaleMode;
			half _SecondMaskMinValue;
			half _DetailBlendMinValue;
			half _GradientMaxValue;
			half _DetailMode;
			half _SubsurfaceValue;
			half _SubsurfaceMaskValue;
			half _EmissiveTexMinValue;
			half _EmissiveTexMaxValue;
			half _GlobalEmissive;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			half _RenderSpecular;
			half _GlobalWetness;
			half _MainSmoothnessValue;
			half _MainOcclusionValue;
			half _SecondOcclusionValue;
			half _DetailAlphaMode;
			half _AlphaClipValue;
			half _AlphaVariationValue;
			half _DetailFadeMode;
			half _GlobalAlpha;
			half _FadeGlancingValue;
			half _SecondSmoothnessValue;
			half _DetailBlendMaxValue;
			half _VertexOcclusionOverlayMode;
			half _SecondNormalValue;
			half _DetailValue;
			half _GradientMinValue;
			half _MotionAmplitude_20;
			half _VertexOcclusionMinValue;
			half _VertexOcclusionMaxValue;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _ColorsIntensityValue;
			half _OverlayProjectionValue;
			half _ColorsMaskValue;
			half _ColorsVariationValue;
			half _VertexOcclusionColorsMode;
			half _GlobalOverlay;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _OverlayVariationValue;
			half _DetailNormalValue;
			half _SecondUVsMode;
			half _GlobalColors;
			half _MotionFacingValue;
			half _LayerMotionValue;
			half _MotionVariation_20;
			half _CategoryGlobals;
			half _CategoryMain;
			half _CategoryPerspective;
			half _CategorySizeFade;
			half _SpaceRenderFade;
			half _RenderDirect;
			half _RenderAmbient;
			half _RenderShadow;
			half _IsCoreShader;
			half _DetailTypeMode;
			half _DetailOpaqueMode;
			half _DetailCoordMode;
			half _Cutoff;
			half _SubsurfaceNormalValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceAngleValue;
			half _SubsurfaceScatteringValue;
			half _SpaceGlobalLocals;
			half _MotionValue_30;
			half _IsVersion;
			half _HasEmissive;
			half _render_src;
			half _render_zw;
			half _render_dst;
			half _render_coverage;
			half _IsStandardShader;
			float _IsPlantShader;
			float _SubsurfaceDiffusion;
			half _RenderCull;
			half _RenderMode;
			half _CategoryRender;
			half _RenderNormals;
			half _MessageGlobalsVariation;
			half _IsTVEShader;
			half _HasOcclusion;
			half _IsIdentifier;
			half _IsCollected;
			half _IsShared;
			half _IsCustomShader;
			half _HasGradient;
			half _VertexVariationMode;
			half _MotionSpeed_20;
			half _MotionValue_20;
			half _MessageMotionVariation;
			half _DetailMeshInvertMode;
			half _MessageMainMask;
			half _MessageSecondMask;
			half _MessageOcclusion;
			half _EmissiveMode;
			half _EmissiveIntensityValue;
			half _EmissiveFlagMode;
			half _EmissiveIntensityMode;
			half _VertexPivotMode;
			half _MotionPosition_10;
			float _MotionScale_10;
			float _MotionSpeed_10;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_20;
			half _DetailMaskInvertMode;
			half _CategoryMotion;
			half _ColorsMaskMaxValue;
			half _RenderCoverage;
			half _MessageSubsurface;
			half _SpaceGlobalLayers;
			half _SpaceGlobalOptions;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _CategoryDetail;
			half _CategoryOcclusion;
			half _CategoryGradient;
			half _CategoryNoise;
			half _CategoryRimLight;
			half _CategoryMatcap;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _RenderZWrite;
			half _RenderQueue;
			half _RenderPriority;
			half _RenderDecals;
			half _RenderSSR;
			half _RenderClip;
			half _ColorsMaskMinValue;
			half _FadeConstantValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_MainTex);
			SAMPLER(sampler_MainTex);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			float TVE_MotionUsage[10];
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_Linear_Clamp);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_MotionValue_20;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half TVE_MotionValue_30;
			float TVE_VertexUsage[10];
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			half4 TVE_VertexParams;
			half TVE_DistanceFadeBias;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_MainAlbedoTex);
			SAMPLER(sampler_MainAlbedoTex);
			TEXTURE2D(_SecondAlbedoTex);
			SAMPLER(sampler_SecondAlbedoTex);
			TEXTURE2D(_MainMaskTex);
			TEXTURE2D(_SecondMaskTex);
			TEXTURE2D(_MainNormalTex);
			float TVE_ExtrasUsage[10];
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			half4 TVE_ExtrasParams;
			half TVE_CameraFadeMin;
			half TVE_CameraFadeMax;
			TEXTURE3D(TVE_NoiseTex3D);
			half TVE_NoiseTex3DTilling;


			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 VertexPosition3588_g76351 = v.positionOS.xyz;
				float3 appendResult60_g76361 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g76351 = ( appendResult60_g76361 * _VertexPivotMode );
				half3 Mesh_PivotsOS2291_g76351 = Mesh_PivotsData2831_g76351;
				float3 temp_output_2283_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				half3 VertexPos40_g76486 = temp_output_2283_0_g76351;
				half3 VertexPos40_g76487 = VertexPos40_g76486;
				float3 appendResult74_g76487 = (float3(VertexPos40_g76487.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76487 = appendResult74_g76487;
				float3 break84_g76487 = VertexPos40_g76487;
				float3 appendResult81_g76487 = (float3(0.0 , break84_g76487.y , break84_g76487.z));
				half3 VertexPosOtherAxis82_g76487 = appendResult81_g76487;
				float3 ase_worldPos = TransformObjectToWorld( (v.positionOS).xyz );
				float3 vertexToFrag3890_g76351 = ase_worldPos;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 WorldPosition_Shifted7477_g76351 = ( WorldPosition3905_g76351 - TVE_WorldOrigin );
				float4x4 break19_g76407 = GetObjectToWorldMatrix();
				float3 appendResult20_g76407 = (float3(break19_g76407[ 0 ][ 3 ] , break19_g76407[ 1 ][ 3 ] , break19_g76407[ 2 ][ 3 ]));
				float3 temp_output_122_0_g76407 = Mesh_PivotsData2831_g76351;
				float3 PivotsOnly105_g76407 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g76407 , 0.0 ) ).xyz).xyz;
				half3 ObjectData20_g76409 = ( appendResult20_g76407 + PivotsOnly105_g76407 );
				half3 WorldData19_g76409 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76409 = WorldData19_g76409;
				#else
				float3 staticSwitch14_g76409 = ObjectData20_g76409;
				#endif
				float3 temp_output_114_0_g76407 = staticSwitch14_g76409;
				float3 vertexToFrag4224_g76351 = temp_output_114_0_g76407;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				float3 lerpResult6766_g76351 = lerp( WorldPosition_Shifted7477_g76351 , ObjectPosition_Shifted7481_g76351 , _MotionPosition_10);
				float3 Motion_10_Position6738_g76351 = lerpResult6766_g76351;
				half3 Input_Position419_g76527 = Motion_10_Position6738_g76351;
				float Input_MotionScale287_g76527 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76527 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76527 = (( Input_Position419_g76527 * Input_MotionScale287_g76527 * NoiseTex_Tilling735_g76527 * 0.0075 )).xz;
				float2 temp_output_447_0_g76356 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4683_g76351 = temp_output_447_0_g76356;
				half2 Input_DirectionWS423_g76527 = Global_Wind_DirectionWS4683_g76351;
				float lerpResult128_g76528 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76527 = _MotionSpeed_10;
				half Input_MotionVariation284_g76527 = _MotionVariation_10;
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = v.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				half Input_GlobalMeshVariation569_g76527 = Global_MeshVariation5104_g76351;
				float temp_output_630_0_g76527 = ( ( ( lerpResult128_g76528 * Input_MotionSpeed62_g76527 ) + ( Input_MotionVariation284_g76527 * Input_GlobalMeshVariation569_g76527 ) ) * 0.03 );
				float temp_output_607_0_g76527 = frac( temp_output_630_0_g76527 );
				float4 lerpResult590_g76527 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * temp_output_607_0_g76527 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76527 + ( -Input_DirectionWS423_g76527 * frac( ( temp_output_630_0_g76527 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76527 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76527 = lerpResult590_g76527;
				float2 temp_output_645_0_g76527 = ((Noise_Complex703_g76527).rg*2.0 + -1.0);
				float2 break650_g76527 = temp_output_645_0_g76527;
				float3 appendResult649_g76527 = (float3(break650_g76527.x , 0.0 , break650_g76527.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS5548_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76527 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76510 = Global_Noise_OS5548_g76351;
				float2 break448_g76356 = temp_output_447_0_g76356;
				float3 appendResult452_g76356 = (float3(break448_g76356.x , 0.0 , break448_g76356.y));
				half2 Global_Wind_DirectionOS5692_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76510 = Global_Wind_DirectionOS5692_g76351;
				float temp_output_84_0_g76362 = _LayerMotionValue;
				float temp_output_19_0_g76366 = TVE_MotionUsage[(int)temp_output_84_0_g76362];
				float4 temp_output_91_19_g76362 = TVE_MotionCoords;
				half2 UV94_g76362 = ( (temp_output_91_19_g76362).zw + ( (temp_output_91_19_g76362).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76362 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_Linear_Clamp, UV94_g76362,temp_output_84_0_g76362, 0.0 );
				float4 temp_output_17_0_g76366 = tex2DArrayNode50_g76362;
				float4 temp_output_112_19_g76362 = TVE_MotionParams;
				float4 temp_output_3_0_g76366 = temp_output_112_19_g76362;
				float4 ifLocalVar18_g76366 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76366 >= 0.5 )
				ifLocalVar18_g76366 = temp_output_17_0_g76366;
				else
				ifLocalVar18_g76366 = temp_output_3_0_g76366;
				float4 lerpResult22_g76366 = lerp( temp_output_3_0_g76366 , temp_output_17_0_g76366 , temp_output_19_0_g76366);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76366 = lerpResult22_g76366;
				#else
				float4 staticSwitch24_g76366 = ifLocalVar18_g76366;
				#endif
				half4 Global_Motion_Params3909_g76351 = staticSwitch24_g76366;
				float4 break322_g76356 = Global_Motion_Params3909_g76351;
				float lerpResult457_g76356 = lerp( break322_g76356.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76356 = ( 1.0 - lerpResult457_g76356 );
				half Global_Wind_Power2223_g76351 = ( 1.0 - ( temp_output_459_0_g76356 * temp_output_459_0_g76356 ) );
				half Input_WindPower449_g76510 = Global_Wind_Power2223_g76351;
				float2 lerpResult516_g76510 = lerp( Input_Noise_DirectionOS487_g76510 , Input_Wind_DirectionOS458_g76510 , ( Input_WindPower449_g76510 * 0.6 ));
				half Mesh_Motion_107572_g76351 = v.ase_color.a;
				half Input_MeshHeight388_g76510 = Mesh_Motion_107572_g76351;
				half ObjectData20_g76511 = Input_MeshHeight388_g76510;
				float enc62_g76576 = v.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g76576 = DecodeFloatToVector2( enc62_g76576 );
				float2 break63_g76576 = ( localDecodeFloatToVector262_g76576 * 100.0 );
				float Bounds_Height5230_g76351 = break63_g76576.x;
				half Input_BoundsHeight390_g76510 = Bounds_Height5230_g76351;
				half WorldData19_g76511 = ( Input_MeshHeight388_g76510 * Input_MeshHeight388_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76511 = WorldData19_g76511;
				#else
				float staticSwitch14_g76511 = ObjectData20_g76511;
				#endif
				half Final_Motion10_Mask321_g76510 = ( staticSwitch14_g76511 * 2.0 );
				half Input_BendingAmplitude376_g76510 = _MotionAmplitude_10;
				half Global_MotionValue640_g76510 = TVE_MotionValue_10;
				half2 Final_Bending631_g76510 = ( lerpResult516_g76510 * ( Final_Motion10_Mask321_g76510 * Input_BendingAmplitude376_g76510 * Input_WindPower449_g76510 * Input_WindPower449_g76510 * Global_MotionValue640_g76510 ) );
				float2 appendResult433_g76356 = (float2(break322_g76356.x , break322_g76356.y));
				float2 temp_output_436_0_g76356 = (appendResult433_g76356*2.0 + -1.0);
				float2 break441_g76356 = temp_output_436_0_g76356;
				float3 appendResult440_g76356 = (float3(break441_g76356.x , 0.0 , break441_g76356.y));
				half2 Global_React_DirectionOS39_g76351 = (( mul( GetWorldToObjectMatrix(), float4( appendResult440_g76356 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_React_DirectionOS358_g76510 = Global_React_DirectionOS39_g76351;
				float clampResult17_g76513 = clamp( Input_MeshHeight388_g76510 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76512 = 0.0;
				half Input_InteractionUseMask62_g76510 = _InteractionMaskValue;
				float temp_output_10_0_g76512 = ( Input_InteractionUseMask62_g76510 - temp_output_7_0_g76512 );
				half Final_InteractionRemap594_g76510 = saturate( ( ( clampResult17_g76513 - temp_output_7_0_g76512 ) / ( temp_output_10_0_g76512 + 0.0001 ) ) );
				half ObjectData20_g76514 = Final_InteractionRemap594_g76510;
				half WorldData19_g76514 = ( Final_InteractionRemap594_g76510 * Final_InteractionRemap594_g76510 * Input_BoundsHeight390_g76510 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76514 = WorldData19_g76514;
				#else
				float staticSwitch14_g76514 = ObjectData20_g76514;
				#endif
				half Final_InteractionMask373_g76510 = ( staticSwitch14_g76514 * 2.0 );
				half Input_InteractionAmplitude58_g76510 = _InteractionAmplitude;
				half2 Final_Interaction632_g76510 = ( Input_React_DirectionOS358_g76510 * Final_InteractionMask373_g76510 * Input_InteractionAmplitude58_g76510 );
				half Global_Interaction_Mask66_g76351 = ( break322_g76356.w * break322_g76356.w * break322_g76356.w * break322_g76356.w );
				float Input_InteractionGlobalMask330_g76510 = Global_Interaction_Mask66_g76351;
				half Final_InteractionValue525_g76510 = saturate( ( Input_InteractionAmplitude58_g76510 * Input_InteractionGlobalMask330_g76510 ) );
				float2 lerpResult551_g76510 = lerp( Final_Bending631_g76510 , Final_Interaction632_g76510 , Final_InteractionValue525_g76510);
				float2 break364_g76510 = lerpResult551_g76510;
				float3 appendResult638_g76510 = (float3(break364_g76510.x , 0.0 , break364_g76510.y));
				half3 Motion_10_Interaction7519_g76351 = appendResult638_g76510;
				half3 Angle44_g76486 = Motion_10_Interaction7519_g76351;
				half Angle44_g76487 = (Angle44_g76486).z;
				half3 VertexPos40_g76488 = ( VertexPosRotationAxis50_g76487 + ( VertexPosOtherAxis82_g76487 * cos( Angle44_g76487 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76487 ) * sin( Angle44_g76487 ) ) );
				float3 appendResult74_g76488 = (float3(0.0 , 0.0 , VertexPos40_g76488.z));
				half3 VertexPosRotationAxis50_g76488 = appendResult74_g76488;
				float3 break84_g76488 = VertexPos40_g76488;
				float3 appendResult81_g76488 = (float3(break84_g76488.x , break84_g76488.y , 0.0));
				half3 VertexPosOtherAxis82_g76488 = appendResult81_g76488;
				half Angle44_g76488 = -(Angle44_g76486).x;
				half3 Input_Position419_g76566 = WorldPosition_Shifted7477_g76351;
				float3 break459_g76566 = Input_Position419_g76566;
				float Sum_Position446_g76566 = ( break459_g76566.x + break459_g76566.y + break459_g76566.z );
				half Input_MotionScale321_g76566 = ( _MotionScale_20 * 0.1 );
				half Input_MotionVariation330_g76566 = _MotionVariation_20;
				half Input_GlobalVariation400_g76566 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76567 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76566 = _MotionSpeed_20;
				float temp_output_404_0_g76566 = ( lerpResult128_g76567 * Input_MotionSpeed62_g76566 );
				half Motion_SineA450_g76566 = sin( ( ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) + ( Input_MotionVariation330_g76566 * Input_GlobalVariation400_g76566 ) + temp_output_404_0_g76566 ) );
				half Motion_SineB395_g76566 = sin( ( ( temp_output_404_0_g76566 * 0.6842 ) + ( Sum_Position446_g76566 * Input_MotionScale321_g76566 ) ) );
				half3 Input_Position419_g76585 = VertexPosition3588_g76351;
				float3 normalizeResult518_g76585 = normalize( Input_Position419_g76585 );
				half2 Input_DirectionOS423_g76585 = Global_React_DirectionOS39_g76351;
				float2 break521_g76585 = -Input_DirectionOS423_g76585;
				float3 appendResult522_g76585 = (float3(break521_g76585.x , 0.0 , break521_g76585.y));
				float dotResult519_g76585 = dot( normalizeResult518_g76585 , appendResult522_g76585 );
				half Input_Value62_g76585 = _MotionFacingValue;
				float lerpResult524_g76585 = lerp( 1.0 , (dotResult519_g76585*0.5 + 0.5) , Input_Value62_g76585);
				half ObjectData20_g76586 = max( lerpResult524_g76585 , 0.001 );
				half WorldData19_g76586 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76586 = WorldData19_g76586;
				#else
				float staticSwitch14_g76586 = ObjectData20_g76586;
				#endif
				half Motion_FacingMask5214_g76351 = staticSwitch14_g76586;
				half Motion_20_Amplitude4381_g76351 = Motion_FacingMask5214_g76351;
				half Input_MotionAmplitude384_g76566 = Motion_20_Amplitude4381_g76351;
				half Input_GlobalWind407_g76566 = Global_Wind_Power2223_g76351;
				float4 break638_g76527 = abs( Noise_Complex703_g76527 );
				half Global_Noise_B5526_g76351 = break638_g76527.b;
				half Input_GlobalNoise411_g76566 = Global_Noise_B5526_g76351;
				float lerpResult413_g76566 = lerp( 1.8 , 0.4 , Input_GlobalWind407_g76566);
				half Motion_Amplitude418_g76566 = ( Input_MotionAmplitude384_g76566 * Input_GlobalWind407_g76566 * pow( Input_GlobalNoise411_g76566 , lerpResult413_g76566 ) );
				half Input_Squash58_g76566 = _MotionAmplitude_20;
				float enc59_g76576 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g76576 = DecodeFloatToVector2( enc59_g76576 );
				float2 break61_g76576 = localDecodeFloatToVector259_g76576;
				half Mesh_Motion_2060_g76351 = break61_g76576.x;
				half Input_MeshMotion_20388_g76566 = Mesh_Motion_2060_g76351;
				float Bounds_Radius5231_g76351 = break63_g76576.y;
				half Input_BoundsRadius390_g76566 = Bounds_Radius5231_g76351;
				half Global_MotionValue462_g76566 = TVE_MotionValue_20;
				half2 Input_DirectionOS366_g76566 = Global_React_DirectionOS39_g76351;
				float2 break371_g76566 = Input_DirectionOS366_g76566;
				float3 appendResult372_g76566 = (float3(break371_g76566.x , ( Motion_SineA450_g76566 * 0.3 ) , break371_g76566.y));
				half3 Motion_20_Squash4418_g76351 = ( ( (max( Motion_SineA450_g76566 , Motion_SineB395_g76566 )*0.5 + 0.5) * Motion_Amplitude418_g76566 * Input_Squash58_g76566 * Input_MeshMotion_20388_g76566 * Input_BoundsRadius390_g76566 * Global_MotionValue462_g76566 ) * appendResult372_g76566 );
				half3 VertexPos40_g76472 = ( ( VertexPosRotationAxis50_g76488 + ( VertexPosOtherAxis82_g76488 * cos( Angle44_g76488 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76488 ) * sin( Angle44_g76488 ) ) ) + Motion_20_Squash4418_g76351 );
				float3 appendResult74_g76472 = (float3(0.0 , VertexPos40_g76472.y , 0.0));
				float3 VertexPosRotationAxis50_g76472 = appendResult74_g76472;
				float3 break84_g76472 = VertexPos40_g76472;
				float3 appendResult81_g76472 = (float3(break84_g76472.x , 0.0 , break84_g76472.z));
				float3 VertexPosOtherAxis82_g76472 = appendResult81_g76472;
				half Input_Rolling379_g76566 = _MotionAmplitude_22;
				half Motion_20_Rolling5257_g76351 = ( Motion_SineA450_g76566 * Motion_Amplitude418_g76566 * Input_Rolling379_g76566 * Input_MeshMotion_20388_g76566 * Global_MotionValue462_g76566 );
				half Angle44_g76472 = Motion_20_Rolling5257_g76351;
				half3 Input_Position500_g76523 = WorldPosition_Shifted7477_g76351;
				half Input_MotionScale321_g76523 = _MotionScale_32;
				half Input_MotionVariation330_g76523 = _MotionVariation_32;
				half Input_GlobalVariation372_g76523 = Global_MeshVariation5104_g76351;
				float lerpResult128_g76524 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76523 = _MotionSpeed_32;
				float4 tex2DNode460_g76523 = SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( ( (Input_Position500_g76523).xz * Input_MotionScale321_g76523 * 0.03 ) + ( Input_MotionVariation330_g76523 * Input_GlobalVariation372_g76523 ) + ( lerpResult128_g76524 * Input_MotionSpeed62_g76523 * 0.02 ) ), 0.0 );
				float3 appendResult462_g76523 = (float3(tex2DNode460_g76523.r , tex2DNode460_g76523.g , tex2DNode460_g76523.b));
				half3 Flutter_Texture489_g76523 = (appendResult462_g76523*2.0 + -1.0);
				float temp_output_7_0_g76401 = TVE_MotionFadeEnd;
				float temp_output_10_0_g76401 = ( TVE_MotionFadeStart - temp_output_7_0_g76401 );
				half Motion_FadeOut4005_g76351 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76401 ) / ( temp_output_10_0_g76401 + 0.0001 ) ) );
				half Motion_30_Amplitude4960_g76351 = ( _MotionAmplitude_32 * Motion_FacingMask5214_g76351 * Motion_FadeOut4005_g76351 );
				half Input_MotionAmplitude58_g76523 = Motion_30_Amplitude4960_g76351;
				half Mesh_Motion_30144_g76351 = break61_g76576.y;
				half Input_MeshMotion_30374_g76523 = Mesh_Motion_30144_g76351;
				half Input_GlobalWind471_g76523 = Global_Wind_Power2223_g76351;
				half Global_MotionValue503_g76523 = TVE_MotionValue_30;
				half Input_GlobalNoise472_g76523 = Global_Noise_B5526_g76351;
				float lerpResult466_g76523 = lerp( 2.4 , 0.6 , Input_GlobalWind471_g76523);
				half Flutter_Amplitude491_g76523 = ( Input_MotionAmplitude58_g76523 * Input_MeshMotion_30374_g76523 * Input_GlobalWind471_g76523 * Global_MotionValue503_g76523 * pow( Input_GlobalNoise472_g76523 , lerpResult466_g76523 ) );
				half3 Motion_30_Flutter263_g76351 = ( Flutter_Texture489_g76523 * Flutter_Amplitude491_g76523 );
				float3 Vertex_Motion_Object833_g76351 = ( ( VertexPosRotationAxis50_g76472 + ( VertexPosOtherAxis82_g76472 * cos( Angle44_g76472 ) ) + ( cross( float3(0,1,0) , VertexPosOtherAxis82_g76472 ) * sin( Angle44_g76472 ) ) ) + Motion_30_Flutter263_g76351 );
				half3 ObjectData20_g76419 = Vertex_Motion_Object833_g76351;
				float3 temp_output_3474_0_g76351 = ( VertexPosition3588_g76351 - Mesh_PivotsOS2291_g76351 );
				float3 Vertex_Motion_World1118_g76351 = ( ( ( temp_output_3474_0_g76351 + Motion_10_Interaction7519_g76351 ) + Motion_20_Squash4418_g76351 ) + Motion_30_Flutter263_g76351 );
				half3 WorldData19_g76419 = Vertex_Motion_World1118_g76351;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76419 = WorldData19_g76419;
				#else
				float3 staticSwitch14_g76419 = ObjectData20_g76419;
				#endif
				float3 temp_output_7495_0_g76351 = staticSwitch14_g76419;
				float3 Vertex_Motion7493_g76351 = temp_output_7495_0_g76351;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 break2709_g76351 = cross( ViewDirection3963_g76351 , half3(0,1,0) );
				float3 appendResult2710_g76351 = (float3(-break2709_g76351.z , 0.0 , break2709_g76351.x));
				float3 appendResult2667_g76351 = (float3(Global_MeshVariation5104_g76351 , 0.5 , Global_MeshVariation5104_g76351));
				half Mesh_Height1524_g76351 = v.ase_color.a;
				float dotResult2212_g76351 = dot( ViewDirection3963_g76351 , float3(0,1,0) );
				half Mask_HView2656_g76351 = dotResult2212_g76351;
				float saferPower2652_g76351 = abs( Mask_HView2656_g76351 );
				half3 Grass_Perspective2661_g76351 = ( ( ( mul( GetWorldToObjectMatrix(), float4( appendResult2710_g76351 , 0.0 ) ).xyz * _PerspectivePushValue ) + ( (appendResult2667_g76351*2.0 + -1.0) * _PerspectiveNoiseValue ) ) * Mesh_Height1524_g76351 * pow( saferPower2652_g76351 , _PerspectiveAngleValue ) );
				float temp_output_84_0_g76383 = _LayerVertexValue;
				float temp_output_19_0_g76387 = TVE_VertexUsage[(int)temp_output_84_0_g76383];
				float4 temp_output_94_19_g76383 = TVE_VertexCoords;
				half2 UV97_g76383 = ( (temp_output_94_19_g76383).zw + ( (temp_output_94_19_g76383).xy * (ObjectPosition4223_g76351).xz ) );
				float4 tex2DArrayNode50_g76383 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_Linear_Clamp, UV97_g76383,temp_output_84_0_g76383, 0.0 );
				float4 temp_output_17_0_g76387 = tex2DArrayNode50_g76383;
				float4 temp_output_111_19_g76383 = TVE_VertexParams;
				float4 temp_output_3_0_g76387 = temp_output_111_19_g76383;
				float4 ifLocalVar18_g76387 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76387 >= 0.5 )
				ifLocalVar18_g76387 = temp_output_17_0_g76387;
				else
				ifLocalVar18_g76387 = temp_output_3_0_g76387;
				float4 lerpResult22_g76387 = lerp( temp_output_3_0_g76387 , temp_output_17_0_g76387 , temp_output_19_0_g76387);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76387 = lerpResult22_g76387;
				#else
				float4 staticSwitch24_g76387 = ifLocalVar18_g76387;
				#endif
				half4 Global_Vertex_Params4173_g76351 = staticSwitch24_g76387;
				float4 break322_g76388 = Global_Vertex_Params4173_g76351;
				half Global_VertexSize174_g76351 = saturate( break322_g76388.w );
				float lerpResult346_g76351 = lerp( 1.0 , Global_VertexSize174_g76351 , _GlobalSize);
				float3 appendResult3480_g76351 = (float3(lerpResult346_g76351 , lerpResult346_g76351 , lerpResult346_g76351));
				half3 ObjectData20_g76416 = appendResult3480_g76351;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g76416 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76416 = WorldData19_g76416;
				#else
				float3 staticSwitch14_g76416 = ObjectData20_g76416;
				#endif
				half3 Vertex_Size1741_g76351 = staticSwitch14_g76416;
				float temp_output_7_0_g76417 = _SizeFadeEndValue;
				float temp_output_10_0_g76417 = ( _SizeFadeStartValue - temp_output_7_0_g76417 );
				float temp_output_7453_0_g76351 = saturate( ( ( ( distance( _WorldSpaceCameraPos , ObjectPosition4223_g76351 ) * ( 1.0 / TVE_DistanceFadeBias ) ) - temp_output_7_0_g76417 ) / ( temp_output_10_0_g76417 + 0.0001 ) ) );
				float3 appendResult3482_g76351 = (float3(temp_output_7453_0_g76351 , temp_output_7453_0_g76351 , temp_output_7453_0_g76351));
				half3 ObjectData20_g76415 = appendResult3482_g76351;
				half3 _Vector5 = half3(1,1,1);
				half3 WorldData19_g76415 = _Vector5;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76415 = WorldData19_g76415;
				#else
				float3 staticSwitch14_g76415 = ObjectData20_g76415;
				#endif
				float3 Vertex_SizeFade1740_g76351 = staticSwitch14_g76415;
				float3 lerpResult16_g76420 = lerp( VertexPosition3588_g76351 , ( ( ( Vertex_Motion7493_g76351 + Grass_Perspective2661_g76351 ) * Vertex_Size1741_g76351 * Vertex_SizeFade1740_g76351 ) + Mesh_PivotsOS2291_g76351 ) , TVE_IsEnabled);
				float3 temp_output_4912_0_g76351 = lerpResult16_g76420;
				float3 Final_VertexPosition890_g76351 = ( temp_output_4912_0_g76351 + _DisableSRPBatcher );
				
				float4 break33_g76581 = _second_uvs_mode;
				float2 temp_output_30_0_g76581 = ( v.ase_texcoord.xy * break33_g76581.x );
				float2 appendResult21_g76576 = (float2(v.ase_texcoord1.z , v.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g76351 = appendResult21_g76576;
				float2 temp_output_29_0_g76581 = ( Mesh_DetailCoord3_g76351 * break33_g76581.y );
				float2 temp_output_31_0_g76581 = ( (WorldPosition_Shifted7477_g76351).xz * break33_g76581.z );
				half2 Second_UVs_Tilling7609_g76351 = (_SecondUVs).xy;
				half2 Second_UVs_Scale7610_g76351 = ( 1.0 / Second_UVs_Tilling7609_g76351 );
				float2 lerpResult7614_g76351 = lerp( Second_UVs_Tilling7609_g76351 , Second_UVs_Scale7610_g76351 , _SecondUVsScaleMode);
				half2 Second_UVs_Offset7605_g76351 = (_SecondUVs).zw;
				float2 vertexToFrag11_g76377 = ( ( ( temp_output_30_0_g76581 + temp_output_29_0_g76581 + temp_output_31_0_g76581 ) * lerpResult7614_g76351 ) + Second_UVs_Offset7605_g76351 );
				o.ase_texcoord3.xy = vertexToFrag11_g76377;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				o.ase_texcoord7.xyz = vertexToFrag3890_g76351;
				o.ase_texcoord8.xyz = vertexToFrag4224_g76351;
				o.ase_texcoord9.xyz = ase_worldPos;
				
				o.ase_texcoord2 = v.ase_texcoord;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;
				o.ase_texcoord9.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = Final_VertexPosition890_g76351;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				// Jittered. Match the frame.
				o.positionCS = vertexInput.positionCS;
				o.positionCSNoJitter = mul( _NonJitteredViewProjMatrix, mul( UNITY_MATRIX_M, v.positionOS ) );

				float4 prevPos = ( unity_MotionVectorsParams.x == 1 ) ? float4( v.positionOld, 1 ) : v.positionOS;

				#if _ADD_PRECOMPUTED_VELOCITY
					prevPos = prevPos - float4(v.alembicMotionVector, 0);
				#endif

				o.previousPositionCSNoJitter = mul( _PrevViewProjMatrix, mul( UNITY_PREV_MATRIX_M, prevPos ) );

				ApplyMotionVectorZBias( o.positionCS );
				return o;
			}

			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}

			half4 frag(	VertexOutput IN  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				float localCustomAlphaClip19_g76558 = ( 0.0 );
				half2 Main_UVs15_g76351 = ( ( IN.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g76351 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs15_g76351 );
				half Main_Alpha316_g76351 = tex2DNode29_g76351.a;
				float2 vertexToFrag11_g76377 = IN.ase_texcoord3.xy;
				half2 Second_UVs17_g76351 = vertexToFrag11_g76377;
				float4 tex2DNode89_g76351 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Second_UVs17_g76351 );
				half Second_Alpha5007_g76351 = tex2DNode89_g76351.a;
				float4 tex2DNode35_g76351 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				half Main_Mask57_g76351 = tex2DNode35_g76351.b;
				float4 tex2DNode33_g76351 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_Linear_Repeat, Second_UVs17_g76351 );
				half Second_Mask81_g76351 = tex2DNode33_g76351.b;
				float lerpResult6885_g76351 = lerp( Main_Mask57_g76351 , Second_Mask81_g76351 , _DetailMaskMode);
				float clampResult17_g76483 = clamp( lerpResult6885_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76482 = _DetailMaskMinValue;
				float temp_output_10_0_g76482 = ( _DetailMaskMaxValue - temp_output_7_0_g76482 );
				half Blend_Mask_Texture6794_g76351 = saturate( ( ( clampResult17_g76483 - temp_output_7_0_g76482 ) / ( temp_output_10_0_g76482 + 0.0001 ) ) );
				half Mesh_DetailMask90_g76351 = IN.ase_color.b;
				half4 Normal_Packed45_g76559 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_Linear_Repeat, Main_UVs15_g76351 );
				float2 appendResult58_g76559 = (float2(( (Normal_Packed45_g76559).x * (Normal_Packed45_g76559).w ) , (Normal_Packed45_g76559).y));
				half2 Normal_Default50_g76559 = appendResult58_g76559;
				half2 Normal_ASTC41_g76559 = (Normal_Packed45_g76559).xy;
				#ifdef UNITY_ASTC_NORMALMAP_ENCODING
				float2 staticSwitch38_g76559 = Normal_ASTC41_g76559;
				#else
				float2 staticSwitch38_g76559 = Normal_Default50_g76559;
				#endif
				half2 Normal_NO_DTX544_g76559 = (Normal_Packed45_g76559).wy;
				#ifdef UNITY_NO_DXT5nm
				float2 staticSwitch37_g76559 = Normal_NO_DTX544_g76559;
				#else
				float2 staticSwitch37_g76559 = staticSwitch38_g76559;
				#endif
				float2 temp_output_6555_0_g76351 = ( (staticSwitch37_g76559*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult7388_g76351 = (float3(temp_output_6555_0_g76351 , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal7389_g76351 = appendResult7388_g76351;
				float3 worldNormal7389_g76351 = float3(dot(tanToWorld0,tanNormal7389_g76351), dot(tanToWorld1,tanNormal7389_g76351), dot(tanToWorld2,tanNormal7389_g76351));
				half3 Main_NormalWS7390_g76351 = worldNormal7389_g76351;
				float lerpResult6884_g76351 = lerp( Mesh_DetailMask90_g76351 , ((Main_NormalWS7390_g76351).y*0.5 + 0.5) , _DetailMeshMode);
				float clampResult17_g76481 = clamp( lerpResult6884_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76480 = _DetailMeshMinValue;
				float temp_output_10_0_g76480 = ( _DetailMeshMaxValue - temp_output_7_0_g76480 );
				half Blend_Mask_Mesh1540_g76351 = saturate( ( ( clampResult17_g76481 - temp_output_7_0_g76480 ) / ( temp_output_10_0_g76480 + 0.0001 ) ) );
				float clampResult17_g76504 = clamp( ( Blend_Mask_Texture6794_g76351 * Blend_Mask_Mesh1540_g76351 ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g76552 = _DetailBlendMinValue;
				float temp_output_10_0_g76552 = ( _DetailBlendMaxValue - temp_output_7_0_g76552 );
				half Blend_Mask147_g76351 = ( saturate( ( ( clampResult17_g76504 - temp_output_7_0_g76552 ) / ( temp_output_10_0_g76552 + 0.0001 ) ) ) * _DetailMode * _DetailValue );
				float lerpResult6153_g76351 = lerp( Main_Alpha316_g76351 , Second_Alpha5007_g76351 , Blend_Mask147_g76351);
				float lerpResult6785_g76351 = lerp( ( Main_Alpha316_g76351 * Second_Alpha5007_g76351 ) , lerpResult6153_g76351 , _DetailAlphaMode);
				#ifdef TVE_DETAIL
				float staticSwitch6158_g76351 = lerpResult6785_g76351;
				#else
				float staticSwitch6158_g76351 = Main_Alpha316_g76351;
				#endif
				half Blend_Alpha6157_g76351 = staticSwitch6158_g76351;
				half AlphaTreshold2132_g76351 = _AlphaClipValue;
				float temp_output_84_0_g76367 = _LayerExtrasValue;
				float temp_output_19_0_g76371 = TVE_ExtrasUsage[(int)temp_output_84_0_g76367];
				float4 temp_output_93_19_g76367 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g76351 = IN.ase_texcoord7.xyz;
				float3 WorldPosition3905_g76351 = vertexToFrag3890_g76351;
				float3 vertexToFrag4224_g76351 = IN.ase_texcoord8.xyz;
				float3 ObjectPosition4223_g76351 = vertexToFrag4224_g76351;
				float3 lerpResult4827_g76351 = lerp( WorldPosition3905_g76351 , ObjectPosition4223_g76351 , _ExtrasPositionMode);
				half2 UV96_g76367 = ( (temp_output_93_19_g76367).zw + ( (temp_output_93_19_g76367).xy * (lerpResult4827_g76351).xz ) );
				float4 tex2DArrayNode48_g76367 = SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_Linear_Clamp, UV96_g76367,temp_output_84_0_g76367, 0.0 );
				float4 temp_output_17_0_g76371 = tex2DArrayNode48_g76367;
				float4 temp_output_94_85_g76367 = TVE_ExtrasParams;
				float4 temp_output_3_0_g76371 = temp_output_94_85_g76367;
				float4 ifLocalVar18_g76371 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g76371 >= 0.5 )
				ifLocalVar18_g76371 = temp_output_17_0_g76371;
				else
				ifLocalVar18_g76371 = temp_output_3_0_g76371;
				float4 lerpResult22_g76371 = lerp( temp_output_3_0_g76371 , temp_output_17_0_g76371 , temp_output_19_0_g76371);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g76371 = lerpResult22_g76371;
				#else
				float4 staticSwitch24_g76371 = ifLocalVar18_g76371;
				#endif
				half4 Global_Extras_Params5440_g76351 = staticSwitch24_g76371;
				float4 break456_g76381 = Global_Extras_Params5440_g76351;
				half Global_Extras_Alpha1033_g76351 = saturate( break456_g76381.w );
				float3 ObjectPosition_Shifted7481_g76351 = ( ObjectPosition4223_g76351 - TVE_WorldOrigin );
				half3 Input_Position167_g76587 = ObjectPosition_Shifted7481_g76351;
				float dotResult156_g76587 = dot( (Input_Position167_g76587).xz , float2( 12.9898,78.233 ) );
				half Vertex_DynamicMode5112_g76351 = _VertexDynamicMode;
				half Input_DynamicMode120_g76587 = Vertex_DynamicMode5112_g76351;
				float Postion_Random162_g76587 = ( sin( dotResult156_g76587 ) * ( 1.0 - Input_DynamicMode120_g76587 ) );
				float Mesh_Variation16_g76351 = IN.ase_color.r;
				half Input_Variation124_g76587 = Mesh_Variation16_g76351;
				half ObjectData20_g76589 = frac( ( Postion_Random162_g76587 + Input_Variation124_g76587 ) );
				half WorldData19_g76589 = Input_Variation124_g76587;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76589 = WorldData19_g76589;
				#else
				float staticSwitch14_g76589 = ObjectData20_g76589;
				#endif
				float temp_output_112_0_g76587 = staticSwitch14_g76589;
				float clampResult171_g76587 = clamp( temp_output_112_0_g76587 , 0.01 , 0.99 );
				float Global_MeshVariation5104_g76351 = clampResult171_g76587;
				float lerpResult5154_g76351 = lerp( 0.0 , Global_MeshVariation5104_g76351 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g76351 = lerpResult5154_g76351;
				float Emissive_Alpha7625_g76351 = 0.0;
				float lerpResult6866_g76351 = lerp( ( 1.0 - Blend_Mask147_g76351 ) , 1.0 , _DetailFadeMode);
				#ifdef TVE_DETAIL
				float staticSwitch6612_g76351 = lerpResult6866_g76351;
				#else
				float staticSwitch6612_g76351 = 1.0;
				#endif
				half Blend_Mask_Invert6260_g76351 = staticSwitch6612_g76351;
				half Alpha_Mask6234_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5203_g76351 = lerp( 1.0 , saturate( ( ( Global_Extras_Alpha1033_g76351 - saturate( ( Global_Alpha_Variation5158_g76351 + Emissive_Alpha7625_g76351 ) ) ) + ( Global_Extras_Alpha1033_g76351 * 0.1 ) ) ) , ( Alpha_Mask6234_g76351 * _GlobalAlpha ));
				float lerpResult16_g76395 = lerp( 1.0 , lerpResult5203_g76351 , TVE_IsEnabled);
				half Global_Alpha315_g76351 = lerpResult16_g76395;
				float3 ase_worldPos = IN.ase_texcoord9.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g76351 = normalize( ase_worldViewDir );
				float3 ViewDirection3963_g76351 = normalizeResult2169_g76351;
				float3 normalizeResult3971_g76351 = normalize( cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) ) );
				float3 WorldNormal_Derivates3972_g76351 = normalizeResult3971_g76351;
				float dotResult3851_g76351 = dot( ViewDirection3963_g76351 , WorldNormal_Derivates3972_g76351 );
				float lerpResult3993_g76351 = lerp( 1.0 , saturate( ( abs( dotResult3851_g76351 ) * 3.0 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g76351 = lerpResult3993_g76351;
				half Fade_Effects_A5360_g76351 = Fade_Glancing3853_g76351;
				float temp_output_7_0_g76404 = TVE_CameraFadeMin;
				float temp_output_10_0_g76404 = ( TVE_CameraFadeMax - temp_output_7_0_g76404 );
				float lerpResult4755_g76351 = lerp( 1.0 , saturate( saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g76404 ) / ( temp_output_10_0_g76404 + 0.0001 ) ) ) ) , _FadeCameraValue);
				half Fade_Camera3743_g76351 = lerpResult4755_g76351;
				half Fade_Effects_B6228_g76351 = ( Fade_Effects_A5360_g76351 * Fade_Camera3743_g76351 );
				half Fade_Mask5149_g76351 = ( 1.0 * Blend_Mask_Invert6260_g76351 );
				float lerpResult5141_g76351 = lerp( 1.0 , ( Fade_Effects_B6228_g76351 * ( 1.0 - _FadeConstantValue ) ) , Fade_Mask5149_g76351);
				half Fade_Effects_C7653_g76351 = lerpResult5141_g76351;
				float temp_output_5865_0_g76351 = saturate( ( Fade_Effects_C7653_g76351 - SAMPLE_TEXTURE3D( TVE_NoiseTex3D, sampler_Linear_Repeat, ( TVE_NoiseTex3DTilling * WorldPosition3905_g76351 ) ).r ) );
				half Fade_Alpha3727_g76351 = temp_output_5865_0_g76351;
				half Final_Alpha7344_g76351 = min( ( ( Blend_Alpha6157_g76351 - AlphaTreshold2132_g76351 ) * Global_Alpha315_g76351 ) , Fade_Alpha3727_g76351 );
				float temp_output_3_0_g76558 = Final_Alpha7344_g76351;
				float Alpha19_g76558 = temp_output_3_0_g76558;
				float temp_output_15_0_g76558 = 0.01;
				float Treshold19_g76558 = temp_output_15_0_g76558;
				{
				#if defined (TVE_ALPHA_CLIP) || defined (TVE_ALPHA_FADE) || defined (TVE_ALPHA_GLOBAL)
				#if defined (TVE_IS_HD_PIPELINE)
				#if !defined(SHADERPASS_FORWARD_BYPASS_ALPHA_TEST) && !defined(SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST)
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#else
				clip(Alpha19_g76558 - Treshold19_g76558);
				#endif
				#endif
				}
				float clampResult17_g76560 = clamp( Main_Mask57_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76561 = _MainMaskMinValue;
				float temp_output_10_0_g76561 = ( _MainMaskMaxValue - temp_output_7_0_g76561 );
				half Main_Mask_Remap5765_g76351 = saturate( ( ( clampResult17_g76560 - temp_output_7_0_g76561 ) / ( temp_output_10_0_g76561 + 0.0001 ) ) );
				float lerpResult7671_g76351 = lerp( 1.0 , Main_Mask_Remap5765_g76351 , _MainColorMode);
				float4 lerpResult7654_g76351 = lerp( _MainColorTwo , _MainColor , lerpResult7671_g76351);
				half Main_Color_Alpha6121_g76351 = (lerpResult7654_g76351).a;
				float clampResult17_g76563 = clamp( Second_Mask81_g76351 , 0.0001 , 0.9999 );
				float temp_output_7_0_g76564 = _SecondMaskMinValue;
				float temp_output_10_0_g76564 = ( _SecondMaskMaxValue - temp_output_7_0_g76564 );
				half Second_Mask_Remap6130_g76351 = saturate( ( ( clampResult17_g76563 - temp_output_7_0_g76564 ) / ( temp_output_10_0_g76564 + 0.0001 ) ) );
				float lerpResult7672_g76351 = lerp( 1.0 , Second_Mask_Remap6130_g76351 , _SecondColorMode);
				float4 lerpResult7662_g76351 = lerp( _SecondColorTwo , _SecondColor , lerpResult7672_g76351);
				half Second_Color_Alpha6152_g76351 = (lerpResult7662_g76351).a;
				float lerpResult6168_g76351 = lerp( Main_Color_Alpha6121_g76351 , Second_Color_Alpha6152_g76351 , Blend_Mask147_g76351);
				#ifdef TVE_DETAIL
				float staticSwitch6174_g76351 = lerpResult6168_g76351;
				#else
				float staticSwitch6174_g76351 = Main_Color_Alpha6121_g76351;
				#endif
				half Blend_Color_Alpha6167_g76351 = staticSwitch6174_g76351;
				half Final_Clip914_g76351 = saturate( ( Alpha19_g76558 * Blend_Color_Alpha6167_g76351 ) );
				

				float Alpha = Final_Clip914_g76351;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				return float4( CalcNdcMotionVectorFromCsPositions( IN.positionCSNoJitter, IN.previousPositionCSNoJitter ), 0, 0 );
			}
		    
			ENDHLSL
		}
		
	}
	
	CustomEditor "TVEShaderCoreGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback"
}
/*ASEBEGIN
Version=19303
Node;AmplifyShaderEditor.RangedFloatNode;10;-2176,-768;Half;False;Property;_render_cull;_render_cull;248;1;[HideInInspector];Create;True;0;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1984,-768;Half;False;Property;_render_src;_render_src;249;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1600,-768;Half;False;Property;_render_zw;_render_zw;251;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1792,-768;Half;False;Property;_render_dst;_render_dst;250;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;658;-1408,-768;Half;False;Property;_render_coverage;_render_coverage;252;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;652;-1088,512;Inherit;False;Compile All Shaders;-1;;76346;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;653;-1280,512;Inherit;False;Compile Core;-1;;76347;634b02fd1f32e6a4c875d8fc2c450956;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;651;-2176,512;Inherit;False;Define Pipeline Universal;-1;;76348;71dc7add32e5f6247b1fb74ecceddd3e;0;0;1;FLOAT;529
Node;AmplifyShaderEditor.FunctionNode;659;-1920,512;Inherit;False;Define Lighting Standard;253;;76349;116a5c57ec750cb4896f729a6748c509;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;610;-1664,512;Inherit;False;Define ShaderType Plant;255;;76350;b458122dd75182d488380bd0f592b9e6;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;635;-2176,-384;Inherit;False;Base Shader Core;0;;76351;856f7164d1c579d43a5cf4968a75ca43;98,7343,0,3880,1,4028,1,3900,1,3908,1,4172,1,7691,1,7692,1,4179,1,6791,1,1298,1,1300,1,6792,1,3586,0,4499,1,1708,1,6056,1,3509,1,3873,1,893,1,6230,0,5156,1,5345,0,1717,1,1718,1,7566,1,6116,1,5075,1,1714,1,1715,1,6076,1,6068,1,6592,1,6692,0,6729,1,1776,1,6352,1,6378,1,3475,1,6655,1,4210,1,1745,1,3479,0,1646,1,3501,1,2807,1,6206,1,7565,1,4999,0,6194,0,3887,0,7321,0,7332,0,3957,1,6647,0,6257,0,5357,0,2172,1,3883,0,7650,0,3728,1,5350,0,2658,1,7617,0,1742,1,3484,0,6166,1,6161,1,1736,1,4837,1,1734,1,6848,1,6320,1,1737,1,6622,1,1735,1,7429,0,7624,0,860,1,6721,1,2261,1,2260,1,2054,1,2032,1,5258,1,2039,1,2062,1,7548,1,7550,1,3243,1,5220,1,4217,1,6699,1,5339,0,7689,1,7492,0,5090,1,4242,1;10;7333;FLOAT3;1,1,1;False;6196;FLOAT;1;False;6693;FLOAT;1;False;6201;FLOAT;1;False;6205;FLOAT;1;False;7652;FLOAT;1;False;5143;FLOAT;1;False;6231;FLOAT;1;False;6198;FLOAT;1;False;5340;FLOAT3;0,0,0;False;23;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;531;FLOAT;4842;FLOAT;529;FLOAT;3678;FLOAT;530;FLOAT;4122;FLOAT;4134;FLOAT;1235;FLOAT;532;FLOAT;5389;FLOAT;721;FLOAT3;1230;FLOAT;5296;FLOAT;1461;FLOAT;1290;FLOAT;629;FLOAT3;534;FLOAT;4867;FLOAT4;5246;FLOAT4;4841
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;647;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;0;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;646;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;0;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;648;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;0;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;True;1;1;True;_render_src;0;True;_render_dst;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;0;False;;True;False;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;657;-1376,-304;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;2;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;645;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;0;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;655;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;0;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;True;1;1;True;_render_src;0;True;_render_dst;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;0;False;;True;False;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;656;-1376,-304;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;2;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;643;-1376,-384;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;0;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;654;-1376,-47;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;0;True;11;d3d11;glcore;gles;gles3;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;644;-1152,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;15;BOXOPHOBIC/The Vegetation Engine/Geometry/Plant Standard Lit;28cd5599e02859647ae1798e4fcaef6c;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_render_coverage;True;True;2;True;_render_cull;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;True;True;1;True;_render_zw;True;0;False;;True;False;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;True;True;1;1;True;_render_src;0;True;_render_dst;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;True;True;1;False;;True;0;False;;True;False;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback;0;0;Standard;42;Workflow;0;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;0;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,True,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;Receive Shadows;1;0;  Use Shadow Threshold;0;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;0;0;Debug Display;0;0;Clear Coat;0;0;0;11;False;True;True;True;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;660;-1152,-284;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;MotionVectors;0;10;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1279.392;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;408;-2176,384;Inherit;False;1278.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-896;Inherit;False;1280.392;100;Internal;0;;1,0.252,0,1;0;0
WireConnection;644;0;635;0
WireConnection;644;1;635;528
WireConnection;644;2;635;2489
WireConnection;644;9;635;3678
WireConnection;644;4;635;530
WireConnection;644;5;635;531
WireConnection;644;6;635;532
WireConnection;644;8;635;534
ASEEND*/
//CHKSM=42C1B3F9332C847CD67F977B916762061C48BAB6