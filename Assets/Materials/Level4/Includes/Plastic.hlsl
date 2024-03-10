#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void Plastic_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_471824, out float3 Color, out float Roughness)
{
	
	float4 _Mapping_471760 = float4(mapping_point(float4(_NOS, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 1, 1)), 0);
	float _SimpleNoiseTexture_471792_fac; float4 _SimpleNoiseTexture_471792_col; node_simple_noise_texture_full(_Mapping_471760, 0, 5, 2, 0.5, 2, 1, _SimpleNoiseTexture_471792_fac, _SimpleNoiseTexture_471792_col);
	float4 _ColorRamp_471824 = color_ramp(gradient_471824, _SimpleNoiseTexture_471792_fac);

	Color = _ColorRamp_471824;
	Roughness = 0.358;
}