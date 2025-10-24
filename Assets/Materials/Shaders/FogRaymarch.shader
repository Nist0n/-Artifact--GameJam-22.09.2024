Shader "Custom/FogRaymarch"
{
	Properties
	{
		_FogColor ("Fog Color", Color) = (0.3, 0.3, 0.4, 1)
		_Density  ("Base Density", Range(0, 5)) = 0.8
		_HeightFalloff ("Height Falloff", Range(0, 5)) = 0.0
		_HeightRef ("Height Reference", Float) = 0.0
		_MaxDistance ("Max Ray Distance", Float) = 150.0
		_Steps ("Raymarch Steps", Range(8, 128)) = 48
		_Softness ("Reveal Softness", Range(0, 10)) = 2.0
		_RevealCount ("Reveal Count", Float) = 0
		
		// Shadow parameters for static objects
		_ShadowIntensity ("Shadow Intensity", Range(0, 2)) = 1.0
		_ShadowRadius ("Shadow Radius", Range(0, 50)) = 15.0
		_ShadowSoftness ("Shadow Softness", Range(0, 20)) = 5.0

		_RevealTower0 ("RevealTower0", Vector) = (0,0,0,0)
		_RevealTower1 ("RevealTower1", Vector) = (0,0,0,0)
		_RevealTower2 ("RevealTower2", Vector) = (0,0,0,0)
		_RevealTower3 ("RevealTower3", Vector) = (0,0,0,0)
		_RevealTower4 ("RevealTower4", Vector) = (0,0,0,0)
		_RevealTower5 ("RevealTower5", Vector) = (0,0,0,0)
		_RevealTower6 ("RevealTower6", Vector) = (0,0,0,0)
		_RevealTower7 ("RevealTower7", Vector) = (0,0,0,0)
		
		// Static object shadow positions
		_StaticObject0 ("StaticObject0", Vector) = (0,0,0,0)
		_StaticObject1 ("StaticObject1", Vector) = (0,0,0,0)
		_StaticObject2 ("StaticObject2", Vector) = (0,0,0,0)
		_StaticObject3 ("StaticObject3", Vector) = (0,0,0,0)
		_StaticObject4 ("StaticObject4", Vector) = (0,0,0,0)
		_StaticObject5 ("StaticObject5", Vector) = (0,0,0,0)
		_StaticObject6 ("StaticObject6", Vector) = (0,0,0,0)
		_StaticObject7 ("StaticObject7", Vector) = (0,0,0,0)
	}

	SubShader
	{
		Tags { "RenderType" = "Transparent" "Queue" = "Transparent" }
		Blend SrcAlpha OneMinusSrcAlpha
		ZWrite Off
		Cull Back

		Pass
		{
			HLSLPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.5
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

			CBUFFER_START(UnityPerMaterial)
			float4 _FogColor;
			float  _Density;
			float  _HeightFalloff;
			float  _HeightRef;
			float  _MaxDistance;
			float  _Steps;
			float  _Softness;
			float  _RevealCount;
			
			// Shadow parameters
			float  _ShadowIntensity;
			float  _ShadowRadius;
			float  _ShadowSoftness;
			
			float4 _RevealTower0;
			float4 _RevealTower1;
			float4 _RevealTower2;
			float4 _RevealTower3;
			float4 _RevealTower4;
			float4 _RevealTower5;
			float4 _RevealTower6;
			float4 _RevealTower7;
			
			// Static object positions
			float4 _StaticObject0;
			float4 _StaticObject1;
			float4 _StaticObject2;
			float4 _StaticObject3;
			float4 _StaticObject4;
			float4 _StaticObject5;
			float4 _StaticObject6;
			float4 _StaticObject7;
			CBUFFER_END

			struct Attributes
			{
				float4 positionOS : POSITION;
			};

			struct Varyings
			{
				float4 positionHCS : SV_POSITION;
				float3 positionWS  : TEXCOORD0;
			};

			Varyings vert(Attributes v)
			{
				Varyings o;
				o.positionWS  = TransformObjectToWorld(v.positionOS.xyz);
				o.positionHCS = TransformWorldToHClip(o.positionWS);
				return o;
			}

			// Ray-box intersection in object space. Our box is unit cube [-0.5, 0.5].
			bool IntersectBox(float3 ro, float3 rd, out float t0, out float t1)
			{
				float3 inv = 1.0 / rd;
				float3 tmin = (-0.5 - ro) * inv;
				float3 tmax = ( 0.5 - ro) * inv;
				float3 t1v = min(tmin, tmax);
				float3 t2v = max(tmin, tmax);
				t0 = max(max(t1v.x, t1v.y), t1v.z);
				t1 = min(min(t2v.x, t2v.y), t2v.z);
				return t1 > max(t0, 0.0);
			}

			float RevealWeight(float idx, float count)
			{
				return step(idx + 0.5, count);
			}

			float CircleMask(float3 worldPos, float4 tower, float softness)
			{
				float r = tower.w;
				float d = distance(worldPos, tower.xyz);
				return 1.0 - smoothstep(max(r - softness, 0.0), r, d);
			}

			float RevealMask(float3 worldPos)
			{
				float s = max(_Softness, 1e-5);
				float c = _RevealCount;
				float m = 0.0;
				m = max(m, CircleMask(worldPos, _RevealTower0, s) * RevealWeight(0, c));
				m = max(m, CircleMask(worldPos, _RevealTower1, s) * RevealWeight(1, c));
				m = max(m, CircleMask(worldPos, _RevealTower2, s) * RevealWeight(2, c));
				m = max(m, CircleMask(worldPos, _RevealTower3, s) * RevealWeight(3, c));
				m = max(m, CircleMask(worldPos, _RevealTower4, s) * RevealWeight(4, c));
				m = max(m, CircleMask(worldPos, _RevealTower5, s) * RevealWeight(5, c));
				m = max(m, CircleMask(worldPos, _RevealTower6, s) * RevealWeight(6, c));
				m = max(m, CircleMask(worldPos, _RevealTower7, s) * RevealWeight(7, c));
				return saturate(m);
			}

			float HeightAtten(float3 worldPos)
			{
				return exp(-_HeightFalloff * max(worldPos.y - _HeightRef, 0.0));
			}

			float StaticObjectShadow(float3 worldPos)
			{
				float shadow = 0.0;
				float s = max(_ShadowSoftness, 1e-5);
				float r = _ShadowRadius;
				
				// Check all static objects for shadow contribution
				float d0 = distance(worldPos, _StaticObject0.xyz);
				if (_StaticObject0.w > 0) shadow = max(shadow, 1.0 - smoothstep(max(r - s, 0.0), r, d0));
				
				float d1 = distance(worldPos, _StaticObject1.xyz);
				if (_StaticObject1.w > 0) shadow = max(shadow, 1.0 - smoothstep(max(r - s, 0.0), r, d1));
				
				float d2 = distance(worldPos, _StaticObject2.xyz);
				if (_StaticObject2.w > 0) shadow = max(shadow, 1.0 - smoothstep(max(r - s, 0.0), r, d2));
				
				float d3 = distance(worldPos, _StaticObject3.xyz);
				if (_StaticObject3.w > 0) shadow = max(shadow, 1.0 - smoothstep(max(r - s, 0.0), r, d3));
				
				float d4 = distance(worldPos, _StaticObject4.xyz);
				if (_StaticObject4.w > 0) shadow = max(shadow, 1.0 - smoothstep(max(r - s, 0.0), r, d4));
				
				float d5 = distance(worldPos, _StaticObject5.xyz);
				if (_StaticObject5.w > 0) shadow = max(shadow, 1.0 - smoothstep(max(r - s, 0.0), r, d5));
				
				float d6 = distance(worldPos, _StaticObject6.xyz);
				if (_StaticObject6.w > 0) shadow = max(shadow, 1.0 - smoothstep(max(r - s, 0.0), r, d6));
				
				float d7 = distance(worldPos, _StaticObject7.xyz);
				if (_StaticObject7.w > 0) shadow = max(shadow, 1.0 - smoothstep(max(r - s, 0.0), r, d7));
				
				return saturate(shadow * _ShadowIntensity);
			}

			float4 frag(Varyings i) : SV_Target
			{
				// Build view ray in world space
				float3 roWS = _WorldSpaceCameraPos;
				float3 rdWS = normalize(i.positionWS - _WorldSpaceCameraPos);

				// Transform ray to object space of the fog volume (unit cube centered at origin)
				float3 roOS = TransformWorldToObject(roWS);
				float3 rdOS = normalize(mul((float3x3)UNITY_MATRIX_I_M, rdWS));

				float tEnter, tExit;
				if (!IntersectBox(roOS, rdOS, tEnter, tExit))
				{
					return float4(0,0,0,0);
				}

				// Clamp marching distance
				float t0 = max(tEnter, 0.0);
				float t1 = min(tExit, _MaxDistance);
				if (t1 <= t0) return float4(0,0,0,0);

				int   steps = (int)round(_Steps);
				steps = clamp(steps, 1, 256);
				float dt = (t1 - t0) / steps;

				float3 startOS = roOS + rdOS * t0;
				float3 stepOS  = rdOS * dt;

				float3 posOS = startOS;

				float3 col = 0;
				float transmittance = 1.0;
				float sigma = _Density;

				[loop] for (int sIdx = 0; sIdx < steps; sIdx++)
				{
					float3 posWS = TransformObjectToWorld(posOS);
					float mask = RevealMask(posWS);
					float shadow = StaticObjectShadow(posWS);
					
					// Apply shadow to increase density around static objects
					float shadowMultiplier = 1.0 + shadow;
					float density = sigma * HeightAtten(posWS) * (1.0 - mask) * shadowMultiplier;

					float absorb = exp(-density * dt);
					float contrib = 1.0 - absorb; // simple isotropic scattering approximation
					
					// Darken fog color in shadowed areas
					float3 fogColor = lerp(_FogColor.rgb, _FogColor.rgb * 0.3, shadow);
					col += fogColor * contrib * transmittance;
					transmittance *= absorb;

					if (transmittance < 0.01) break;
					posOS += stepOS;
				}

				float alpha = saturate(1.0 - transmittance) * _FogColor.a;
				return float4(col, alpha);
			}
			ENDHLSL
		}
	}
}


