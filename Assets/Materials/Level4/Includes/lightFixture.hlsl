#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void lightFixture_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_1004428, out float3 Color, out float Roughness, out float3 Emission, out float3 Normal)
{
	
	float _SeparateXYZ_1004356_z = separate_z(float4(_NOS, 0));
	float4 _ColorRamp_1004428 = color_ramp(gradient_1004428, _SeparateXYZ_1004356_z);
	float4 _BrightContrast_1061940 = brightness_contrast(float4(1, 0.8879232, 0.2541522, 1), _ColorRamp_1004428, 0);
	float _SimpleNoiseTexture_1004374_fac; float4 _SimpleNoiseTexture_1004374_col; node_simple_noise_texture_full(_POS, 0, 187, 2, 0.5, 2, 1, _SimpleNoiseTexture_1004374_fac, _SimpleNoiseTexture_1004374_col);
	float4 _Bump_1004392; node_bump(_POS, 1, 0.2406669, 1, _SimpleNoiseTexture_1004374_fac, _NTS, _Bump_1004392);

	Color = float4(1, 1, 1, 1);
	Roughness = 0.5;
	Emission = _BrightContrast_1061940;
	Normal = _Bump_1004392;
}