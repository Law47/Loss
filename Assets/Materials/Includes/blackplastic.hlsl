#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void blackplastic_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_443452, out float3 Color, out float Metallic, out float Roughness, out float3 Normal)
{
	
	float _SimpleNoiseTexture_443432_fac; float4 _SimpleNoiseTexture_443432_col; node_simple_noise_texture_full(_POS, 0, 66.59999, 2, 0.5, 2, 1, _SimpleNoiseTexture_443432_fac, _SimpleNoiseTexture_443432_col);
	float4 _ColorRamp_443452 = color_ramp(gradient_443452, _SimpleNoiseTexture_443432_fac);

	Color = _ColorRamp_443452;
	Metallic = 0;
	Roughness = 1;
	Normal = float3(0.0, 0.0, 0.0);
}