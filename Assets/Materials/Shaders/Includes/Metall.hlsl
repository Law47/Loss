#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void Metall_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_1798210, Texture2D gradient_1798194, out float4 Specular, out float3 Normal, out float Smoothness, out float Metallic, out float AmbientOcculusion, out float4 Color, out float4 Emission)
{
	
	float4 _Mapping_1798144 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 2.7, 1)), 0);
	float _SimpleNoiseTexture_1798178_fac; float4 _SimpleNoiseTexture_1798178_col; node_simple_noise_texture_full(_Mapping_1798144, 0, 9.299999, 2, 0.5, 2, 1, _SimpleNoiseTexture_1798178_fac, _SimpleNoiseTexture_1798178_col);
	float4 _ColorRamp_1798194 = color_ramp(gradient_1798194, _SimpleNoiseTexture_1798178_fac);
	float _Clamp_1994116 = clamp_minmax(_ColorRamp_1798194, 0, 1);
	float4 _ColorRamp_1798210 = color_ramp(gradient_1798210, _SimpleNoiseTexture_1798178_fac);

	Specular = float4(0.0, 0.0, 0.0, 0.0);
	Normal = float3(0.0, 0.0, 0.0);
	Smoothness = _Clamp_1994116;
	Metallic = _Clamp_1994116;
	AmbientOcculusion = 0.0;
	Color = _ColorRamp_1798210;
	Emission = float4(0.0, 0.0, 0.0, 0.0);
}