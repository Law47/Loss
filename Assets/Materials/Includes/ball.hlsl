#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void ball_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_1481850, out float3 Color, out float Metallic, out float Roughness, out float3 Normal)
{
	
	float _SimpleNoiseTexture_1476598_fac; float4 _SimpleNoiseTexture_1476598_col; node_simple_noise_texture_full(_POS, 0, 6.4, 2, 0.5, 2, 1, _SimpleNoiseTexture_1476598_fac, _SimpleNoiseTexture_1476598_col);
	float4 _ColorRamp_1481850 = color_ramp(gradient_1481850, _SimpleNoiseTexture_1476598_fac);

	Color = _ColorRamp_1481850;
	Metallic = 0;
	Roughness = 0.5;
	Normal = float3(0.0, 0.0, 0.0);
}