// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
// Date        : Thu May 04 13:25:23 2023
// Host        : Alessandro-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/aless/Documents/GitHub/project_reti_logiche/project_reti_logiche.sim/sim_1/synth/func/project_tb_func_synth.v
// Design      : project_reti_logiche
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module project_reti_logiche
   (i_clk,
    i_rst,
    i_start,
    i_w,
    o_z0,
    o_z1,
    o_z2,
    o_z3,
    o_done,
    o_mem_addr,
    i_mem_data,
    o_mem_we,
    o_mem_en);
  input i_clk;
  input i_rst;
  input i_start;
  input i_w;
  output [7:0]o_z0;
  output [7:0]o_z1;
  output [7:0]o_z2;
  output [7:0]o_z3;
  output o_done;
  output [15:0]o_mem_addr;
  input [7:0]i_mem_data;
  output o_mem_we;
  output o_mem_en;

  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[4]_i_2_n_0 ;
  wire [4:0]count_reg__0;
  wire [3:0]cur_state;
  wire \cur_state[0]_i_1_n_0 ;
  wire \cur_state[0]_i_2_n_0 ;
  wire \cur_state[1]_i_1_n_0 ;
  wire \cur_state[2]_i_1_n_0 ;
  wire \cur_state[3]_i_2_n_0 ;
  wire \cur_state[3]_i_3_n_0 ;
  wire done_ok;
  wire done_ok_reg_i_1_n_0;
  wire done_ok_reg_i_2_n_0;
  wire i_clk;
  wire i_clk_IBUF;
  wire i_clk_IBUF_BUFG;
  wire [7:0]i_mem_data;
  wire [7:0]i_mem_data_IBUF;
  wire i_rst;
  wire i_rst_IBUF;
  wire i_start;
  wire i_start_IBUF;
  wire i_w;
  wire i_w_IBUF;
  wire next_state;
  wire o_done;
  wire o_done_OBUF;
  wire [15:0]o_mem_addr;
  wire o_mem_addr0;
  wire \o_mem_addr[0]_i_1_n_0 ;
  wire \o_mem_addr[0]_i_2_n_0 ;
  wire \o_mem_addr[10]_i_1_n_0 ;
  wire \o_mem_addr[10]_i_2_n_0 ;
  wire \o_mem_addr[11]_i_1_n_0 ;
  wire \o_mem_addr[11]_i_2_n_0 ;
  wire \o_mem_addr[11]_i_3_n_0 ;
  wire \o_mem_addr[11]_i_4_n_0 ;
  wire \o_mem_addr[12]_i_1_n_0 ;
  wire \o_mem_addr[12]_i_2_n_0 ;
  wire \o_mem_addr[13]_i_1_n_0 ;
  wire \o_mem_addr[13]_i_2_n_0 ;
  wire \o_mem_addr[14]_i_1_n_0 ;
  wire \o_mem_addr[15]_i_1_n_0 ;
  wire \o_mem_addr[15]_i_3_n_0 ;
  wire \o_mem_addr[1]_i_1_n_0 ;
  wire \o_mem_addr[1]_i_2_n_0 ;
  wire \o_mem_addr[2]_i_1_n_0 ;
  wire \o_mem_addr[2]_i_2_n_0 ;
  wire \o_mem_addr[3]_i_1_n_0 ;
  wire \o_mem_addr[3]_i_2_n_0 ;
  wire \o_mem_addr[4]_i_1_n_0 ;
  wire \o_mem_addr[4]_i_2_n_0 ;
  wire \o_mem_addr[5]_i_1_n_0 ;
  wire \o_mem_addr[5]_i_2_n_0 ;
  wire \o_mem_addr[6]_i_1_n_0 ;
  wire \o_mem_addr[6]_i_2_n_0 ;
  wire \o_mem_addr[6]_i_3_n_0 ;
  wire \o_mem_addr[7]_i_1_n_0 ;
  wire \o_mem_addr[7]_i_2_n_0 ;
  wire \o_mem_addr[7]_i_3_n_0 ;
  wire \o_mem_addr[8]_i_1_n_0 ;
  wire \o_mem_addr[8]_i_2_n_0 ;
  wire \o_mem_addr[8]_i_3_n_0 ;
  wire \o_mem_addr[9]_i_1_n_0 ;
  wire \o_mem_addr[9]_i_2_n_0 ;
  wire \o_mem_addr[9]_i_3_n_0 ;
  wire [15:0]o_mem_addr_OBUF;
  wire o_mem_en;
  wire o_mem_en_OBUF;
  wire o_mem_we;
  wire [7:0]o_z0;
  wire \o_z0[0]_i_1_n_0 ;
  wire \o_z0[1]_i_1_n_0 ;
  wire \o_z0[2]_i_1_n_0 ;
  wire \o_z0[3]_i_1_n_0 ;
  wire \o_z0[4]_i_1_n_0 ;
  wire \o_z0[5]_i_1_n_0 ;
  wire \o_z0[6]_i_1_n_0 ;
  wire \o_z0[7]_i_1_n_0 ;
  wire [7:0]o_z0_OBUF;
  wire [7:0]o_z1;
  wire \o_z1[0]_i_1_n_0 ;
  wire \o_z1[1]_i_1_n_0 ;
  wire \o_z1[2]_i_1_n_0 ;
  wire \o_z1[3]_i_1_n_0 ;
  wire \o_z1[4]_i_1_n_0 ;
  wire \o_z1[5]_i_1_n_0 ;
  wire \o_z1[6]_i_1_n_0 ;
  wire \o_z1[7]_i_1_n_0 ;
  wire [7:0]o_z1_OBUF;
  wire [7:0]o_z2;
  wire \o_z2[0]_i_1_n_0 ;
  wire \o_z2[1]_i_1_n_0 ;
  wire \o_z2[2]_i_1_n_0 ;
  wire \o_z2[3]_i_1_n_0 ;
  wire \o_z2[4]_i_1_n_0 ;
  wire \o_z2[5]_i_1_n_0 ;
  wire \o_z2[6]_i_1_n_0 ;
  wire \o_z2[7]_i_1_n_0 ;
  wire [7:0]o_z2_OBUF;
  wire [7:0]o_z3;
  wire \o_z3[0]_i_1_n_0 ;
  wire \o_z3[1]_i_1_n_0 ;
  wire \o_z3[2]_i_1_n_0 ;
  wire \o_z3[3]_i_1_n_0 ;
  wire \o_z3[4]_i_1_n_0 ;
  wire \o_z3[5]_i_1_n_0 ;
  wire \o_z3[6]_i_1_n_0 ;
  wire \o_z3[7]_i_1_n_0 ;
  wire [7:0]o_z3_OBUF;
  wire [4:2]plusOp;
  wire [15:0]reg1_data;
  wire \reg1_data[2]_i_1_n_0 ;
  wire \reg1_data_reg_n_0_[0] ;
  wire \reg1_data_reg_n_0_[10] ;
  wire \reg1_data_reg_n_0_[11] ;
  wire \reg1_data_reg_n_0_[12] ;
  wire \reg1_data_reg_n_0_[13] ;
  wire \reg1_data_reg_n_0_[14] ;
  wire \reg1_data_reg_n_0_[15] ;
  wire \reg1_data_reg_n_0_[1] ;
  wire \reg1_data_reg_n_0_[2] ;
  wire \reg1_data_reg_n_0_[3] ;
  wire \reg1_data_reg_n_0_[4] ;
  wire \reg1_data_reg_n_0_[5] ;
  wire \reg1_data_reg_n_0_[6] ;
  wire \reg1_data_reg_n_0_[7] ;
  wire \reg1_data_reg_n_0_[8] ;
  wire \reg1_data_reg_n_0_[9] ;
  wire [1:0]reg3_data;
  wire \reg3_data_reg_n_0_[0] ;
  wire \reg3_data_reg_n_0_[1] ;
  wire [7:0]reg_mem_data;
  wire reg_mem_load;
  wire regz0_data;
  wire \regz0_data_reg_n_0_[0] ;
  wire \regz0_data_reg_n_0_[1] ;
  wire \regz0_data_reg_n_0_[2] ;
  wire \regz0_data_reg_n_0_[3] ;
  wire \regz0_data_reg_n_0_[4] ;
  wire \regz0_data_reg_n_0_[5] ;
  wire \regz0_data_reg_n_0_[6] ;
  wire \regz0_data_reg_n_0_[7] ;
  wire regz1_data;
  wire \regz1_data_reg_n_0_[0] ;
  wire \regz1_data_reg_n_0_[1] ;
  wire \regz1_data_reg_n_0_[2] ;
  wire \regz1_data_reg_n_0_[3] ;
  wire \regz1_data_reg_n_0_[4] ;
  wire \regz1_data_reg_n_0_[5] ;
  wire \regz1_data_reg_n_0_[6] ;
  wire \regz1_data_reg_n_0_[7] ;
  wire regz2_data;
  wire \regz2_data_reg_n_0_[0] ;
  wire \regz2_data_reg_n_0_[1] ;
  wire \regz2_data_reg_n_0_[2] ;
  wire \regz2_data_reg_n_0_[3] ;
  wire \regz2_data_reg_n_0_[4] ;
  wire \regz2_data_reg_n_0_[5] ;
  wire \regz2_data_reg_n_0_[6] ;
  wire \regz2_data_reg_n_0_[7] ;
  wire regz3_data;
  wire \regz3_data_reg_n_0_[0] ;
  wire \regz3_data_reg_n_0_[1] ;
  wire \regz3_data_reg_n_0_[2] ;
  wire \regz3_data_reg_n_0_[3] ;
  wire \regz3_data_reg_n_0_[4] ;
  wire \regz3_data_reg_n_0_[5] ;
  wire \regz3_data_reg_n_0_[6] ;
  wire \regz3_data_reg_n_0_[7] ;

  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(count_reg__0[0]),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count[1]_i_1 
       (.I0(count_reg__0[0]),
        .I1(count_reg__0[1]),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count[2]_i_1 
       (.I0(count_reg__0[0]),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count[3]_i_1 
       (.I0(count_reg__0[1]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[2]),
        .I3(count_reg__0[3]),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count[4]_i_1 
       (.I0(count_reg__0[2]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[3]),
        .I4(count_reg__0[4]),
        .O(plusOp[4]));
  LUT2 #(
    .INIT(4'hE)) 
    \count[4]_i_2 
       (.I0(done_ok),
        .I1(i_rst_IBUF),
        .O(\count[4]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(i_start_IBUF),
        .CLR(\count[4]_i_2_n_0 ),
        .D(\count[0]_i_1_n_0 ),
        .Q(count_reg__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(i_start_IBUF),
        .CLR(\count[4]_i_2_n_0 ),
        .D(\count[1]_i_1_n_0 ),
        .Q(count_reg__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(i_start_IBUF),
        .CLR(\count[4]_i_2_n_0 ),
        .D(plusOp[2]),
        .Q(count_reg__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(i_start_IBUF),
        .CLR(\count[4]_i_2_n_0 ),
        .D(plusOp[3]),
        .Q(count_reg__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(i_start_IBUF),
        .CLR(\count[4]_i_2_n_0 ),
        .D(plusOp[4]),
        .Q(count_reg__0[4]));
  LUT6 #(
    .INIT(64'h4474FFFF44740000)) 
    \cur_state[0]_i_1 
       (.I0(i_rst_IBUF),
        .I1(cur_state[1]),
        .I2(done_ok),
        .I3(cur_state[0]),
        .I4(cur_state[3]),
        .I5(\cur_state[0]_i_2_n_0 ),
        .O(\cur_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00004777)) 
    \cur_state[0]_i_2 
       (.I0(i_rst_IBUF),
        .I1(cur_state[2]),
        .I2(i_start_IBUF),
        .I3(cur_state[1]),
        .I4(cur_state[0]),
        .O(\cur_state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0037320000323700)) 
    \cur_state[1]_i_1 
       (.I0(cur_state[3]),
        .I1(i_rst_IBUF),
        .I2(cur_state[2]),
        .I3(cur_state[1]),
        .I4(cur_state[0]),
        .I5(i_start_IBUF),
        .O(\cur_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000205F20)) 
    \cur_state[2]_i_1 
       (.I0(cur_state[0]),
        .I1(i_start_IBUF),
        .I2(cur_state[1]),
        .I3(cur_state[2]),
        .I4(i_rst_IBUF),
        .I5(cur_state[3]),
        .O(\cur_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEAAAA)) 
    \cur_state[3]_i_1 
       (.I0(cur_state[2]),
        .I1(cur_state[0]),
        .I2(i_rst_IBUF),
        .I3(done_ok),
        .I4(cur_state[3]),
        .I5(\cur_state[3]_i_3_n_0 ),
        .O(next_state));
  LUT6 #(
    .INIT(64'h000030CC0088CC88)) 
    \cur_state[3]_i_2 
       (.I0(done_ok),
        .I1(cur_state[3]),
        .I2(cur_state[2]),
        .I3(cur_state[0]),
        .I4(i_rst_IBUF),
        .I5(cur_state[1]),
        .O(\cur_state[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFBB5045)) 
    \cur_state[3]_i_3 
       (.I0(cur_state[3]),
        .I1(i_start_IBUF),
        .I2(cur_state[0]),
        .I3(i_rst_IBUF),
        .I4(cur_state[1]),
        .O(\cur_state[3]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \cur_state_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(next_state),
        .CLR(i_rst_IBUF),
        .D(\cur_state[0]_i_1_n_0 ),
        .Q(cur_state[0]));
  FDCE #(
    .INIT(1'b0)) 
    \cur_state_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(next_state),
        .CLR(i_rst_IBUF),
        .D(\cur_state[1]_i_1_n_0 ),
        .Q(cur_state[1]));
  FDCE #(
    .INIT(1'b0)) 
    \cur_state_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(next_state),
        .CLR(i_rst_IBUF),
        .D(\cur_state[2]_i_1_n_0 ),
        .Q(cur_state[2]));
  FDCE #(
    .INIT(1'b0)) 
    \cur_state_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(next_state),
        .CLR(i_rst_IBUF),
        .D(\cur_state[3]_i_2_n_0 ),
        .Q(cur_state[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    done_ok_reg
       (.CLR(1'b0),
        .D(done_ok_reg_i_1_n_0),
        .G(done_ok_reg_i_2_n_0),
        .GE(1'b1),
        .Q(done_ok));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT1 #(
    .INIT(2'h1)) 
    done_ok_reg_i_1
       (.I0(cur_state[1]),
        .O(done_ok_reg_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    done_ok_reg_i_2
       (.I0(cur_state[3]),
        .I1(cur_state[1]),
        .I2(cur_state[0]),
        .O(done_ok_reg_i_2_n_0));
  BUFG i_clk_IBUF_BUFG_inst
       (.I(i_clk_IBUF),
        .O(i_clk_IBUF_BUFG));
  IBUF i_clk_IBUF_inst
       (.I(i_clk),
        .O(i_clk_IBUF));
  IBUF \i_mem_data_IBUF[0]_inst 
       (.I(i_mem_data[0]),
        .O(i_mem_data_IBUF[0]));
  IBUF \i_mem_data_IBUF[1]_inst 
       (.I(i_mem_data[1]),
        .O(i_mem_data_IBUF[1]));
  IBUF \i_mem_data_IBUF[2]_inst 
       (.I(i_mem_data[2]),
        .O(i_mem_data_IBUF[2]));
  IBUF \i_mem_data_IBUF[3]_inst 
       (.I(i_mem_data[3]),
        .O(i_mem_data_IBUF[3]));
  IBUF \i_mem_data_IBUF[4]_inst 
       (.I(i_mem_data[4]),
        .O(i_mem_data_IBUF[4]));
  IBUF \i_mem_data_IBUF[5]_inst 
       (.I(i_mem_data[5]),
        .O(i_mem_data_IBUF[5]));
  IBUF \i_mem_data_IBUF[6]_inst 
       (.I(i_mem_data[6]),
        .O(i_mem_data_IBUF[6]));
  IBUF \i_mem_data_IBUF[7]_inst 
       (.I(i_mem_data[7]),
        .O(i_mem_data_IBUF[7]));
  IBUF i_rst_IBUF_inst
       (.I(i_rst),
        .O(i_rst_IBUF));
  IBUF i_start_IBUF_inst
       (.I(i_start),
        .O(i_start_IBUF));
  IBUF i_w_IBUF_inst
       (.I(i_w),
        .O(i_w_IBUF));
  OBUF o_done_OBUF_inst
       (.I(o_done_OBUF),
        .O(o_done));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h08)) 
    o_done_OBUF_inst_i_1
       (.I0(cur_state[1]),
        .I1(cur_state[3]),
        .I2(cur_state[0]),
        .O(o_done_OBUF));
  LUT6 #(
    .INIT(64'hCFC0AFAFCFC0A0A0)) 
    \o_mem_addr[0]_i_1 
       (.I0(\o_mem_addr[1]_i_2_n_0 ),
        .I1(\o_mem_addr[3]_i_2_n_0 ),
        .I2(count_reg__0[0]),
        .I3(\o_mem_addr[0]_i_2_n_0 ),
        .I4(count_reg__0[1]),
        .I5(\o_mem_addr[2]_i_2_n_0 ),
        .O(\o_mem_addr[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \o_mem_addr[0]_i_2 
       (.I0(\reg1_data_reg_n_0_[12] ),
        .I1(\reg1_data_reg_n_0_[4] ),
        .I2(\o_mem_addr[11]_i_4_n_0 ),
        .I3(\reg1_data_reg_n_0_[8] ),
        .I4(\o_mem_addr[11]_i_3_n_0 ),
        .I5(\reg1_data_reg_n_0_[0] ),
        .O(\o_mem_addr[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \o_mem_addr[10]_i_1 
       (.I0(\o_mem_addr[11]_i_2_n_0 ),
        .I1(count_reg__0[0]),
        .I2(\o_mem_addr[10]_i_2_n_0 ),
        .O(\o_mem_addr[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00A000A000CF00C0)) 
    \o_mem_addr[10]_i_2 
       (.I0(\reg1_data_reg_n_0_[14] ),
        .I1(\reg1_data_reg_n_0_[10] ),
        .I2(\count[1]_i_1_n_0 ),
        .I3(\o_mem_addr[11]_i_3_n_0 ),
        .I4(\reg1_data_reg_n_0_[12] ),
        .I5(\o_mem_addr[11]_i_4_n_0 ),
        .O(\o_mem_addr[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \o_mem_addr[11]_i_1 
       (.I0(\o_mem_addr[12]_i_2_n_0 ),
        .I1(count_reg__0[0]),
        .I2(\o_mem_addr[11]_i_2_n_0 ),
        .O(\o_mem_addr[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00A000A000CF00C0)) 
    \o_mem_addr[11]_i_2 
       (.I0(\reg1_data_reg_n_0_[15] ),
        .I1(\reg1_data_reg_n_0_[11] ),
        .I2(\count[1]_i_1_n_0 ),
        .I3(\o_mem_addr[11]_i_3_n_0 ),
        .I4(\reg1_data_reg_n_0_[13] ),
        .I5(\o_mem_addr[11]_i_4_n_0 ),
        .O(\o_mem_addr[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h15EA)) 
    \o_mem_addr[11]_i_3 
       (.I0(count_reg__0[2]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[3]),
        .O(\o_mem_addr[11]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \o_mem_addr[11]_i_4 
       (.I0(count_reg__0[1]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[2]),
        .O(\o_mem_addr[11]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \o_mem_addr[12]_i_1 
       (.I0(\o_mem_addr[13]_i_2_n_0 ),
        .I1(count_reg__0[0]),
        .I2(\o_mem_addr[12]_i_2_n_0 ),
        .O(\o_mem_addr[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC0000000002B0028)) 
    \o_mem_addr[12]_i_2 
       (.I0(\reg1_data_reg_n_0_[12] ),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[3]),
        .I4(\reg1_data_reg_n_0_[14] ),
        .I5(count_reg__0[2]),
        .O(\o_mem_addr[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0004FFFF00040000)) 
    \o_mem_addr[13]_i_1 
       (.I0(count_reg__0[2]),
        .I1(\reg1_data_reg_n_0_[14] ),
        .I2(count_reg__0[3]),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[0]),
        .I5(\o_mem_addr[13]_i_2_n_0 ),
        .O(\o_mem_addr[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC0000000002B0028)) 
    \o_mem_addr[13]_i_2 
       (.I0(\reg1_data_reg_n_0_[13] ),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[3]),
        .I4(\reg1_data_reg_n_0_[15] ),
        .I5(count_reg__0[2]),
        .O(\o_mem_addr[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000030000000808)) 
    \o_mem_addr[14]_i_1 
       (.I0(\reg1_data_reg_n_0_[15] ),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[2]),
        .I3(\reg1_data_reg_n_0_[14] ),
        .I4(count_reg__0[3]),
        .I5(count_reg__0[1]),
        .O(\o_mem_addr[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8888888888828282)) 
    \o_mem_addr[15]_i_1 
       (.I0(o_mem_addr0),
        .I1(count_reg__0[4]),
        .I2(count_reg__0[2]),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[1]),
        .I5(count_reg__0[3]),
        .O(\o_mem_addr[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \o_mem_addr[15]_i_2 
       (.I0(cur_state[3]),
        .I1(cur_state[0]),
        .I2(cur_state[1]),
        .I3(cur_state[2]),
        .I4(i_rst_IBUF),
        .I5(i_start_IBUF),
        .O(o_mem_addr0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \o_mem_addr[15]_i_3 
       (.I0(count_reg__0[1]),
        .I1(count_reg__0[3]),
        .I2(\reg1_data_reg_n_0_[15] ),
        .I3(count_reg__0[2]),
        .I4(count_reg__0[0]),
        .O(\o_mem_addr[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFC0AFAFCFC0A0A0)) 
    \o_mem_addr[1]_i_1 
       (.I0(\o_mem_addr[2]_i_2_n_0 ),
        .I1(\o_mem_addr[4]_i_2_n_0 ),
        .I2(count_reg__0[0]),
        .I3(\o_mem_addr[1]_i_2_n_0 ),
        .I4(count_reg__0[1]),
        .I5(\o_mem_addr[3]_i_2_n_0 ),
        .O(\o_mem_addr[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \o_mem_addr[1]_i_2 
       (.I0(\reg1_data_reg_n_0_[13] ),
        .I1(\reg1_data_reg_n_0_[5] ),
        .I2(\o_mem_addr[11]_i_4_n_0 ),
        .I3(\reg1_data_reg_n_0_[9] ),
        .I4(\o_mem_addr[11]_i_3_n_0 ),
        .I5(\reg1_data_reg_n_0_[1] ),
        .O(\o_mem_addr[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFC0AFAFCFC0A0A0)) 
    \o_mem_addr[2]_i_1 
       (.I0(\o_mem_addr[3]_i_2_n_0 ),
        .I1(\o_mem_addr[5]_i_2_n_0 ),
        .I2(count_reg__0[0]),
        .I3(\o_mem_addr[2]_i_2_n_0 ),
        .I4(count_reg__0[1]),
        .I5(\o_mem_addr[4]_i_2_n_0 ),
        .O(\o_mem_addr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \o_mem_addr[2]_i_2 
       (.I0(\reg1_data_reg_n_0_[14] ),
        .I1(\reg1_data_reg_n_0_[6] ),
        .I2(\o_mem_addr[11]_i_4_n_0 ),
        .I3(\reg1_data_reg_n_0_[10] ),
        .I4(\o_mem_addr[11]_i_3_n_0 ),
        .I5(\reg1_data_reg_n_0_[2] ),
        .O(\o_mem_addr[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFC0AFAFCFC0A0A0)) 
    \o_mem_addr[3]_i_1 
       (.I0(\o_mem_addr[4]_i_2_n_0 ),
        .I1(\o_mem_addr[6]_i_2_n_0 ),
        .I2(count_reg__0[0]),
        .I3(\o_mem_addr[3]_i_2_n_0 ),
        .I4(count_reg__0[1]),
        .I5(\o_mem_addr[5]_i_2_n_0 ),
        .O(\o_mem_addr[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \o_mem_addr[3]_i_2 
       (.I0(\reg1_data_reg_n_0_[15] ),
        .I1(\reg1_data_reg_n_0_[7] ),
        .I2(\o_mem_addr[11]_i_4_n_0 ),
        .I3(\reg1_data_reg_n_0_[11] ),
        .I4(\o_mem_addr[11]_i_3_n_0 ),
        .I5(\reg1_data_reg_n_0_[3] ),
        .O(\o_mem_addr[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFC0AFAFCFC0A0A0)) 
    \o_mem_addr[4]_i_1 
       (.I0(\o_mem_addr[5]_i_2_n_0 ),
        .I1(\o_mem_addr[7]_i_2_n_0 ),
        .I2(count_reg__0[0]),
        .I3(\o_mem_addr[4]_i_2_n_0 ),
        .I4(count_reg__0[1]),
        .I5(\o_mem_addr[6]_i_2_n_0 ),
        .O(\o_mem_addr[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \o_mem_addr[4]_i_2 
       (.I0(\reg1_data_reg_n_0_[8] ),
        .I1(\o_mem_addr[11]_i_4_n_0 ),
        .I2(\reg1_data_reg_n_0_[12] ),
        .I3(\o_mem_addr[11]_i_3_n_0 ),
        .I4(\reg1_data_reg_n_0_[4] ),
        .O(\o_mem_addr[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFC0AFAFCFC0A0A0)) 
    \o_mem_addr[5]_i_1 
       (.I0(\o_mem_addr[6]_i_2_n_0 ),
        .I1(\o_mem_addr[6]_i_3_n_0 ),
        .I2(count_reg__0[0]),
        .I3(\o_mem_addr[5]_i_2_n_0 ),
        .I4(count_reg__0[1]),
        .I5(\o_mem_addr[7]_i_2_n_0 ),
        .O(\o_mem_addr[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \o_mem_addr[5]_i_2 
       (.I0(\reg1_data_reg_n_0_[9] ),
        .I1(\o_mem_addr[11]_i_4_n_0 ),
        .I2(\reg1_data_reg_n_0_[13] ),
        .I3(\o_mem_addr[11]_i_3_n_0 ),
        .I4(\reg1_data_reg_n_0_[5] ),
        .O(\o_mem_addr[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFC0AFAFCFC0A0A0)) 
    \o_mem_addr[6]_i_1 
       (.I0(\o_mem_addr[7]_i_2_n_0 ),
        .I1(\o_mem_addr[7]_i_3_n_0 ),
        .I2(count_reg__0[0]),
        .I3(\o_mem_addr[6]_i_2_n_0 ),
        .I4(count_reg__0[1]),
        .I5(\o_mem_addr[6]_i_3_n_0 ),
        .O(\o_mem_addr[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \o_mem_addr[6]_i_2 
       (.I0(\reg1_data_reg_n_0_[10] ),
        .I1(\o_mem_addr[11]_i_4_n_0 ),
        .I2(\reg1_data_reg_n_0_[14] ),
        .I3(\o_mem_addr[11]_i_3_n_0 ),
        .I4(\reg1_data_reg_n_0_[6] ),
        .O(\o_mem_addr[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEA802A80003F0000)) 
    \o_mem_addr[6]_i_3 
       (.I0(\reg1_data_reg_n_0_[12] ),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[0]),
        .I3(count_reg__0[2]),
        .I4(\reg1_data_reg_n_0_[8] ),
        .I5(count_reg__0[3]),
        .O(\o_mem_addr[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \o_mem_addr[7]_i_1 
       (.I0(\o_mem_addr[8]_i_2_n_0 ),
        .I1(count_reg__0[0]),
        .I2(\o_mem_addr[7]_i_2_n_0 ),
        .I3(count_reg__0[1]),
        .I4(\o_mem_addr[7]_i_3_n_0 ),
        .O(\o_mem_addr[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \o_mem_addr[7]_i_2 
       (.I0(\reg1_data_reg_n_0_[11] ),
        .I1(\o_mem_addr[11]_i_4_n_0 ),
        .I2(\reg1_data_reg_n_0_[15] ),
        .I3(\o_mem_addr[11]_i_3_n_0 ),
        .I4(\reg1_data_reg_n_0_[7] ),
        .O(\o_mem_addr[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEA802A80003F0000)) 
    \o_mem_addr[7]_i_3 
       (.I0(\reg1_data_reg_n_0_[13] ),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[0]),
        .I3(count_reg__0[2]),
        .I4(\reg1_data_reg_n_0_[9] ),
        .I5(count_reg__0[3]),
        .O(\o_mem_addr[7]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \o_mem_addr[8]_i_1 
       (.I0(\o_mem_addr[9]_i_2_n_0 ),
        .I1(count_reg__0[0]),
        .I2(\o_mem_addr[8]_i_2_n_0 ),
        .O(\o_mem_addr[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \o_mem_addr[8]_i_2 
       (.I0(\reg1_data_reg_n_0_[12] ),
        .I1(\o_mem_addr[11]_i_4_n_0 ),
        .I2(\reg1_data_reg_n_0_[8] ),
        .I3(\o_mem_addr[11]_i_3_n_0 ),
        .I4(\count[1]_i_1_n_0 ),
        .I5(\o_mem_addr[8]_i_3_n_0 ),
        .O(\o_mem_addr[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEA802A80003F0000)) 
    \o_mem_addr[8]_i_3 
       (.I0(\reg1_data_reg_n_0_[14] ),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[0]),
        .I3(count_reg__0[2]),
        .I4(\reg1_data_reg_n_0_[10] ),
        .I5(count_reg__0[3]),
        .O(\o_mem_addr[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \o_mem_addr[9]_i_1 
       (.I0(\o_mem_addr[10]_i_2_n_0 ),
        .I1(count_reg__0[0]),
        .I2(\o_mem_addr[9]_i_2_n_0 ),
        .O(\o_mem_addr[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00B8FFFF00B80000)) 
    \o_mem_addr[9]_i_2 
       (.I0(\reg1_data_reg_n_0_[13] ),
        .I1(\o_mem_addr[11]_i_4_n_0 ),
        .I2(\reg1_data_reg_n_0_[9] ),
        .I3(\o_mem_addr[11]_i_3_n_0 ),
        .I4(\count[1]_i_1_n_0 ),
        .I5(\o_mem_addr[9]_i_3_n_0 ),
        .O(\o_mem_addr[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEA802A80003F0000)) 
    \o_mem_addr[9]_i_3 
       (.I0(\reg1_data_reg_n_0_[15] ),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[0]),
        .I3(count_reg__0[2]),
        .I4(\reg1_data_reg_n_0_[11] ),
        .I5(count_reg__0[3]),
        .O(\o_mem_addr[9]_i_3_n_0 ));
  OBUF \o_mem_addr_OBUF[0]_inst 
       (.I(o_mem_addr_OBUF[0]),
        .O(o_mem_addr[0]));
  OBUF \o_mem_addr_OBUF[10]_inst 
       (.I(o_mem_addr_OBUF[10]),
        .O(o_mem_addr[10]));
  OBUF \o_mem_addr_OBUF[11]_inst 
       (.I(o_mem_addr_OBUF[11]),
        .O(o_mem_addr[11]));
  OBUF \o_mem_addr_OBUF[12]_inst 
       (.I(o_mem_addr_OBUF[12]),
        .O(o_mem_addr[12]));
  OBUF \o_mem_addr_OBUF[13]_inst 
       (.I(o_mem_addr_OBUF[13]),
        .O(o_mem_addr[13]));
  OBUF \o_mem_addr_OBUF[14]_inst 
       (.I(o_mem_addr_OBUF[14]),
        .O(o_mem_addr[14]));
  OBUF \o_mem_addr_OBUF[15]_inst 
       (.I(o_mem_addr_OBUF[15]),
        .O(o_mem_addr[15]));
  OBUF \o_mem_addr_OBUF[1]_inst 
       (.I(o_mem_addr_OBUF[1]),
        .O(o_mem_addr[1]));
  OBUF \o_mem_addr_OBUF[2]_inst 
       (.I(o_mem_addr_OBUF[2]),
        .O(o_mem_addr[2]));
  OBUF \o_mem_addr_OBUF[3]_inst 
       (.I(o_mem_addr_OBUF[3]),
        .O(o_mem_addr[3]));
  OBUF \o_mem_addr_OBUF[4]_inst 
       (.I(o_mem_addr_OBUF[4]),
        .O(o_mem_addr[4]));
  OBUF \o_mem_addr_OBUF[5]_inst 
       (.I(o_mem_addr_OBUF[5]),
        .O(o_mem_addr[5]));
  OBUF \o_mem_addr_OBUF[6]_inst 
       (.I(o_mem_addr_OBUF[6]),
        .O(o_mem_addr[6]));
  OBUF \o_mem_addr_OBUF[7]_inst 
       (.I(o_mem_addr_OBUF[7]),
        .O(o_mem_addr[7]));
  OBUF \o_mem_addr_OBUF[8]_inst 
       (.I(o_mem_addr_OBUF[8]),
        .O(o_mem_addr[8]));
  OBUF \o_mem_addr_OBUF[9]_inst 
       (.I(o_mem_addr_OBUF[9]),
        .O(o_mem_addr[9]));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[0]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[0]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[10] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[10]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[10]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[11] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[11]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[11]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[12] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[12]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[12]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[13] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[13]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[13]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[14] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[14]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[14]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[15] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[15]_i_3_n_0 ),
        .Q(o_mem_addr_OBUF[15]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[1]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[1]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[2]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[2]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[3]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[3]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[4]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[4]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[5] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[5]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[5]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[6] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[6]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[6]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[7] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[7]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[7]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[8] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[8]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[8]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \o_mem_addr_reg[9] 
       (.C(i_clk_IBUF_BUFG),
        .CE(o_mem_addr0),
        .D(\o_mem_addr[9]_i_1_n_0 ),
        .Q(o_mem_addr_OBUF[9]),
        .R(\o_mem_addr[15]_i_1_n_0 ));
  OBUF o_mem_en_OBUF_inst
       (.I(o_mem_en_OBUF),
        .O(o_mem_en));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h04)) 
    o_mem_en_OBUF_inst_i_1
       (.I0(cur_state[0]),
        .I1(cur_state[2]),
        .I2(cur_state[1]),
        .O(o_mem_en_OBUF));
  OBUF o_mem_we_OBUF_inst
       (.I(1'b0),
        .O(o_mem_we));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0[0]_i_1 
       (.I0(done_ok),
        .I1(\regz0_data_reg_n_0_[0] ),
        .O(\o_z0[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0[1]_i_1 
       (.I0(done_ok),
        .I1(\regz0_data_reg_n_0_[1] ),
        .O(\o_z0[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0[2]_i_1 
       (.I0(done_ok),
        .I1(\regz0_data_reg_n_0_[2] ),
        .O(\o_z0[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0[3]_i_1 
       (.I0(done_ok),
        .I1(\regz0_data_reg_n_0_[3] ),
        .O(\o_z0[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0[4]_i_1 
       (.I0(done_ok),
        .I1(\regz0_data_reg_n_0_[4] ),
        .O(\o_z0[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0[5]_i_1 
       (.I0(done_ok),
        .I1(\regz0_data_reg_n_0_[5] ),
        .O(\o_z0[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0[6]_i_1 
       (.I0(done_ok),
        .I1(\regz0_data_reg_n_0_[6] ),
        .O(\o_z0[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z0[7]_i_1 
       (.I0(done_ok),
        .I1(\regz0_data_reg_n_0_[7] ),
        .O(\o_z0[7]_i_1_n_0 ));
  OBUF \o_z0_OBUF[0]_inst 
       (.I(o_z0_OBUF[0]),
        .O(o_z0[0]));
  OBUF \o_z0_OBUF[1]_inst 
       (.I(o_z0_OBUF[1]),
        .O(o_z0[1]));
  OBUF \o_z0_OBUF[2]_inst 
       (.I(o_z0_OBUF[2]),
        .O(o_z0[2]));
  OBUF \o_z0_OBUF[3]_inst 
       (.I(o_z0_OBUF[3]),
        .O(o_z0[3]));
  OBUF \o_z0_OBUF[4]_inst 
       (.I(o_z0_OBUF[4]),
        .O(o_z0[4]));
  OBUF \o_z0_OBUF[5]_inst 
       (.I(o_z0_OBUF[5]),
        .O(o_z0[5]));
  OBUF \o_z0_OBUF[6]_inst 
       (.I(o_z0_OBUF[6]),
        .O(o_z0[6]));
  OBUF \o_z0_OBUF[7]_inst 
       (.I(o_z0_OBUF[7]),
        .O(o_z0[7]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z0_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z0[0]_i_1_n_0 ),
        .Q(o_z0_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z0_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z0[1]_i_1_n_0 ),
        .Q(o_z0_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z0_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z0[2]_i_1_n_0 ),
        .Q(o_z0_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z0_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z0[3]_i_1_n_0 ),
        .Q(o_z0_OBUF[3]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z0_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z0[4]_i_1_n_0 ),
        .Q(o_z0_OBUF[4]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z0_reg[5] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z0[5]_i_1_n_0 ),
        .Q(o_z0_OBUF[5]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z0_reg[6] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z0[6]_i_1_n_0 ),
        .Q(o_z0_OBUF[6]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z0_reg[7] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z0[7]_i_1_n_0 ),
        .Q(o_z0_OBUF[7]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1[0]_i_1 
       (.I0(done_ok),
        .I1(\regz1_data_reg_n_0_[0] ),
        .O(\o_z1[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1[1]_i_1 
       (.I0(done_ok),
        .I1(\regz1_data_reg_n_0_[1] ),
        .O(\o_z1[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1[2]_i_1 
       (.I0(done_ok),
        .I1(\regz1_data_reg_n_0_[2] ),
        .O(\o_z1[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1[3]_i_1 
       (.I0(done_ok),
        .I1(\regz1_data_reg_n_0_[3] ),
        .O(\o_z1[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1[4]_i_1 
       (.I0(done_ok),
        .I1(\regz1_data_reg_n_0_[4] ),
        .O(\o_z1[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1[5]_i_1 
       (.I0(done_ok),
        .I1(\regz1_data_reg_n_0_[5] ),
        .O(\o_z1[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1[6]_i_1 
       (.I0(done_ok),
        .I1(\regz1_data_reg_n_0_[6] ),
        .O(\o_z1[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z1[7]_i_1 
       (.I0(done_ok),
        .I1(\regz1_data_reg_n_0_[7] ),
        .O(\o_z1[7]_i_1_n_0 ));
  OBUF \o_z1_OBUF[0]_inst 
       (.I(o_z1_OBUF[0]),
        .O(o_z1[0]));
  OBUF \o_z1_OBUF[1]_inst 
       (.I(o_z1_OBUF[1]),
        .O(o_z1[1]));
  OBUF \o_z1_OBUF[2]_inst 
       (.I(o_z1_OBUF[2]),
        .O(o_z1[2]));
  OBUF \o_z1_OBUF[3]_inst 
       (.I(o_z1_OBUF[3]),
        .O(o_z1[3]));
  OBUF \o_z1_OBUF[4]_inst 
       (.I(o_z1_OBUF[4]),
        .O(o_z1[4]));
  OBUF \o_z1_OBUF[5]_inst 
       (.I(o_z1_OBUF[5]),
        .O(o_z1[5]));
  OBUF \o_z1_OBUF[6]_inst 
       (.I(o_z1_OBUF[6]),
        .O(o_z1[6]));
  OBUF \o_z1_OBUF[7]_inst 
       (.I(o_z1_OBUF[7]),
        .O(o_z1[7]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z1_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z1[0]_i_1_n_0 ),
        .Q(o_z1_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z1_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z1[1]_i_1_n_0 ),
        .Q(o_z1_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z1_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z1[2]_i_1_n_0 ),
        .Q(o_z1_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z1_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z1[3]_i_1_n_0 ),
        .Q(o_z1_OBUF[3]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z1_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z1[4]_i_1_n_0 ),
        .Q(o_z1_OBUF[4]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z1_reg[5] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z1[5]_i_1_n_0 ),
        .Q(o_z1_OBUF[5]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z1_reg[6] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z1[6]_i_1_n_0 ),
        .Q(o_z1_OBUF[6]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z1_reg[7] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z1[7]_i_1_n_0 ),
        .Q(o_z1_OBUF[7]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2[0]_i_1 
       (.I0(done_ok),
        .I1(\regz2_data_reg_n_0_[0] ),
        .O(\o_z2[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2[1]_i_1 
       (.I0(done_ok),
        .I1(\regz2_data_reg_n_0_[1] ),
        .O(\o_z2[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2[2]_i_1 
       (.I0(done_ok),
        .I1(\regz2_data_reg_n_0_[2] ),
        .O(\o_z2[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2[3]_i_1 
       (.I0(done_ok),
        .I1(\regz2_data_reg_n_0_[3] ),
        .O(\o_z2[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2[4]_i_1 
       (.I0(done_ok),
        .I1(\regz2_data_reg_n_0_[4] ),
        .O(\o_z2[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2[5]_i_1 
       (.I0(done_ok),
        .I1(\regz2_data_reg_n_0_[5] ),
        .O(\o_z2[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2[6]_i_1 
       (.I0(done_ok),
        .I1(\regz2_data_reg_n_0_[6] ),
        .O(\o_z2[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z2[7]_i_1 
       (.I0(done_ok),
        .I1(\regz2_data_reg_n_0_[7] ),
        .O(\o_z2[7]_i_1_n_0 ));
  OBUF \o_z2_OBUF[0]_inst 
       (.I(o_z2_OBUF[0]),
        .O(o_z2[0]));
  OBUF \o_z2_OBUF[1]_inst 
       (.I(o_z2_OBUF[1]),
        .O(o_z2[1]));
  OBUF \o_z2_OBUF[2]_inst 
       (.I(o_z2_OBUF[2]),
        .O(o_z2[2]));
  OBUF \o_z2_OBUF[3]_inst 
       (.I(o_z2_OBUF[3]),
        .O(o_z2[3]));
  OBUF \o_z2_OBUF[4]_inst 
       (.I(o_z2_OBUF[4]),
        .O(o_z2[4]));
  OBUF \o_z2_OBUF[5]_inst 
       (.I(o_z2_OBUF[5]),
        .O(o_z2[5]));
  OBUF \o_z2_OBUF[6]_inst 
       (.I(o_z2_OBUF[6]),
        .O(o_z2[6]));
  OBUF \o_z2_OBUF[7]_inst 
       (.I(o_z2_OBUF[7]),
        .O(o_z2[7]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z2_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z2[0]_i_1_n_0 ),
        .Q(o_z2_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z2_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z2[1]_i_1_n_0 ),
        .Q(o_z2_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z2_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z2[2]_i_1_n_0 ),
        .Q(o_z2_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z2_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z2[3]_i_1_n_0 ),
        .Q(o_z2_OBUF[3]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z2_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z2[4]_i_1_n_0 ),
        .Q(o_z2_OBUF[4]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z2_reg[5] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z2[5]_i_1_n_0 ),
        .Q(o_z2_OBUF[5]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z2_reg[6] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z2[6]_i_1_n_0 ),
        .Q(o_z2_OBUF[6]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z2_reg[7] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z2[7]_i_1_n_0 ),
        .Q(o_z2_OBUF[7]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3[0]_i_1 
       (.I0(done_ok),
        .I1(\regz3_data_reg_n_0_[0] ),
        .O(\o_z3[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3[1]_i_1 
       (.I0(done_ok),
        .I1(\regz3_data_reg_n_0_[1] ),
        .O(\o_z3[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3[2]_i_1 
       (.I0(done_ok),
        .I1(\regz3_data_reg_n_0_[2] ),
        .O(\o_z3[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3[3]_i_1 
       (.I0(done_ok),
        .I1(\regz3_data_reg_n_0_[3] ),
        .O(\o_z3[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3[4]_i_1 
       (.I0(done_ok),
        .I1(\regz3_data_reg_n_0_[4] ),
        .O(\o_z3[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3[5]_i_1 
       (.I0(done_ok),
        .I1(\regz3_data_reg_n_0_[5] ),
        .O(\o_z3[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3[6]_i_1 
       (.I0(done_ok),
        .I1(\regz3_data_reg_n_0_[6] ),
        .O(\o_z3[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \o_z3[7]_i_1 
       (.I0(done_ok),
        .I1(\regz3_data_reg_n_0_[7] ),
        .O(\o_z3[7]_i_1_n_0 ));
  OBUF \o_z3_OBUF[0]_inst 
       (.I(o_z3_OBUF[0]),
        .O(o_z3[0]));
  OBUF \o_z3_OBUF[1]_inst 
       (.I(o_z3_OBUF[1]),
        .O(o_z3[1]));
  OBUF \o_z3_OBUF[2]_inst 
       (.I(o_z3_OBUF[2]),
        .O(o_z3[2]));
  OBUF \o_z3_OBUF[3]_inst 
       (.I(o_z3_OBUF[3]),
        .O(o_z3[3]));
  OBUF \o_z3_OBUF[4]_inst 
       (.I(o_z3_OBUF[4]),
        .O(o_z3[4]));
  OBUF \o_z3_OBUF[5]_inst 
       (.I(o_z3_OBUF[5]),
        .O(o_z3[5]));
  OBUF \o_z3_OBUF[6]_inst 
       (.I(o_z3_OBUF[6]),
        .O(o_z3[6]));
  OBUF \o_z3_OBUF[7]_inst 
       (.I(o_z3_OBUF[7]),
        .O(o_z3[7]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z3_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z3[0]_i_1_n_0 ),
        .Q(o_z3_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z3_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z3[1]_i_1_n_0 ),
        .Q(o_z3_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z3_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z3[2]_i_1_n_0 ),
        .Q(o_z3_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z3_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z3[3]_i_1_n_0 ),
        .Q(o_z3_OBUF[3]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z3_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z3[4]_i_1_n_0 ),
        .Q(o_z3_OBUF[4]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z3_reg[5] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z3[5]_i_1_n_0 ),
        .Q(o_z3_OBUF[5]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z3_reg[6] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z3[6]_i_1_n_0 ),
        .Q(o_z3_OBUF[6]));
  FDCE #(
    .INIT(1'b0)) 
    \o_z3_reg[7] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_rst_IBUF),
        .D(\o_z3[7]_i_1_n_0 ),
        .Q(o_z3_OBUF[7]));
  LUT3 #(
    .INIT(8'h80)) 
    \reg1_data[0]_i_1 
       (.I0(count_reg__0[4]),
        .I1(i_start_IBUF),
        .I2(count_reg__0[0]),
        .O(reg1_data[0]));
  LUT5 #(
    .INIT(32'h40000000)) 
    \reg1_data[10]_i_1 
       (.I0(count_reg__0[3]),
        .I1(i_start_IBUF),
        .I2(count_reg__0[2]),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[1]),
        .O(reg1_data[10]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \reg1_data[11]_i_1 
       (.I0(count_reg__0[3]),
        .I1(count_reg__0[0]),
        .I2(i_start_IBUF),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[2]),
        .O(reg1_data[11]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \reg1_data[12]_i_1 
       (.I0(count_reg__0[3]),
        .I1(count_reg__0[1]),
        .I2(i_start_IBUF),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[2]),
        .O(reg1_data[12]));
  LUT5 #(
    .INIT(32'h01000000)) 
    \reg1_data[13]_i_1 
       (.I0(count_reg__0[3]),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[0]),
        .I3(count_reg__0[2]),
        .I4(i_start_IBUF),
        .O(reg1_data[13]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \reg1_data[14]_i_1 
       (.I0(count_reg__0[3]),
        .I1(count_reg__0[2]),
        .I2(i_start_IBUF),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[0]),
        .O(reg1_data[14]));
  LUT5 #(
    .INIT(32'h01000000)) 
    \reg1_data[15]_i_1 
       (.I0(count_reg__0[3]),
        .I1(count_reg__0[2]),
        .I2(count_reg__0[0]),
        .I3(count_reg__0[1]),
        .I4(i_start_IBUF),
        .O(reg1_data[15]));
  LUT3 #(
    .INIT(8'h08)) 
    \reg1_data[1]_i_1 
       (.I0(count_reg__0[4]),
        .I1(i_start_IBUF),
        .I2(count_reg__0[0]),
        .O(reg1_data[1]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \reg1_data[2]_i_1 
       (.I0(count_reg__0[2]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[3]),
        .I4(i_start_IBUF),
        .O(\reg1_data[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \reg1_data[3]_i_1 
       (.I0(count_reg__0[0]),
        .I1(count_reg__0[3]),
        .I2(i_start_IBUF),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[2]),
        .O(reg1_data[3]));
  LUT5 #(
    .INIT(32'h40000000)) 
    \reg1_data[4]_i_1 
       (.I0(count_reg__0[1]),
        .I1(count_reg__0[3]),
        .I2(i_start_IBUF),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[2]),
        .O(reg1_data[4]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \reg1_data[5]_i_1 
       (.I0(count_reg__0[1]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[3]),
        .I3(count_reg__0[2]),
        .I4(i_start_IBUF),
        .O(reg1_data[5]));
  LUT5 #(
    .INIT(32'h40000000)) 
    \reg1_data[6]_i_1 
       (.I0(count_reg__0[2]),
        .I1(count_reg__0[3]),
        .I2(i_start_IBUF),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[0]),
        .O(reg1_data[6]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \reg1_data[7]_i_1 
       (.I0(count_reg__0[2]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[3]),
        .I3(count_reg__0[1]),
        .I4(i_start_IBUF),
        .O(reg1_data[7]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \reg1_data[8]_i_1 
       (.I0(count_reg__0[2]),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[3]),
        .I3(count_reg__0[0]),
        .I4(i_start_IBUF),
        .O(reg1_data[8]));
  LUT5 #(
    .INIT(32'h01000000)) 
    \reg1_data[9]_i_1 
       (.I0(count_reg__0[2]),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[0]),
        .I3(i_start_IBUF),
        .I4(count_reg__0[3]),
        .O(reg1_data[9]));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[0]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[10] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[10]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[10] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[11] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[11]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[11] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[12] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[12]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[12] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[13] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[13]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[13] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[14] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[14]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[14] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[15] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[15]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[15] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[1]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(\reg1_data[2]_i_1_n_0 ),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[3]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[4]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[5] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[5]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[6] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[6]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[7] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[7]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[7] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[8] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[8]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[8] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg1_data_reg[9] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg1_data[9]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg1_data_reg_n_0_[9] ));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    \reg3_data[0]_i_1 
       (.I0(count_reg__0[3]),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[0]),
        .I3(i_start_IBUF),
        .I4(count_reg__0[2]),
        .I5(count_reg__0[4]),
        .O(reg3_data[0]));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \reg3_data[1]_i_1 
       (.I0(count_reg__0[3]),
        .I1(count_reg__0[1]),
        .I2(i_start_IBUF),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[2]),
        .I5(count_reg__0[4]),
        .O(reg3_data[1]));
  FDCE #(
    .INIT(1'b0)) 
    \reg3_data_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg3_data[0]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg3_data_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \reg3_data_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg3_data[1]),
        .CLR(i_rst_IBUF),
        .D(i_w_IBUF),
        .Q(\reg3_data_reg_n_0_[1] ));
  LUT3 #(
    .INIT(8'h08)) 
    \reg_mem_data[7]_i_1 
       (.I0(cur_state[2]),
        .I1(cur_state[0]),
        .I2(cur_state[1]),
        .O(reg_mem_load));
  FDCE #(
    .INIT(1'b0)) 
    \reg_mem_data_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg_mem_load),
        .CLR(i_rst_IBUF),
        .D(i_mem_data_IBUF[0]),
        .Q(reg_mem_data[0]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_mem_data_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg_mem_load),
        .CLR(i_rst_IBUF),
        .D(i_mem_data_IBUF[1]),
        .Q(reg_mem_data[1]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_mem_data_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg_mem_load),
        .CLR(i_rst_IBUF),
        .D(i_mem_data_IBUF[2]),
        .Q(reg_mem_data[2]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_mem_data_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg_mem_load),
        .CLR(i_rst_IBUF),
        .D(i_mem_data_IBUF[3]),
        .Q(reg_mem_data[3]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_mem_data_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg_mem_load),
        .CLR(i_rst_IBUF),
        .D(i_mem_data_IBUF[4]),
        .Q(reg_mem_data[4]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_mem_data_reg[5] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg_mem_load),
        .CLR(i_rst_IBUF),
        .D(i_mem_data_IBUF[5]),
        .Q(reg_mem_data[5]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_mem_data_reg[6] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg_mem_load),
        .CLR(i_rst_IBUF),
        .D(i_mem_data_IBUF[6]),
        .Q(reg_mem_data[6]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_mem_data_reg[7] 
       (.C(i_clk_IBUF_BUFG),
        .CE(reg_mem_load),
        .CLR(i_rst_IBUF),
        .D(i_mem_data_IBUF[7]),
        .Q(reg_mem_data[7]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \regz0_data[7]_i_1 
       (.I0(\reg3_data_reg_n_0_[0] ),
        .I1(\reg3_data_reg_n_0_[1] ),
        .I2(cur_state[0]),
        .I3(cur_state[2]),
        .I4(cur_state[1]),
        .O(regz0_data));
  FDCE #(
    .INIT(1'b0)) 
    \regz0_data_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz0_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[0]),
        .Q(\regz0_data_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz0_data_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz0_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[1]),
        .Q(\regz0_data_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz0_data_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz0_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[2]),
        .Q(\regz0_data_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz0_data_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz0_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[3]),
        .Q(\regz0_data_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz0_data_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz0_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[4]),
        .Q(\regz0_data_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz0_data_reg[5] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz0_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[5]),
        .Q(\regz0_data_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz0_data_reg[6] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz0_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[6]),
        .Q(\regz0_data_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz0_data_reg[7] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz0_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[7]),
        .Q(\regz0_data_reg_n_0_[7] ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \regz1_data[7]_i_1 
       (.I0(\reg3_data_reg_n_0_[1] ),
        .I1(\reg3_data_reg_n_0_[0] ),
        .I2(cur_state[0]),
        .I3(cur_state[2]),
        .I4(cur_state[1]),
        .O(regz1_data));
  FDCE #(
    .INIT(1'b0)) 
    \regz1_data_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz1_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[0]),
        .Q(\regz1_data_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz1_data_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz1_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[1]),
        .Q(\regz1_data_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz1_data_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz1_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[2]),
        .Q(\regz1_data_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz1_data_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz1_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[3]),
        .Q(\regz1_data_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz1_data_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz1_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[4]),
        .Q(\regz1_data_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz1_data_reg[5] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz1_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[5]),
        .Q(\regz1_data_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz1_data_reg[6] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz1_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[6]),
        .Q(\regz1_data_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz1_data_reg[7] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz1_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[7]),
        .Q(\regz1_data_reg_n_0_[7] ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \regz2_data[7]_i_1 
       (.I0(\reg3_data_reg_n_0_[0] ),
        .I1(\reg3_data_reg_n_0_[1] ),
        .I2(cur_state[0]),
        .I3(cur_state[2]),
        .I4(cur_state[1]),
        .O(regz2_data));
  FDCE #(
    .INIT(1'b0)) 
    \regz2_data_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz2_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[0]),
        .Q(\regz2_data_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz2_data_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz2_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[1]),
        .Q(\regz2_data_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz2_data_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz2_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[2]),
        .Q(\regz2_data_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz2_data_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz2_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[3]),
        .Q(\regz2_data_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz2_data_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz2_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[4]),
        .Q(\regz2_data_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz2_data_reg[5] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz2_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[5]),
        .Q(\regz2_data_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz2_data_reg[6] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz2_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[6]),
        .Q(\regz2_data_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz2_data_reg[7] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz2_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[7]),
        .Q(\regz2_data_reg_n_0_[7] ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \regz3_data[7]_i_1 
       (.I0(\reg3_data_reg_n_0_[0] ),
        .I1(\reg3_data_reg_n_0_[1] ),
        .I2(cur_state[0]),
        .I3(cur_state[2]),
        .I4(cur_state[1]),
        .O(regz3_data));
  FDCE #(
    .INIT(1'b0)) 
    \regz3_data_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz3_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[0]),
        .Q(\regz3_data_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz3_data_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz3_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[1]),
        .Q(\regz3_data_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz3_data_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz3_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[2]),
        .Q(\regz3_data_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz3_data_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz3_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[3]),
        .Q(\regz3_data_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz3_data_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz3_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[4]),
        .Q(\regz3_data_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz3_data_reg[5] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz3_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[5]),
        .Q(\regz3_data_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz3_data_reg[6] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz3_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[6]),
        .Q(\regz3_data_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \regz3_data_reg[7] 
       (.C(i_clk_IBUF_BUFG),
        .CE(regz3_data),
        .CLR(i_rst_IBUF),
        .D(reg_mem_data[7]),
        .Q(\regz3_data_reg_n_0_[7] ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif