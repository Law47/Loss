#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void walls_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_1967916, out float3 color, out float roughness)
{
	
	float _SeparateXYZ_1967900_x = separate_x(float4(_UV, 0));
	float _MapRange_1967932 = clamp_value(map_range_linear(_SeparateXYZ_1967900_x, 0, 0.258, 0, 1, 4), 0, 1);
	float4 _ColorRamp_1967916 = color_ramp(gradient_1967916, _MapRange_1967932);

	color = _ColorRamp_1967916;
	roughness = 0.5;
}