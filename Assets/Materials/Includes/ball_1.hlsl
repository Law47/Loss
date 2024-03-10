#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void ball_1_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, out float3 Color, out float Metallic, out float Roughness, out float3 Normal)
{
	
	float _VoronoiTexture_1555560_dis; float4 _VoronoiTexture_1555560_col; float3 _VoronoiTexture_1555560_pos; float _VoronoiTexture_1555560_w; float _VoronoiTexture_1555560_rad; voronoi_tex_getValue(_POS, 0, 6.3, 0, 0.8133333, 2, 0, 2, 0, _VoronoiTexture_1555560_dis, _VoronoiTexture_1555560_col, _VoronoiTexture_1555560_pos, _VoronoiTexture_1555560_w, _VoronoiTexture_1555560_rad);

	Color = _VoronoiTexture_1555560_col;
	Metallic = 0;
	Roughness = 0.5;
	Normal = float3(0.0, 0.0, 0.0);
}