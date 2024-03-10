#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void brickfloor_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_849536, out float3 Color, out float Metallic, out float Roughness, out float3 Normal)
{
	
	float _SimpleNoiseTexture_849616_fac; float4 _SimpleNoiseTexture_849616_col; node_simple_noise_texture_full(_POS, 0, 41.9, 2, 0.5, 2, 1, _SimpleNoiseTexture_849616_fac, _SimpleNoiseTexture_849616_col);
	float _SimpleNoiseTexture_849632_fac; float4 _SimpleNoiseTexture_849632_col; node_simple_noise_texture_full(_POS, 0, 0.01000006, 15, 0.5933334, 2, 1, _SimpleNoiseTexture_849632_fac, _SimpleNoiseTexture_849632_col);
	float4 _Mapping_849600 = float4(mapping_point(float4(_NOS, 0), float3(0, 0, 0), float3(0, 0, 0), _SimpleNoiseTexture_849632_col), 0);
	float _BrickTexture_849584_fac; float4 _BrickTexture_849584_col; node_tex_brick(_Mapping_849600, float4(0.8, 0.8, 0.8, 1), float4(0.2, 0.2, 0.2, 1), float4(0, 0, 0, 1), 30.2, 0.02, 0.1, 0, 0.5, 0.25, 0.5, 2, 1, 2, _BrickTexture_849584_fac, _BrickTexture_849584_col);
	float4 _ColorRamp_849536 = color_ramp(gradient_849536, _BrickTexture_849584_col);
	float4 _MixRGB_863906 = mix_blend(_SimpleNoiseTexture_849616_fac, _ColorRamp_849536, float4(0.01370208, 0.01370208, 0.01370208, 1));
	float4 _Bump_849520; node_bump(_POS, 1, 1, 1, _BrickTexture_849584_col, _NTS, _Bump_849520);

	Color = _MixRGB_863906;
	Metallic = 0;
	Roughness = 0.5;
	Normal = _Bump_849520;
}