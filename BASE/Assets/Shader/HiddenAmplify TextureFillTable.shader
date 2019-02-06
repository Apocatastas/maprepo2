Shader "Hidden/Amplify Texture/FillTable" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
	}
	SubShader {
		Pass {
			ColorMask RGB -1
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 19398
			Program "vp" {
				SubProgram "d3d9 " {
					"!!DX9VertexSM30
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   float4 _offsets;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _offsets     c0       1
					//
					
					    vs_3_0
					    def c1, 2, -1, 0, 1
					    dcl_position v0
					    dcl_texcoord v1
					    dcl_position o0
					    dcl_texcoord o1
					    dcl_texcoord1 o2
					    add r0.xy, c0, v0
					    mad r1.xy, r0, c1.x, c1.y
					    mov r1.zw, c1
					    mov o1.xyz, v1
					    mov o1.w, v0.z
					    mad o2.xyz, v0.xyxw, c1.wyzw, c1.zwzw
					    mov o2.w, c0.z
					    mad o0.xy, r1.w, c255, r1
					    mov o0.zw, r1
					
					// approximately 9 instruction slots used"
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
					// TEXCOORD                 0   xyz         1     NONE   float   xyz 
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Position              0   xyzw        0      POS   float   xyzw
					// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
					//
					vs_4_0
					dcl_constantbuffer CB0[4], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xyz
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xyzw
					dcl_output o2.xyzw
					mad o0.xy, v0.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
					mov o0.zw, l(0,0,0,1.000000)
					mov o1.xyz, v1.xyzx
					mov o1.w, v0.z
					mad o2.xy, v0.xyxx, l(1.000000, -1.000000, 0.000000, 0.000000), l(0.000000, 1.000000, 0.000000, 0.000000)
					mov o2.z, l(0)
					mov o2.w, cb0[3].z
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
					//   sampler2D _MainTex;
					//   float4 _VTTableAddrRange;
					//
					//
					// Registers:
					//
					//   Name              Reg   Size
					//   ----------------- ----- ----
					//   _VTTableAddrRange c0       1
					//   _MainTex          s0       1
					//
					
					    ps_3_0
					    def c1, 0.5, -0, -1, 0
					    dcl_texcoord v0
					    dcl_texcoord1 v1
					    dcl_2d s0
					    texldl r0, v1, s0
					    mov r0.x, c1.x
					    mad r0.x, r0.z, c0.z, r0.x
					    frc r0.y, r0.x
					    add r0.x, -r0.y, r0.x
					    add r0.x, r0.x, -v0.w
					    cmp r0, r0.x, c1.y, c1.z
					    texkill r0
					    rcp r0.x, c0.x
					    rcp r0.y, c0.y
					    rcp r0.z, c0.z
					    rcp r0.w, c0.w
					    mul_pp oC0, r0, v0
					
					// approximately 14 instruction slots used (2 texture, 12 arithmetic)"
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
					// SV_Position              0   xyzw        0      POS   float       
					// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 1   xyzw        2     NONE   float   xy w
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_constantbuffer CB0[3], immediateIndexed
					dcl_sampler s0, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_input_ps linear v1.xyzw
					dcl_input_ps linear v2.xyw
					dcl_output o0.xyzw
					dcl_temps 1
					sample_l r0.xyzw, v2.xyxx, t0.xyzw, s0, v2.w
					mad r0.x, r0.z, cb0[2].z, l(0.500000)
					round_ni r0.x, r0.x
					lt r0.x, r0.x, v1.w
					discard_nz r0.x
					div o0.xyzw, v1.xyzw, cb0[2].xyzw
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
		Pass {
			ColorMask RGB -1
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 120939
			Program "vp" {
				SubProgram "d3d9 " {
					"!!DX9VertexSM30
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   float4 _offsets;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _offsets     c0       1
					//
					
					    vs_3_0
					    def c1, 2, -1, 0, 1
					    dcl_position v0
					    dcl_texcoord v1
					    dcl_position o0
					    dcl_texcoord o1
					    dcl_texcoord1 o2
					    add r0.xy, c0, v0
					    mad r1.xy, r0, c1.x, c1.y
					    mov r1.zw, c1
					    mov o1.xyz, v1
					    mov o1.w, v0.z
					    mad o2.xyz, v0.xyxw, c1.wyzw, c1.zwzw
					    mov o2.w, c0.z
					    mad o0.xy, r1.w, c255, r1
					    mov o0.zw, r1
					
					// approximately 9 instruction slots used"
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
					// TEXCOORD                 0   xyz         1     NONE   float   xyz 
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Position              0   xyzw        0      POS   float   xyzw
					// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
					//
					vs_4_0
					dcl_constantbuffer CB0[4], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xyz
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xyzw
					dcl_output o2.xyzw
					mad o0.xy, v0.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
					mov o0.zw, l(0,0,0,1.000000)
					mov o1.xyz, v1.xyzx
					mov o1.w, v0.z
					mad o2.xy, v0.xyxx, l(1.000000, -1.000000, 0.000000, 0.000000), l(0.000000, 1.000000, 0.000000, 0.000000)
					mov o2.z, l(0)
					mov o2.w, cb0[3].z
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
					//   sampler2D _MainTex;
					//   float4 _VTTableAddrRange;
					//
					//
					// Registers:
					//
					//   Name              Reg   Size
					//   ----------------- ----- ----
					//   _VTTableAddrRange c0       1
					//   _MainTex          s0       1
					//
					
					    ps_3_0
					    def c1, 0.5, -0, -1, 0
					    dcl_texcoord v0
					    dcl_texcoord1 v1
					    dcl_2d s0
					    texldl r0, v1, s0
					    mov r0.x, c1.x
					    mad r0.x, r0.z, c0.z, r0.x
					    frc r0.y, r0.x
					    add r0.x, -r0.y, r0.x
					    add r0.x, -r0.x, v0.w
					    cmp r0, -r0_abs.x, c1.y, c1.z
					    texkill r0
					    rcp r0.x, c0.x
					    rcp r0.y, c0.y
					    rcp r0.z, c0.z
					    rcp r0.w, c0.w
					    mul_pp oC0, r0, v0.xyzz
					
					// approximately 14 instruction slots used (2 texture, 12 arithmetic)"
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
					// SV_Position              0   xyzw        0      POS   float       
					// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 1   xyzw        2     NONE   float   xy w
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_constantbuffer CB0[3], immediateIndexed
					dcl_sampler s0, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_input_ps linear v1.xyzw
					dcl_input_ps linear v2.xyw
					dcl_output o0.xyzw
					dcl_temps 1
					sample_l r0.xyzw, v2.xyxx, t0.xyzw, s0, v2.w
					mad r0.x, r0.z, cb0[2].z, l(0.500000)
					round_ni r0.x, r0.x
					ne r0.x, r0.x, v1.w
					discard_nz r0.x
					div o0.xyzw, v1.xyzz, cb0[2].xyzw
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
		Pass {
			ColorMask RGB -1
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 172094
			Program "vp" {
				SubProgram "d3d9 " {
					"!!DX9VertexSM30
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   float4 _offsets;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _offsets     c0       1
					//
					
					    vs_3_0
					    def c1, 2, -1, 0, 1
					    dcl_position v0
					    dcl_texcoord v1
					    dcl_position o0
					    dcl_texcoord o1
					    dcl_texcoord1 o2
					    add r0.xy, c0, v0
					    mad r1.xy, r0, c1.x, c1.y
					    mov r1.zw, c1
					    mov o1.xyz, v1
					    mov o1.w, v0.z
					    mad o2.xyz, v0.xyxw, c1.wyzw, c1.zwzw
					    mov o2.w, c0.z
					    mad o0.xy, r1.w, c255, r1
					    mov o0.zw, r1
					
					// approximately 9 instruction slots used"
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
					// TEXCOORD                 0   xyz         1     NONE   float   xyz 
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Position              0   xyzw        0      POS   float   xyzw
					// TEXCOORD                 0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 1   xyzw        2     NONE   float   xyzw
					//
					vs_4_0
					dcl_constantbuffer CB0[4], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xyz
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xyzw
					dcl_output o2.xyzw
					mad o0.xy, v0.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
					mov o0.zw, l(0,0,0,1.000000)
					mov o1.xyz, v1.xyzx
					mov o1.w, v0.z
					mad o2.xy, v0.xyxx, l(1.000000, -1.000000, 0.000000, 0.000000), l(0.000000, 1.000000, 0.000000, 0.000000)
					mov o2.z, l(0)
					mov o2.w, cb0[3].z
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
					//   sampler2D _MainTex;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    dcl_texcoord1 v0
					    dcl_2d s0
					    texldl_pp oC0, v0, s0
					
					// approximately 2 instruction slots used (2 texture, 0 arithmetic)"
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
					// SV_Position              0   xyzw        0      POS   float       
					// TEXCOORD                 0   xyzw        1     NONE   float       
					// TEXCOORD                 1   xyzw        2     NONE   float   xy w
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
					dcl_input_ps linear v2.xyw
					dcl_output o0.xyzw
					sample_l o0.xyzw, v2.xyxx, t0.xyzw, s0, v2.w
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
	}
}