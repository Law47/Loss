#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void Metal2_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_573520, Texture2D gradient_573536, out float3 Color, out float Roughness, out float Metallic)
{
	
	float4 _Mapping_573456 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 2.7, 1)), 0);
	float _SimpleNoiseTexture_573488_fac; float4 _SimpleNoiseTexture_573488_col; node_simple_noise_texture_full(_Mapping_573456, 0, 9.299999, 2, 0.5, 2, 1, _SimpleNoiseTexture_573488_fac, _SimpleNoiseTexture_573488_col);
	float4 _ColorRamp_573536 = color_ramp(gradient_573536, _SimpleNoiseTexture_573488_fac);
	float4 _ColorRamp_573520 = color_ramp(gradient_573520, _SimpleNoiseTexture_573488_fac);
	float _Clamp_643130 = clamp_minmax(_ColorRamp_573520, 0, 1);
	float _Clamp_652302 = clamp_minmax(_ColorRamp_573536, 0, 1);

	Color = _ColorRamp_573536;
	Roughness = _Clamp_643130;
	Metallic = _Clamp_652302;
}