#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void handle_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, out float3 Color, out float Metallic, out float Roughness, out float3 Normal)
{
	
	float4 _Mapping_1343612 = float4(mapping_point(float4(_UV, 0), float3(0, 0, 0), float3(0, 0, -45), float3(1, 1, 1)), 0);
	float _SeparateXYZ_1343630_x = separate_x(_Mapping_1343612);
	float _Math_1343450 = math_multiply(_SeparateXYZ_1343630_x, 100, 0.5);
	float _Math_1343486 = math_modulo(_Math_1343450, 1, 0.5);
	float _Math_1343522 = math_greater_than(_Math_1343486, 0.12, 0.5);
	float4 _Mapping_1343648 = float4(mapping_point(float4(_UV, 0), float3(1, 0, 0), float3(0, 0, 45), float3(1, 1, 1)), 0);
	float _SeparateXYZ_1343666_x = separate_x(_Mapping_1343648);
	float _Math_1343468 = math_multiply(_SeparateXYZ_1343666_x, 100, 0.5);
	float _Math_1343504 = math_modulo(_Math_1343468, 1, 0.5);
	float _Math_1343540 = math_greater_than(_Math_1343504, 0.12, 0.5);
	float _Math_1343576 = math_multiply(_Math_1343522, _Math_1343540, 0.5);
	float4 _Bump_1343684; node_bump(_POS, 1, 1, 1, _Math_1343576, _NTS, _Bump_1343684);

	Color = float4(0.01938236, 0.01938236, 0.01938236, 1);
	Metallic = 0.584;
	Roughness = 0.584;
	Normal = _Bump_1343684;
}