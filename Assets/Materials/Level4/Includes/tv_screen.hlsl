#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void tv_screen_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_13478, out float4 Color, out float Roughness, out float3 Emission)
{
	
	float _SeparateXYZ_13472_y = separate_y(float4(_UV, 0));
	float4 _ColorRamp_13478 = color_ramp(gradient_13478, _SeparateXYZ_13472_y);

	Color = _ColorRamp_13478;
	Roughness = 0;
	Emission = _ColorRamp_13478;
}