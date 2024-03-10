#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void ceiling_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_1220434, Texture2D gradient_1220574, Texture2D gradient_1220714, Texture2D gradient_1471206, out float3 Color, out float Metallic, out float Roughness, out float3 Normal)
{
	
	float4 _Mapping_1220514 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 1, 1)), 0);
	float _SimpleNoiseTexture_1220554_fac; float4 _SimpleNoiseTexture_1220554_col; node_simple_noise_texture_full(_Mapping_1220514, 0, 156.8, 2, 0.5, 2, 1, _SimpleNoiseTexture_1220554_fac, _SimpleNoiseTexture_1220554_col);
	float4 _ColorRamp_1220714 = color_ramp(gradient_1220714, _SimpleNoiseTexture_1220554_fac);
	float4 _ColorRamp_1471206 = color_ramp(gradient_1471206, _ColorRamp_1220714);
	float4 _Mapping_1220214 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 1, 1)), 0);
	float _SeparateXYZ_1220234_x = separate_x(_Mapping_1220214);
	float _Math_1220294 = math_multiply(_SeparateXYZ_1220234_x, 16, 0.5);
	float _Math_1220314 = math_modulo(_Math_1220294, 1, 0.5);
	float _Math_1220354 = math_greater_than(_Math_1220314, 0.01, 0.5);
	float _SeparateXYZ_1220274_y = separate_y(_Mapping_1220214);
	float _Math_1220254 = math_multiply(_SeparateXYZ_1220274_y, 16, 0.5);
	float _Math_1220334 = math_modulo(_Math_1220254, 1, 0.5);
	float _Math_1220374 = math_greater_than(_Math_1220334, 0.01, 0.5);
	float _Math_1220594 = math_multiply(_Math_1220354, _Math_1220374, 0.5);
	float4 _ColorRamp_1220434 = color_ramp(gradient_1220434, _Math_1220594);
	float4 _Mapping_1220454 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 1, 1)), 0);
	float _SimpleNoiseTexture_1220494_fac; float4 _SimpleNoiseTexture_1220494_col; node_simple_noise_texture_full(_Mapping_1220454, 0, 4.8, 2, 0.5, 2, 1, _SimpleNoiseTexture_1220494_fac, _SimpleNoiseTexture_1220494_col);
	float4 _ColorRamp_1220574 = color_ramp(gradient_1220574, _SimpleNoiseTexture_1220494_fac);
	float4 _MixRGB_1340060 = mix_blend(_ColorRamp_1220434, float4(0.001214108, 0.001214108, 0.001214108, 1), _ColorRamp_1220574);
	float4 _MixRGB_1355982 = mix_blend(_ColorRamp_1471206, float4(0.001214108, 0.001214108, 0.001214108, 1), _MixRGB_1340060);
	float4 _Invert_1220654 = node_invert(1, _ColorRamp_1220434);
	float _Clamp_1753876 = clamp_minmax(_Invert_1220654, 0, 1);
	float _Math_1220614 = math_multiply(_Math_1220594, _ColorRamp_1220714, 0.5);
	float4 _Bump_1220754; node_bump(_POS, 1, 0.1, 1, _Math_1220614, _NTS, _Bump_1220754);

	Color = _MixRGB_1355982;
	Metallic = 0;
	Roughness = _Clamp_1753876;
	Normal = _Bump_1220754;
}