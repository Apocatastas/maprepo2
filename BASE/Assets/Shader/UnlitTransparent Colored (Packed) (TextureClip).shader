Shader "Unlit/Transparent Colored (Packed) (TextureClip)" {
	Properties {
		_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" {}
	}
	SubShader {
		LOD 200
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			LOD 200
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			Cull Off
			Offset -1, -1
			Fog {
				Mode Off
			}
			GpuProgramID 57120
			Program "vp" {
				SubProgram "d3d9 " {
					"!!DX9VertexSM30
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   float4 _MainTex_ST;
					//   row_major float4x4 unity_MatrixVP;
					//   row_major float4x4 unity_ObjectToWorld;
					//
					//
					// Registers:
					//
					//   Name                Reg   Size
					//   ------------------- ----- ----
					//   unity_ObjectToWorld c0       4
					//   unity_MatrixVP      c4       4
					//   _MainTex_ST         c8       1
					//
					
					    vs_3_0
					    def c9, 1, 0, 0, 0
					    dcl_position v0
					    dcl_color v1
					    dcl_texcoord v2
					    dcl_position o0
					    dcl_color o1
					    dcl_texcoord o2.xy
					    dcl_texcoord1 o3.xy
					    mad r0, v0.xyzx, c9.xxxy, c9.yyyx
					    dp4 r1.x, c0, r0
					    dp4 r1.y, c1, r0
					    dp4 r1.z, c2, r0
					    dp4 r1.w, c3, r0
					    dp4 r2.x, c4, r1
					    dp4 r2.y, c5, r1
					    dp4 r2.z, c6, r1
					    dp4 r2.w, c7, r1
					    mad o3.xy, v0, c8, c8.zwzw
					    mov o1, v1
					    mov o2.xy, v2
					    mad o0.xy, r2.w, c255, r2
					    mov o0.zw, r2
					
					// approximately 14 instruction slots used"
				}
				SubProgram "d3d11 " {
					"!!DX11VertexSM40
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// POSITION                 0   xyzw        0     NONE   float   xyz 
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xy          2     NONE   float   xy  
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_POSITION              0   xyzw        0      POS   float   xyzw
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xy          2     NONE   float   xy  
					// TEXCOORD                 1     zw        2     NONE   float     zw
					//
					vs_4_0
					dcl_constantbuffer CB0[3], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_constantbuffer CB2[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xyzw
					dcl_input v2.xy
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xyzw
					dcl_output o2.xy
					dcl_output o2.zw
					dcl_temps 2
					mul r0.xyzw, v0.yyyy, cb1[1].xyzw
					mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
					add r0.xyzw, r0.xyzw, cb1[3].xyzw
					mul r1.xyzw, r0.yyyy, cb2[18].xyzw
					mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
					mad o0.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
					mov o1.xyzw, v1.xyzw
					mad o2.zw, v0.xxxy, cb0[2].xxxy, cb0[2].zzzw
					mov o2.xy, v2.xyxx
					ret 
					// Approximately 0 instruction slots used"
				}
			}
			Program "fp" {
				SubProgram "d3d9 " {
					"!!DX9PixelSM30
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   sampler2D _ClipTex;
					//   sampler2D _MainTex;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _MainTex     s0       1
					//   _ClipTex     s1       1
					//
					
					    ps_3_0
					    def c0, 0.5, -0.5, 0.50999999, -2.04081631
					    dcl_color_pp v0
					    dcl_texcoord v1.xy
					    dcl_texcoord1 v2.xy
					    dcl_2d s0
					    dcl_2d s1
					    add_pp r0, c0.y, v0
					    frc_pp r1, -r0
					    add_sat_pp r0, r0, r1
					    texld_pp r1, v1, s0
					    mul_pp r1.xy, r0, r1
					    add_pp r1.x, r1.y, r1.x
					    mad_pp r1.x, r1.z, r0.z, r1.x
					    mad_pp r1.x, r1.w, r0.w, r1.x
					    mad_pp r0, r0, c0.z, -v0
					    mul_sat_pp r0, r0, c0.w
					    mad r1.yz, v2.xxyw, c0.x, c0.x
					    texld_pp r2, r1.yzzw, s1
					    mul_pp r0.w, r0.w, r2.w
					    mov_pp oC0.xyz, r0
					    mul_pp oC0.w, r1.x, r0.w
					
					// approximately 15 instruction slots used (2 texture, 13 arithmetic)"
				}
				SubProgram "d3d11 " {
					"!!DX11PixelSM40
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_POSITION              0   xyzw        0      POS   float       
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xy          2     NONE   float   xy  
					// TEXCOORD                 1     zw        2     NONE   float     zw
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_sampler s0, mode_default
					dcl_sampler s1, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_resource_texture2d (float,float,float,float) t1
					dcl_input_ps linear v1.xyzw
					dcl_input_ps linear v2.xy
					dcl_input_ps linear v2.zw
					dcl_output o0.xyzw
					dcl_temps 3
					add r0.xyzw, v1.xyzw, l(-0.500000, -0.500000, -0.500000, -0.500000)
					round_pi_sat r0.xyzw, r0.xyzw
					sample r1.xyzw, v2.xyxx, t1.xyzw, s0
					mul r1.xy, r0.xyxx, r1.xyxx
					add r1.x, r1.y, r1.x
					mad r1.x, r1.z, r0.z, r1.x
					mad r1.x, r1.w, r0.w, r1.x
					mad r0.xyzw, r0.xyzw, l(0.510000, 0.510000, 0.510000, 0.510000), -v1.xyzw
					mul_sat r0.xyzw, r0.xyzw, l(-2.040816, -2.040816, -2.040816, -2.040816)
					mad r1.yz, v2.zzwz, l(0.000000, 0.500000, 0.500000, 0.000000), l(0.000000, 0.500000, 0.500000, 0.000000)
					sample r2.xyzw, r1.yzyy, t0.xyzw, s1
					mul r0.w, r0.w, r2.w
					mov o0.xyz, r0.xyzx
					mul o0.w, r1.x, r0.w
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
	}
}