#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void globe_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_110554, Texture2D gradient_110602, out float3 Color, out float Metallic, out float Roughness, out float3 Normall)
{
	
	float _SimpleNoiseTexture_110586_fac; float4 _SimpleNoiseTexture_110586_col; node_simple_noise_texture_full(_POS, 0, 9.299999, 12.4, 0.5333334, 2, 1, _SimpleNoiseTexture_110586_fac, _SimpleNoiseTexture_110586_col);
	float4 _ColorRamp_110602 = color_ramp(gradient_110602, _SimpleNoiseTexture_110586_fac);
	float _SimpleNoiseTexture_110570_fac; float4 _SimpleNoiseTexture_110570_col; node_simple_noise_texture_full(_POS, 0, 1.7, 12.4, 0.5333334, 2, 1, _SimpleNoiseTexture_110570_fac, _SimpleNoiseTexture_110570_col);
	float4 _ColorRamp_110554 = color_ramp(gradient_110554, _SimpleNoiseTexture_110570_fac);
	float4 _MixRGB_142668 = mix_blend(_ColorRamp_110602, _ColorRamp_110554, float4(0.05612849, 0.05612849, 0.05612849, 1));

	Color = _MixRGB_142668;
	Metallic = 0;
	Roughness = 0.5;
	Normall = float3(0.0, 0.0, 0.0);
}