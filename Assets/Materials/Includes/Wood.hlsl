#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void wood_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_1200104, Texture2D gradient_1200136, Texture2D gradient_1200168, out float3 Color, out float Metallic, out float Roughness, out float3 Normal)
{
	
	float _MusgraveTexture_1200152_fac = texture_musgrave_factor(_POS, 0, 7.2, 2, 2, 2, 0, 1, 2, 1);
	float4 _ColorRamp_1200168 = color_ramp(gradient_1200168, _MusgraveTexture_1200152_fac);
	float4 _ColorRamp_1200136 = color_ramp(gradient_1200136, _MusgraveTexture_1200152_fac);
	float _Clamp_321866 = clamp_minmax(_ColorRamp_1200136, 0, 1);
	float4 _ColorRamp_1200104 = color_ramp(gradient_1200104, _MusgraveTexture_1200152_fac);
	float4 _Bump_1200120; node_bump(_POS, -1, 0.04033333, 1, _ColorRamp_1200104, _NTS, _Bump_1200120);

	Color = _ColorRamp_1200168;
	Metallic = 0;
	Roughness = _Clamp_321866;
	Normal = _Bump_1200120;
}