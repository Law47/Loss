#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void floor_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_1782024, Texture2D gradient_1782044, out float3 Color, out float Metallic, out float Roughness, out float3 Normall)
{
	
	float4 _Mapping_1781704 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 1, 1)), 0);
	float _SeparateXYZ_1781724_x = separate_x(_Mapping_1781704);
	float _Math_1781784 = math_multiply(_SeparateXYZ_1781724_x, 20, 0.5);
	float _Math_1781804 = math_modulo(_Math_1781784, 1, 0.5);
	float _Math_1781844 = math_greater_than(_Math_1781804, 0.01, 0.5);
	float _SeparateXYZ_1781764_y = separate_y(_Mapping_1781704);
	float _Math_1781744 = math_multiply(_SeparateXYZ_1781764_y, 20, 0.5);
	float _Math_1781824 = math_modulo(_Math_1781744, 1, 0.5);
	float _Math_1781864 = math_greater_than(_Math_1781824, 0.01, 0.5);
	float _Math_1781924 = math_multiply(_Math_1781844, _Math_1781864, 0.5);
	float4 _ColorRamp_1782044 = color_ramp(gradient_1782044, _Math_1781924);
	float4 _Mapping_1781944 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 1, 1)), 0);
	float _NoiseTexture_1782004_fac; float4 _NoiseTexture_1782004_col; node_noise_texture_full(_Mapping_1781944, 0, 4.8, 2, 0.5, 2, 2, _NoiseTexture_1782004_fac, _NoiseTexture_1782004_col);
	float4 _ColorRamp_1782024 = color_ramp(gradient_1782024, _NoiseTexture_1782004_fac);
	float4 _MixRGB_1811080 = mix_blend(_ColorRamp_1782044, float4(0.000607054, 0.000607054, 0.000607054, 1), _ColorRamp_1782024);
	float4 _Invert_1782104 = node_invert(1, _ColorRamp_1782044);
	float _Clamp_1916492 = clamp_minmax(_Invert_1782104, 0, 1);
	float4 _Bump_1782084; node_bump(_POS, 1, 0.1, 1, _Math_1781924, _NTS, _Bump_1782084);

	Color = _MixRGB_1811080;
	Metallic = 0;
	Roughness = _Clamp_1916492;
	Normall = _Bump_1782084;
}