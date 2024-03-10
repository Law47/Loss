#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void chaircloth_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_392726, out float3 Color, out float Metallic, out float Roughness, out float3 Normal)
{
	
	float4 _Mapping_392780 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(536.3, 1, 101.7)), 0);
	float _SimpleNoiseTexture_392672_fac; float4 _SimpleNoiseTexture_392672_col; node_simple_noise_texture_full(_Mapping_392780, 0, 5, 2, 0.5, 2, 1, _SimpleNoiseTexture_392672_fac, _SimpleNoiseTexture_392672_col);
	float4 _Mapping_392634 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 443.3, 1)), 0);
	float _SimpleNoiseTexture_392690_fac; float4 _SimpleNoiseTexture_392690_col; node_simple_noise_texture_full(_Mapping_392634, 0, 5, 2, 0.5, 2, 1, _SimpleNoiseTexture_392690_fac, _SimpleNoiseTexture_392690_col);
	float _Math_392708 = math_multiply(_SimpleNoiseTexture_392672_fac, _SimpleNoiseTexture_392690_fac, 0.5);
	float4 _ColorRamp_392726 = color_ramp(gradient_392726, _Math_392708);

	Color = _ColorRamp_392726;
	Metallic = 0;
	Roughness = 0.5;
	Normal = float3(0.0, 0.0, 0.0);
}