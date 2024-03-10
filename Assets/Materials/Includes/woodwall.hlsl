#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void woodwall_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_974060, Texture2D gradient_974092, Texture2D gradient_974124, out float3 Color, out float Metallic, out float Roughness, out float3 Normal)
{
	
	float _MusgraveTexture_974108_fac = texture_musgrave_factor(_POS, 0, 21.8, 2, 2, 2, 0, 1, 2, 1);
	float4 _ColorRamp_974124 = color_ramp(gradient_974124, _MusgraveTexture_974108_fac);
	float4 _ColorRamp_974092 = color_ramp(gradient_974092, _MusgraveTexture_974108_fac);
	float _Clamp_1026738 = clamp_minmax(_ColorRamp_974092, 0, 1);
	float4 _ColorRamp_974060 = color_ramp(gradient_974060, _MusgraveTexture_974108_fac);
	float4 _Bump_974076; node_bump(_POS, -1, 0.04033333, 1, _ColorRamp_974060, _NTS, _Bump_974076);

	Color = _ColorRamp_974124;
	Metallic = 0;
	Roughness = _Clamp_1026738;
	Normal = _Bump_974076;
}