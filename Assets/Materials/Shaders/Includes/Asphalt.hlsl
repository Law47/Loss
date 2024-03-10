#include <Packages/com.blendernodesgraph.core/Editor/Includes/Importers.hlsl>

void Asphalt_float(float3 _POS, float3 _PVS, float3 _PWS, float3 _NOS, float3 _NVS, float3 _NWS, float3 _NTS, float3 _TWS, float3 _BTWS, float3 _UV, float3 _SP, float3 _VVS, float3 _VWS, Texture2D gradient_32580, Texture2D gradient_32592, out float4 ColorOut, out float3 NormalOut)
{
	
	float _NoiseTexture_32600_fac; float4 _NoiseTexture_32600_col; node_noise_texture_full(_POS, 0, 8, 0, 0, 0, 2, _NoiseTexture_32600_fac, _NoiseTexture_32600_col);
	float4 _MixRGB_32570 = mix_blend(0.9, _NoiseTexture_32600_fac, float4(_POS, 0));
	float _VoronoiTexture_32568_dis; float4 _VoronoiTexture_32568_col; float3 _VoronoiTexture_32568_pos; float _VoronoiTexture_32568_w; float _VoronoiTexture_32568_rad; voronoi_tex_getValue(_MixRGB_32570, 0, 2, 1, 0.5, 1, 0, 1, 3, _VoronoiTexture_32568_dis, _VoronoiTexture_32568_col, _VoronoiTexture_32568_pos, _VoronoiTexture_32568_w, _VoronoiTexture_32568_rad);
	float4 _Asphalt_32592 = color_ramp(gradient_32592, _VoronoiTexture_32568_dis);
	float _NoiseTexture_32594_fac; float4 _NoiseTexture_32594_col; node_noise_texture_full(float4(_POS, 0), 0, 4, 0, 0, 0, 2, _NoiseTexture_32594_fac, _NoiseTexture_32594_col);
	float4 _MixRGB_32582 = mix_blend(_NoiseTexture_32594_fac, float4(0.009721218, 0.009721218, 0.009721218, 1), float4(0.05951124, 0.05951124, 0.05951124, 1));
	float4 _MixRGB_32572 = mix_blend(_Asphalt_32592, float4(0.009134057, 0.009134057, 0.009134057, 1), _MixRGB_32582);
	float _NoiseTexture_32576_fac; float4 _NoiseTexture_32576_col; node_noise_texture_full(_POS, 0, 250, 0, 0, 0, 2, _NoiseTexture_32576_fac, _NoiseTexture_32576_col);
	float4 _Asphalt_32580 = color_ramp(gradient_32580, _VoronoiTexture_32568_dis);
	float4 _Bump_32586; node_bump(_POS, 1, 0.56, 1, _Asphalt_32580, _NTS, _Bump_32586);
	float4 _Bump_32574; node_bump(_POS, 1, 0.24, 1, _NoiseTexture_32576_fac, _Bump_32586, _Bump_32574);

	ColorOut = _MixRGB_32572;
	NormalOut = _Bump_32574;
}