#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void Stool_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_221010, out float3 Normal, out float Roughness, out float3 Color)
{
	
	float4 _CombineXYZ_220750 = float4(combine_xyz(1, 488.1, 1), 0);
	float4 _Mapping_220668 = float4(mapping_point(float4(_NOS, 0), float3(0, 0, 0), float3(0, 0, 0), _CombineXYZ_220750), 0);
	float _SimpleNoiseTexture_220830_fac; float4 _SimpleNoiseTexture_220830_col; node_simple_noise_texture_full(_Mapping_220668, 0, 5, 2, 0.5, 2, 1, _SimpleNoiseTexture_220830_fac, _SimpleNoiseTexture_220830_col);
	float _Math_220850 = math_subtract(_SimpleNoiseTexture_220830_fac, 0.49, 0.5);
	float4 _CombineXYZ_220790 = float4(combine_xyz(488.1, 1, 1), 0);
	float4 _Mapping_220710 = float4(mapping_point(float4(_NOS, 0), float3(0, 0, 0), float3(0, 0, 0), _CombineXYZ_220790), 0);
	float _SimpleNoiseTexture_220810_fac; float4 _SimpleNoiseTexture_220810_col; node_simple_noise_texture_full(_Mapping_220710, 0, 5, 2, 0.5, 2, 1, _SimpleNoiseTexture_220810_fac, _SimpleNoiseTexture_220810_col);
	float _Math_220870 = math_subtract(_SimpleNoiseTexture_220810_fac, 0.49, 0.5);
	float _Math_220930 = clamp_value(math_add(_Math_220850, _Math_220870, 0.5), 0, 1);
	float4 _Invert_220970 = node_invert(1, _Math_220930);
	float4 _Bump_220950; node_bump(_POS, 1, 0.4253333, 1, _Invert_220970, _NTS, _Bump_220950);
	float4 _ColorRamp_221010 = color_ramp(gradient_221010, _Math_220930);

	Normal = _Bump_220950;
	Roughness = 1;
	Color = _ColorRamp_221010;
}