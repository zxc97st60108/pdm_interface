// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:MYIP_TOP:1.0
// IP Revision: 36

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_MYIP_TOP_0_0 (
  g_hclk_es1,
  hreset_n,
  haddr,
  htrans,
  hwrite,
  hsize,
  hburst,
  hwdata,
  hready,
  hprot,
  hsel_es1,
  hrdata_es1,
  hresp_es1,
  hreadyout_es1,
  pdm_in,
  pdm_signal
);

input wire g_hclk_es1;
input wire hreset_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:ahblite:2.0 ahb_system HADDR" *)
input wire [31 : 0] haddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:ahblite:2.0 ahb_system HTRANS" *)
input wire [1 : 0] htrans;
(* X_INTERFACE_INFO = "xilinx.com:interface:ahblite:2.0 ahb_system HWRITE" *)
input wire hwrite;
(* X_INTERFACE_INFO = "xilinx.com:interface:ahblite:2.0 ahb_system HSIZE" *)
input wire [2 : 0] hsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:ahblite:2.0 ahb_system HBURST" *)
input wire [2 : 0] hburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:ahblite:2.0 ahb_system HWDATA" *)
input wire [31 : 0] hwdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:ahblite:2.0 ahb_system HREADY_IN" *)
input wire hready;
(* X_INTERFACE_INFO = "xilinx.com:interface:ahblite:2.0 ahb_system HPROT" *)
input wire [3 : 0] hprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:ahblite:2.0 ahb_system SEL" *)
input wire hsel_es1;
(* X_INTERFACE_INFO = "xilinx.com:interface:ahblite:2.0 ahb_system HRDATA" *)
output wire [31 : 0] hrdata_es1;
(* X_INTERFACE_INFO = "xilinx.com:interface:ahblite:2.0 ahb_system HRESP" *)
output wire hresp_es1;
(* X_INTERFACE_INFO = "xilinx.com:interface:ahblite:2.0 ahb_system HREADY_OUT" *)
output wire hreadyout_es1;
input wire pdm_in;
input wire pdm_signal;

  MYIP_TOP inst (
    .g_hclk_es1(g_hclk_es1),
    .hreset_n(hreset_n),
    .haddr(haddr),
    .htrans(htrans),
    .hwrite(hwrite),
    .hsize(hsize),
    .hburst(hburst),
    .hwdata(hwdata),
    .hready(hready),
    .hprot(hprot),
    .hsel_es1(hsel_es1),
    .hrdata_es1(hrdata_es1),
    .hresp_es1(hresp_es1),
    .hreadyout_es1(hreadyout_es1),
    .pdm_in(pdm_in),
    .pdm_signal(pdm_signal)
  );
endmodule
