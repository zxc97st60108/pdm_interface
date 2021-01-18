
module  MYIP_TOP (
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
            // pdm_config
            pdm_in,
            pdm_signal

        );

input	    g_hclk_es1;	       // AHB clock for HDMA
input        hreset_n;	       // AHB Reset, active low
input[31:0]  haddr;  	       // AHB address bus
input[1:0]   htrans; 	       // Transfer type
input        hwrite; 	       // Transfer direction
input[3:0]       hprot;
input[2:0]   hsize;  	       // Transfer size
input[2:0]   hburst; 	       // Transfer burst type
input[31:0]  hwdata; 	       // AHB write data bus
input        hready; 	       // Transfer ready
// input [1:0] pdm_config;
input pdm_signal;
input pdm_in;

input			 hsel_es1;               // Chip select for External Slave
output[31:0] hrdata_es1;     	    // AHB read data bus from External Slave
output       hreadyout_es1;  	    // Transfer ready from External Slave
output       hresp_es1;              // Transfer response from External Slave


// -----------------------------------------------------------------------------
// Constant declarations
// -----------------------------------------------------------------------------
// HTRANS transfer type signal encoding
// parameter TRN_IDLE   = 2'b00;
// parameter TRN_BUSY   = 2'b01;
// parameter TRN_NONSEQ = 2'b10;
// parameter TRN_SEQ    = 2'b11;

// HRESP transfer response signal encoding
// parameter RSP_OKAY   = 2'b00;
// parameter RSP_ERROR  = 2'b01;
// parameter RSP_RETRY  = 2'b10;
// parameter RSP_SPLIT  = 2'b11;

//--------------------------------------------------------------------------
// Behavior
//--------------------------------------------------------------------------
reg [31:0] haddr_reg;
reg [2:0] CurrentState;
reg [2:0] NextState;


wire cen, bsy;
wire [1:0]ctrl;
wire [31:0] dout;
reg hwrite_reg;
reg cen_wait;
wire full_signal;
wire empty_signal;

assign ctrl = (hwrite_reg && (haddr_reg == 32'h40300000))? hwdata[1:0] : 2'b00;

// store haddr at address phase
always @(negedge hreset_n or posedge g_hclk_es1) begin
    if (hreset_n == 0)
        haddr_reg <= 32'h0;
    else
        haddr_reg <= haddr;
end

always @(negedge hreset_n or posedge g_hclk_es1) begin
    if (hreset_n == 0)
        hwrite_reg <= 1'b0;
    else
        hwrite_reg <= hwrite;
end

assign hrdata_es1 = (haddr_reg == 32'h40400000 || empty_signal)? {31'h0000_0000, bsy} : dout;
assign hreadyout_es1 = (cen_wait == 1'b0)? 1'b1:1'b0;
assign hresp_es1     = 1'b0; //2'b00

always @(posedge g_hclk_es1 or negedge hreset_n) begin
    if (!hreset_n)
        cen_wait <= 1'b0;
    else if (!hwrite && (haddr[31:8] == 24'h400000) && cen_wait == 0)
        cen_wait <= 1'b1;
    else
        cen_wait <= 1'b0;
end

pdm_m pdm(
          .AHBclk(g_hclk_es1),
          .PDMclk(pdm_in),
          .rst(hreset_n),
          .ctrl(ctrl),
          .addr(haddr_reg),
          .pdm_signal(pdm_signal),
          .dout(dout),
          .bsy(bsy),
        //   .full_signal(full_signal),
          .empty_signal(empty_signal)
      );

endmodule
