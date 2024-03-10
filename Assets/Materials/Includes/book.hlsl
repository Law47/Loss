#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void book_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_2032528, out float3 Color, out float Metallic, out float Roughness, out float3 Normall)
{
	
	float4 _Mapping_2032480 = float4(mapping_point(float4(_NOS, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 1, 101.7)), 0);
	float _SimpleNoiseTexture_2032448_fac; float4 _SimpleNoiseTexture_2032448_col; node_simple_noise_texture_full(_Mapping_2032480, 0, 5, 2, 0.5, 2, 1, _SimpleNoiseTexture_2032448_fac, _SimpleNoiseTexture_2032448_col);
	float4 _Mapping_2032416 = float4(mapping_point(float4(_NOS, 0), float3(0, 0, 0), float3(0, 0, 0), float3(104.6, 142.7, 1)), 0);
	float _SimpleNoiseTexture_2032464_fac; float4 _SimpleNoiseTexture_2032464_col; node_simple_noise_texture_full(_Mapping_2032416, 0, 5, 2, 0.5, 2, 1, _SimpleNoiseTexture_2032464_fac, _SimpleNoiseTexture_2032464_col);
	float _Math_2032496 = math_multiply(_SimpleNoiseTexture_2032448_fac, _SimpleNoiseTexture_2032464_fac, 0.5);
	float4 _ColorRamp_2032528 = color_ramp(gradient_2032528, _Math_2032496);

	Color = _ColorRamp_2032528;
	Metallic = 0;
	Roughness = 0.5;
	Normall = float3(0.0, 0.0, 0.0);
}