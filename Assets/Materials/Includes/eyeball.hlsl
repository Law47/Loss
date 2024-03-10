#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void eyeball_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_594458, out float3 Color, out float Metallic, out float Roughness, out float3 Normal)
{
	
	float _SeparateXYZ_594442_y = separate_y(float4(_UV, 0));
	float4 _ColorRamp_594458 = color_ramp(gradient_594458, _SeparateXYZ_594442_y);

	Color = _ColorRamp_594458;
	Metallic = 0;
	Roughness = 0.5;
	Normal = float3(0.0, 0.0, 0.0);
}