// RUN: llvm-mc -arch=amdgcn -show-encoding %s | FileCheck --check-prefix=GCN --check-prefix=SICI %s
// RUN: llvm-mc -arch=amdgcn -mcpu=SI -show-encoding %s | FileCheck --check-prefix=GCN --check-prefix=SICI %s
// RUN: llvm-mc -arch=amdgcn -mcpu=fiji -show-encoding %s | FileCheck --check-prefix=GCN --check-prefix=VI %s

//===----------------------------------------------------------------------===//
// Instructions
//===----------------------------------------------------------------------===//

s_movk_i32 s2, 0x6
// GCN: s_movk_i32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb0]

s_cmovk_i32 s2, 0x6
// SICI: s_cmovk_i32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb1]
// VI:   s_cmovk_i32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb0]

s_cmpk_eq_i32 s2, 0x6
// SICI: s_cmpk_eq_i32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb1]
// VI:   s_cmpk_eq_i32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb1]

s_cmpk_lg_i32 s2, 0x6
// SICI: s_cmpk_lg_i32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb2]
// VI:   s_cmpk_lg_i32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb1]

s_cmpk_gt_i32 s2, 0x6
// SICI: s_cmpk_gt_i32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb2]
// VI:   s_cmpk_gt_i32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb2]

s_cmpk_ge_i32 s2, 0x6
// SICI: s_cmpk_ge_i32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb3]
// VI:   s_cmpk_ge_i32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb2]

s_cmpk_lt_i32 s2, 0x6
// SICI: s_cmpk_lt_i32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb3]
// VI:   s_cmpk_lt_i32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb3]

s_cmpk_le_i32 s2, 0x6
// SICI: s_cmpk_le_i32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb4]
// VI:   s_cmpk_le_i32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb3]

s_cmpk_eq_u32 s2, 0x6
// SICI: s_cmpk_eq_u32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb4]
// VI:   s_cmpk_eq_u32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb4]

s_cmpk_lg_u32 s2, 0x6
// SICI: s_cmpk_lg_u32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb5]
// VI:   s_cmpk_lg_u32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb4]

s_cmpk_gt_u32 s2, 0x6
// SICI: s_cmpk_gt_u32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb5]
// VI:   s_cmpk_gt_u32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb5]

s_cmpk_ge_u32 s2, 0x6
// SICI: s_cmpk_ge_u32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb6]
// VI:   s_cmpk_ge_u32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb5]

s_cmpk_lt_u32 s2, 0x6
// SICI: s_cmpk_lt_u32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb6]
// VI:   s_cmpk_lt_u32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb6]

s_cmpk_le_u32 s2, 0x6
// SICI: s_cmpk_le_u32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb7]
// VI:   s_cmpk_le_u32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb6]

s_addk_i32 s2, 0x6
// SICI: s_addk_i32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb7]
// VI:   s_addk_i32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb7]

s_mulk_i32 s2, 0x6
// SICI: s_mulk_i32 s2, 0x6 ; encoding: [0x06,0x00,0x02,0xb8]
// VI:   s_mulk_i32 s2, 0x6 ; encoding: [0x06,0x00,0x82,0xb7]

s_cbranch_i_fork s[2:3], 0x6
// SICI: s_cbranch_i_fork s[2:3], 0x6 ; encoding: [0x06,0x00,0x82,0xb8]
// VI:   s_cbranch_i_fork s[2:3], 0x6 ; encoding: [0x06,0x00,0x02,0xb8]

// raw number mapped to known HW register
s_getreg_b32 s2, 0x6
// SICI: s_getreg_b32 s2, hwreg(HW_REG_LDS_ALLOC, 0, 1) ; encoding: [0x06,0x00,0x02,0xb9]
// VI:   s_getreg_b32 s2, hwreg(HW_REG_LDS_ALLOC, 0, 1) ; encoding: [0x06,0x00,0x82,0xb8]

// HW register identifier, non-default offset/width
s_getreg_b32 s2, hwreg(HW_REG_GPR_ALLOC, 1, 31)
// SICI: s_getreg_b32 s2, hwreg(HW_REG_GPR_ALLOC, 1, 31) ; encoding: [0x45,0xf0,0x02,0xb9]
// VI:   s_getreg_b32 s2, hwreg(HW_REG_GPR_ALLOC, 1, 31) ; encoding: [0x45,0xf0,0x82,0xb8]

// HW register code of unknown HW register, non-default offset/width
s_getreg_b32 s2, hwreg(51, 1, 31)
// SICI: s_getreg_b32 s2, hwreg(51, 1, 31) ; encoding: [0x73,0xf0,0x02,0xb9]
// VI:   s_getreg_b32 s2, hwreg(51, 1, 31) ; encoding: [0x73,0xf0,0x82,0xb8]

// HW register code of unknown HW register, default offset/width
s_getreg_b32 s2, hwreg(51)
// SICI: s_getreg_b32 s2, hwreg(51) ; encoding: [0x33,0xf8,0x02,0xb9]
// VI:   s_getreg_b32 s2, hwreg(51) ; encoding: [0x33,0xf8,0x82,0xb8]

// raw number mapped to known HW register
s_setreg_b32 0x6, s2
// SICI: s_setreg_b32 hwreg(HW_REG_LDS_ALLOC, 0, 1), s2 ; encoding: [0x06,0x00,0x82,0xb9]
// VI:   s_setreg_b32 hwreg(HW_REG_LDS_ALLOC, 0, 1), s2 ; encoding: [0x06,0x00,0x02,0xb9]

// raw number mapped to unknown HW register
s_setreg_b32 0x33, s2
// SICI: s_setreg_b32 hwreg(51, 0, 1), s2 ; encoding: [0x33,0x00,0x82,0xb9]
// VI:   s_setreg_b32 hwreg(51, 0, 1), s2 ; encoding: [0x33,0x00,0x02,0xb9]

// raw number mapped to known HW register, default offset/width
s_setreg_b32 0xf803, s2
// SICI: s_setreg_b32 hwreg(HW_REG_TRAPSTS), s2       ; encoding: [0x03,0xf8,0x82,0xb9]
// VI:   s_setreg_b32 hwreg(HW_REG_TRAPSTS), s2       ; encoding: [0x03,0xf8,0x02,0xb9]

// HW register identifier, default offset/width implied
s_setreg_b32 hwreg(HW_REG_HW_ID), s2
// SICI: s_setreg_b32 hwreg(HW_REG_HW_ID), s2       ; encoding: [0x04,0xf8,0x82,0xb9]
// VI:   s_setreg_b32 hwreg(HW_REG_HW_ID), s2       ; encoding: [0x04,0xf8,0x02,0xb9]

// HW register identifier, non-default offset/width
s_setreg_b32 hwreg(HW_REG_GPR_ALLOC, 1, 31), s2
// SICI: s_setreg_b32 hwreg(HW_REG_GPR_ALLOC, 1, 31), s2       ; encoding: [0x45,0xf0,0x82,0xb9]
// VI:   s_setreg_b32 hwreg(HW_REG_GPR_ALLOC, 1, 31), s2       ; encoding: [0x45,0xf0,0x02,0xb9]

// HW register code, non-default offset/width
s_setreg_b32 hwreg(5, 1, 31), s2
// SICI: s_setreg_b32 hwreg(HW_REG_GPR_ALLOC, 1, 31), s2       ; encoding: [0x45,0xf0,0x82,0xb9]
// VI:   s_setreg_b32 hwreg(HW_REG_GPR_ALLOC, 1, 31), s2       ; encoding: [0x45,0xf0,0x02,0xb9]

// raw number mapped to known HW register
s_setreg_imm32_b32 0x6, 0xff
// SICI: s_setreg_imm32_b32 hwreg(HW_REG_LDS_ALLOC, 0, 1), 0xff ; encoding: [0x06,0x00,0x80,0xba,0xff,0x00,0x00,0x00]
// VI:   s_setreg_imm32_b32 hwreg(HW_REG_LDS_ALLOC, 0, 1), 0xff ; encoding: [0x06,0x00,0x00,0xba,0xff,0x00,0x00,0x00]

// HW register identifier, non-default offset/width
s_setreg_imm32_b32 hwreg(HW_REG_GPR_ALLOC, 1, 31), 0xff
// SICI: s_setreg_imm32_b32 hwreg(HW_REG_GPR_ALLOC, 1, 31), 0xff ; encoding: [0x45,0xf0,0x80,0xba,0xff,0x00,0x00,0x00]
// VI:   s_setreg_imm32_b32 hwreg(HW_REG_GPR_ALLOC, 1, 31), 0xff ; encoding: [0x45,0xf0,0x00,0xba,0xff,0x00,0x00,0x00]
