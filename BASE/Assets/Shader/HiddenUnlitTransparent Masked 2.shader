Shader "Hidden/Unlit/Transparent Masked 2" {
	Properties {
		_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" {}
		_Mask ("Alpha (A)", 2D) = "white" {}
	}
	SubShader {
		LOD 200
		Tags { "DisableBatching" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			LOD 200
			Tags { "DisableBatching" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			Cull Off
			Offset -1, -1
			Fog {
				Mode Off
			}
			GpuProgramID 64238
			Program "vp" {
				SubProgram "d3d9 " {
					"!!DX9VertexSM30
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   float4 _ClipArgs1;
					//   float4 _ClipRange0;
					//   float4 _ClipRange1;
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
					//   _ClipRange0         c8       1
					//   _ClipRange1         c9       1
					//   _ClipArgs1          c10      1
					//
					
					    vs_3_0
					    def c11, 1, 0, 0, 0
					    dcl_position v0
					    dcl_texcoord v1
					    dcl_texcoord1 v2
					    dcl_color v3
					    dcl_position o0
					    dcl_texcoord o1.xy
					    dcl_texcoord1 o2.xy
					    dcl_texcoord2 o3
					    dcl_color o4
					    mad r0, v0.xyzx, c11.xxxy, c11.yyyx
					    dp4 r1.x, c0, r0
					    dp4 r1.y, c1, r0
					    dp4 r1.z, c2, r0
					    dp4 r1.w, c3, r0
					    dp4 r2.x, c4, r1
					    dp4 r2.y, c5, r1
					    dp4 r2.z, c6, r1
					    dp4 r2.w, c7, r1
					    mad o3.xy, v0, c8.zwzw, c8
					    mul r0.xyz, c10.zzww, v0.yxyw
					    mad r1.z, v0.x, c10.w, -r0.x
					    add r1.w, r0.z, r0.y
					    mad o3.zw, r1, c9, c9.xyxy
					    mov o1.xy, v1
					    mov o2.xy, v2
					    mov o4, v3
					    mad o0.xy, r2.w, c255, r2
					    mov o0.zw, r2
					
					// approximately 19 instruction slots used"
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
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// TEXCOORD                 1   xy          2     NONE   float   xy  
					// COLOR                    0   xyzw        3     NONE   float   xyzw
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_POSITION              0   xyzw        0      POS   float   xyzw
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// TEXCOORD                 1     zw        1     NONE   float     zw
					// TEXCOORD                 2   xyzw        2     NONE   float   xyzw
					// COLOR                    0   xyzw        3     NONE   float   xyzw
					//
					vs_4_0
					dcl_constantbuffer CB0[6], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_constantbuffer CB2[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xy
					dcl_input v2.xy
					dcl_input v3.xyzw
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xy
					dcl_output o1.zw
					dcl_output o2.xyzw
					dcl_output o3.xyzw
					dcl_temps 2
					mul r0.xyzw, v0.yyyy, cb1[1].xyzw
					mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
					add r0.xyzw, r0.xyzw, cb1[3].xyzw
					mul r1.xyzw, r0.yyyy, cb2[18].xyzw
					mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
					mad o0.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
					mov o1.xy, v1.xyxx
					mov o1.zw, v2.xxxy
					mul r0.x, v0.y, cb0[5].z
					mad r0.z, v0.x, cb0[5].w, -r0.x
					dp2 r0.w, v0.xyxx, cb0[5].zwzz
					mad o2.zw, r0.zzzw, cb0[4].zzzw, cb0[4].xxxy
					mad o2.xy, v0.xyxx, cb0[2].zwzz, cb0[2].xyxx
					mov o3.xyzw, v3.xyzw
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
					//   float4 _ClipArgs0;
					//   float4 _ClipArgs1;
					//   sampler2D _MainTex;
					//   sampler2D _Mask;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _ClipArgs0   c0       1
					//   _ClipArgs1   c1       1
					//   _MainTex     s0       1
					//   _Mask        s1       1
					//
					
					    ps_3_0
					    def c2, 1, 0, 0, 0
					    dcl_texcoord v0.xy
					    dcl_texcoord1 v1.xy
					    dcl_texcoord2 v2
					    dcl_color v3
					    dcl_2d s0
					    dcl_2d s1
					    add r0, c2.x, -v2_abs
					    mul r0.xy, r0, c0
					    mul r0.zw, r0, c1.xyxy
					    min r1.x, r0.w, r0.z
					    min r1.y, r0.y, r0.x
					    min_sat r0.x, r1.x, r1.y
					    texld r1, v0, s0
					    mul_pp r1, r1, v3
					    mul_pp r0.x, r0.x, r1.w
					    mov_pp oC0.xyz, r1
					    texld r1, v1, s1
					    mul_pp oC0.w, r0.x, r1.w
					
					// approximately 12 instruction slots used (2 texture, 10 arithmetic)"
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
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// TEXCOORD                 1     zw        1     NONE   float     zw
					// TEXCOORD                 2   xyzw        2     NONE   float   xyzw
					// COLOR                    0   xyzw        3     NONE   float   xyzw
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_constantbuffer CB0[6], immediateIndexed
					dcl_sampler s0, mode_default
					dcl_sampler s1, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_resource_texture2d (float,float,float,float) t1
					dcl_input_ps linear v1.xy
					dcl_input_ps linear v1.zw
					dcl_input_ps linear v2.xyzw
					dcl_input_ps linear v3.xyzw
					dcl_output o0.xyzw
					dcl_temps 2
					add r0.xyzw, -|v2.xyzw|, l(1.000000, 1.000000, 1.000000, 1.000000)
					mul r0.xy, r0.xyxx, cb0[3].xyxx
					mul r0.zw, r0.zzzw, cb0[5].xxxy
					min r0.xz, r0.yywy, r0.xxzx
					min_sat r0.x, r0.z, r0.x
					sample r1.xyzw, v1.xyxx, t0.xyzw, s0
					mul r1.xyzw, r1.xyzw, v3.xyzw
					mul r0.x, r0.x, r1.w
					mov o0.xyz, r1.xyzx
					sample r1.xyzw, v1.zwzz, t1.xyzw, s1
					mul o0.w, r0.x, r1.w
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
	}
	SubShader {
		LOD 100
		Tags { "DisableBatching" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			LOD 100
			Tags { "DisableBatching" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 77046
			Program "vp" {
				SubProgram "d3d9 " {
					"!!DX9VertexSM20
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
					
					    vs_2_0
					    def c9, 0, 1, 0, 0
					    dcl_position v0
					    dcl_color v1
					    dcl_texcoord v2
					    max r0, v1, c9.x
					    min oD0, r0, c9.y
					    mad oT0.xy, v2, c8, c8.zwzw
					    mad r0, v0.xyzx, c9.yyyx, c9.xxxy
					    dp4 r1.x, c0, r0
					    dp4 r1.y, c1, r0
					    dp4 r1.z, c2, r0
					    dp4 r1.w, c3, r0
					    dp4 r2.x, c4, r1
					    dp4 r2.y, c5, r1
					    dp4 r2.z, c6, r1
					    dp4 r2.w, c7, r1
					    mad oPos.xy, r2.w, c255, r2
					    mov oPos.zw, r2
					
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
					// POSITION                 0   xyz         0     NONE   float   xyz 
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xyz         2     NONE   float   xy  
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// COLOR                    0   xyzw        0     NONE   float   xyzw
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// SV_POSITION              0   xyzw        2      POS   float   xyzw
					//
					vs_4_0
					dcl_constantbuffer CB0[3], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_constantbuffer CB2[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xyzw
					dcl_input v2.xy
					dcl_output o0.xyzw
					dcl_output o1.xy
					dcl_output_siv o2.xyzw, position
					dcl_temps 2
					mov_sat o0.xyzw, v1.xyzw
					mad o1.xy, v2.xyxx, cb0[2].xyxx, cb0[2].zwzz
					mul r0.xyzw, v0.yyyy, cb1[1].xyzw
					mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
					add r0.xyzw, r0.xyzw, cb1[3].xyzw
					mul r1.xyzw, r0.yyyy, cb2[18].xyzw
					mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
					mad o2.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
					ret 
					// Approximately 0 instruction slots used"
				}
			}
			Program "fp" {
				SubProgram "d3d9 " {
					"!!DX9PixelSM20
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   sampler2D _MainTex;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _MainTex     s0       1
					//
					
					    ps_2_0
					    dcl v0
					    dcl t0.xy
					    dcl_2d s0
					    texld_pp r0, t0, s0
					    mul_pp r0, r0, v0
					    mov_pp oC0, r0
					
					// approximately 3 instruction slots used (1 texture, 2 arithmetic)"
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
					// COLOR                    0   xyzw        0     NONE   float   xyzw
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// SV_POSITION              0   xyzw        2      POS   float       
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
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_input_ps linear v0.xyzw
					dcl_input_ps linear v1.xy
					dcl_output o0.xyzw
					dcl_temps 1
					sample r0.xyzw, v1.xyxx, t0.xyzw, s0
					mul o0.xyzw, r0.xyzw, v0.xyzw
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
	}
}