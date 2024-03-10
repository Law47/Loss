#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void outerWall_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_652940, Texture2D gradient_652990, Texture2D gradient_653182, out float3 Color, out float Metallic, out float Roughness, out float3 Normal)
{
	
	float _SimpleNoiseTexture_653070_fac; float4 _SimpleNoiseTexture_653070_col; node_simple_noise_texture_full(_POS, 0, 0.1, 15, 0.7533333, 2, 1, _SimpleNoiseTexture_653070_fac, _SimpleNoiseTexture_653070_col);
	float4 _Mapping_653086 = float4(mapping_point(float4(_NOS, 0), float3(0, 0, 0), float3(0, 0, 0), _SimpleNoiseTexture_653070_col), 0);
	float _VoronoiTexture_652974_dis; float4 _VoronoiTexture_652974_col; float3 _VoronoiTexture_652974_pos; float _VoronoiTexture_652974_w; float _VoronoiTexture_652974_rad; voronoi_tex_getValue(_Mapping_653086, 0, 31.1, 0, 1, 2, 0, 2, 3, _VoronoiTexture_652974_dis, _VoronoiTexture_652974_col, _VoronoiTexture_652974_pos, _VoronoiTexture_652974_w, _VoronoiTexture_652974_rad);
	float4 _ColorRamp_653182 = color_ramp(gradient_653182, _VoronoiTexture_652974_dis);
	float _SimpleNoiseTexture_653022_fac; float4 _SimpleNoiseTexture_653022_col; node_simple_noise_texture_full(_POS, 0, 3, 15, 0.7533333, 2, 1, _SimpleNoiseTexture_653022_fac, _SimpleNoiseTexture_653022_col);
	float4 _Mapping_653038 = float4(mapping_point(float4(_NOS, 0), float3(0, 0, 0), float3(0, 0, 0), _SimpleNoiseTexture_653022_col), 0);
	float _VoronoiTexture_652958_dis; float4 _VoronoiTexture_652958_col; float3 _VoronoiTexture_652958_pos; float _VoronoiTexture_652958_w; float _VoronoiTexture_652958_rad; voronoi_tex_getValue(_Mapping_653038, 0, 31.1, 0, 1, 2, 0, 2, 0, _VoronoiTexture_652958_dis, _VoronoiTexture_652958_col, _VoronoiTexture_652958_pos, _VoronoiTexture_652958_w, _VoronoiTexture_652958_rad);
	float4 _ColorRamp_652990 = color_ramp(gradient_652990, _VoronoiTexture_652958_dis);
	float4 _MixRGB_685026 = mix_blend(_ColorRamp_653182, float4(0.01850022, 0.01850022, 0.01850022, 1), _ColorRamp_652990);
	float4 _ColorRamp_652940 = color_ramp(gradient_652940, _VoronoiTexture_652958_dis);
	float _Math_653166 = math_multiply(_ColorRamp_652940, _ColorRamp_653182, 0.5);
	float4 _Bump_653134; node_bump(_POS, -1, 1, 1, _Math_653166, _NTS, _Bump_653134);

	Color = _MixRGB_685026;
	Metallic = 0;
	Roughness = 0.5;
	Normal = _Bump_653134;
}