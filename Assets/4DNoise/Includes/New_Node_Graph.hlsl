#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void New_Node_Graph_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_12282, Texture2D gradient_12302, out float4 Color, out float3 Normal, out float Smoothness, out float4 Emission, out float AmbientOcculusion, out float Metallic, out float4 Specular)
{
	
	float4 _Mapping_12220 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 2.7, 1)), 0);
	float _SimpleNoiseTexture_12262_fac; float4 _SimpleNoiseTexture_12262_col; node_simple_noise_texture_full(_Mapping_12220, 0, 9.299999, 2, 0.5, 2, 1, _SimpleNoiseTexture_12262_fac, _SimpleNoiseTexture_12262_col);
	float4 _ColorRamp_12302 = color_ramp(gradient_12302, _SimpleNoiseTexture_12262_fac);
	float4 _ColorRamp_12282 = color_ramp(gradient_12282, _SimpleNoiseTexture_12262_fac);

	Color = _ColorRamp_12302;
	Normal = float3(0.0, 0.0, 0.0);
	Smoothness = _ColorRamp_12282;
	Emission = float4(0.0, 0.0, 0.0, 0.0);
	AmbientOcculusion = 0.0;
	Metallic = _ColorRamp_12302;
	Specular = float4(0.0, 0.0, 0.0, 0.0);
}