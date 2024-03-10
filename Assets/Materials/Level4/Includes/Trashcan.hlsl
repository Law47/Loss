#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void Trashcan_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_395736, out float3 Color, out float Roughness)
{
	
	float4 _Mapping_395676 = float4(mapping_point(float4(_NOS, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 1, 1)), 0);
	float _SimpleNoiseTexture_395716_fac; float4 _SimpleNoiseTexture_395716_col; node_simple_noise_texture_full(_Mapping_395676, 0, 5, 2, 0.5, 2, 1, _SimpleNoiseTexture_395716_fac, _SimpleNoiseTexture_395716_col);
	float4 _ColorRamp_395736 = color_ramp(gradient_395736, _SimpleNoiseTexture_395716_fac);

	Color = _ColorRamp_395736;
	Roughness = 1;
}