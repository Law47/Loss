#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void bronze_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_26240, out float3 Color, out float Metallic, out float Roughness, out float3 Normall)
{
	
	float _SimpleNoiseTexture_26224_fac; float4 _SimpleNoiseTexture_26224_col; node_simple_noise_texture_full(_POS, 0, 12, 2, 0.5, 2, 1, _SimpleNoiseTexture_26224_fac, _SimpleNoiseTexture_26224_col);
	float4 _ColorRamp_26240 = color_ramp(gradient_26240, _SimpleNoiseTexture_26224_fac);

	Color = _ColorRamp_26240;
	Metallic = 1;
	Roughness = 0.5;
	Normall = float3(0.0, 0.0, 0.0);
}