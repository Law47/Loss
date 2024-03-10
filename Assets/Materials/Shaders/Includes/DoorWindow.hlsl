#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void DoorWindow_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_2162026, out float4 Color, out float Roughness)
{
	
	float4 _Mapping_2161986 = float4(mapping_point(float4(_UV, 0), float3(1.03, 0, 0), float3(0, 0, 40), float3(1, 1, 1)), 0);
	float _SeparateXYZ_2162006_x = separate_x(_Mapping_2161986);
	float _Math_2161926 = math_multiply(_SeparateXYZ_2162006_x, 7.9, 0.5);
	float _Math_2162066 = math_modulo(_Math_2161926, 1, 0.5);
	float _Math_2161946 = math_greater_than(_Math_2162066, 0.45, 0.5);
	float4 _ColorRamp_2162026 = color_ramp(gradient_2162026, _Math_2161946);

	Color = _ColorRamp_2162026;
	Roughness = 0.5;
}