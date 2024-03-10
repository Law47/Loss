#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void skin_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, out float3 Color, out float Metallic, out float Roughness, out float3 Normal)
{
	
	float _SimpleNoiseTexture_551706_fac; float4 _SimpleNoiseTexture_551706_col; node_simple_noise_texture_full(_POS, 0, 3.8, 15, 0.3533334, 2, 1, _SimpleNoiseTexture_551706_fac, _SimpleNoiseTexture_551706_col);
	float4 _MixRGB_552148 = mix_blend(_SimpleNoiseTexture_551706_fac, float4(0.496933, 0.003676507, 0, 1), float4(0.48515, 0.496933, 0.3762622, 1));

	Color = _MixRGB_552148;
	Metallic = 0;
	Roughness = 0.5;
	Normal = float3(0.0, 0.0, 0.0);
}