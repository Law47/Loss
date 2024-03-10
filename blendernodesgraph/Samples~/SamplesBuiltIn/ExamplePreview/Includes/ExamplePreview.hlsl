#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void ExamplePreview_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D curve_7938, out float4 ColorOut)
{
	
	float _Math_7926 = math_add(_Time, 8, 0.5);
	float4 _Mapping_7932 = float4(mapping_point(float4(_POS, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 1, 1)), 0);
	float _SimpleNoiseTexture_7930_fac; float4 _SimpleNoiseTexture_7930_col; node_simple_noise_texture_full(_Mapping_7932, _Math_7926, 5, 2, 0.5, 0, 2, _SimpleNoiseTexture_7930_fac, _SimpleNoiseTexture_7930_col);
	float4 _RGBCurves_7938 = node_rgb_curves(1, _SimpleNoiseTexture_7930_col, curve_7938);

	ColorOut = _RGBCurves_7938;
}