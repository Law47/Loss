#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void Bed_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_2305980, Texture2D gradient_2306300, out float4 Color, out float3 Normal, out float Roughness)
{
	
	float4 _Mapping_2306240 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 1, 1)), 0);
	float _SimpleNoiseTexture_2306260_fac; float4 _SimpleNoiseTexture_2306260_col; node_simple_noise_texture_full(_Mapping_2306240, 20.9, 6, 0, 0, 2, 2, _SimpleNoiseTexture_2306260_fac, _SimpleNoiseTexture_2306260_col);
	float4 _ColorRamp_2306300 = color_ramp(gradient_2306300, _SimpleNoiseTexture_2306260_fac);
	float4 _Mapping_2305920 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 5.069999, 1)), 0);
	float _SimpleNoiseTexture_2305960_fac; float4 _SimpleNoiseTexture_2305960_col; node_simple_noise_texture_full(_Mapping_2305920, 0, 0.6799915, 2.800001, 1, 2, 1, _SimpleNoiseTexture_2305960_fac, _SimpleNoiseTexture_2305960_col);
	float4 _ColorRamp_2305980 = color_ramp(gradient_2305980, _SimpleNoiseTexture_2305960_fac);
	float4 _Bump_2306160; node_bump(_POS, 1, 0.1266666, 1, _ColorRamp_2305980, _NTS, _Bump_2306160);
	float4 _Mapping_2306020 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 1, 1)), 0);
	float _SimpleNoiseTexture_2306060_fac; float4 _SimpleNoiseTexture_2306060_col; node_simple_noise_texture_full(_Mapping_2306020, 0, 693.2, 7.400001, 0.7733333, 2, 1, _SimpleNoiseTexture_2306060_fac, _SimpleNoiseTexture_2306060_col);
	float4 _Bump_2306000; node_bump(_POS, 1, 0.1580013, 1, _SimpleNoiseTexture_2306060_fac, _NTS, _Bump_2306000);
	float4 _VectorMath_2306120 = float4(vector_math_add(_Bump_2306160, _Bump_2306000, float3(0, 0, 0), 1), 1);
	float4 _Mapping_2306180 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 1, 1)), 0);
	float _SimpleNoiseTexture_2306100_fac; float4 _SimpleNoiseTexture_2306100_col; node_simple_noise_texture_full(_Mapping_2306180, 0, 254.6, 15, 1, 2, 1, _SimpleNoiseTexture_2306100_fac, _SimpleNoiseTexture_2306100_col);
	float4 _Bump_2306080; node_bump(_POS, 1, 0.006666645, 1, _SimpleNoiseTexture_2306100_fac, _NTS, _Bump_2306080);
	float4 _VectorMath_2306140 = float4(vector_math_add(_VectorMath_2306120, _Bump_2306080, float3(0, 0, 0), 1), 1);

	Color = _ColorRamp_2306300;
	Normal = _VectorMath_2306140;
	Roughness = 0.302;
}