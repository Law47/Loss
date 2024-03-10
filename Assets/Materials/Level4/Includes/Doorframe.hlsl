#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void Doorframe_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_43228, out float3 Normal, out float Smoothness, out float4 Emission, out float AmbientOcculusion, out float Metallic, out float4 Specular)
{
	
	float4 _Mapping_43236 = float4(mapping_point(float4(_NOS, 0), float3(0, 0, 0), float3(0, 0, 0), float3(1, 1, 1)), 0);
	float _SimpleNoiseTexture_43242_fac; float4 _SimpleNoiseTexture_43242_col; node_simple_noise_texture_full(_Mapping_43236, 0, 5, 2, 0.5, 2, 1, _SimpleNoiseTexture_43242_fac, _SimpleNoiseTexture_43242_col);
	float4 _ColorRamp_43228 = color_ramp(gradient_43228, _SimpleNoiseTexture_43242_fac);

	Normal = _ColorRamp_43228;
	Smoothness = 0.184;
	Emission = float4(0.0, 0.0, 0.0, 0.0);
	AmbientOcculusion = 0.0;
	Metallic = 0.0;
	Specular = float4(0.0, 0.0, 0.0, 0.0);
}