#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void ball_2_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, out float3 Color, out float Metallic, out float Roughness, out float3 Normal)
{
	
	float _CheckerTexture_1557656_fac; float4 _CheckerTexture_1557656_col; node_tex_checker(_POS, float4(0.05203691, 0.1086238, 0.8012049, 1), float4(0.1997758, 0.03124548, 0.006213884, 1), 5, _CheckerTexture_1557656_fac, _CheckerTexture_1557656_col);

	Color = _CheckerTexture_1557656_col;
	Metallic = 0;
	Roughness = 0.5;
	Normal = float3(0.0, 0.0, 0.0);
}