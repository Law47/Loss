#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void Metall_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_13458, Texture2D gradient_13462, out float4 Specular, out float3 Normal, out float Smoothness, out float Metallic, out float AmbientOcculusion, out float4 Color, out float4 Emission)
{
	
	float4 _Mapping_13454 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 2.7, 1)), 0);
	float _SimpleNoiseTexture_13460_fac; float4 _SimpleNoiseTexture_13460_col; node_simple_noise_texture_full(_Mapping_13454, 0, 9.299999, 2, 0.5, 2, 1, _SimpleNoiseTexture_13460_fac, _SimpleNoiseTexture_13460_col);
	float4 _ColorRamp_13462 = color_ramp(gradient_13462, _SimpleNoiseTexture_13460_fac);
	float _Clamp_13466 = clamp_minmax(_ColorRamp_13462, 0, 1);
	float4 _ColorRamp_13458 = color_ramp(gradient_13458, _SimpleNoiseTexture_13460_fac);
	float _Clamp_803204 = clamp_minmax(_ColorRamp_13458, 0, 1);

	Specular = float4(0.0, 0.0, 0.0, 0.0);
	Normal = float3(0.0, 0.0, 0.0);
	Smoothness = _Clamp_13466;
	Metallic = _Clamp_803204;
	AmbientOcculusion = 0.0;
	Color = _ColorRamp_13458;
	Emission = float4(0.0, 0.0, 0.0, 0.0);
}