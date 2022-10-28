module am(
	input wire					sys_clk,
	input wire					sys_rst_n,
	input wire [7:0]			ad_data,
	
	output wire					ad_clk,
	output wire 				da_clk,
	output wire [13:0]			da_data,
	output wire					led
);

	//PLL
	wire			clk1;
	wire			clk2;		
	
	//FIR
	wire			valid;			//输出有效
	wire [20:0]		data_fir;
	
	//整流数据
	reg [7:0]		data_in;


	//AD  DA时钟驱动
	assign ad_clk = clk1;
	assign da_clk = clk2;
	
	//输出data
	assign da_data = data_fir[19:6];
	assign led = valid;


	
	//进行整流
	always @(posedge clk1 or negedge sys_rst_n) begin
		if (~sys_rst_n)
			data_in <= 8'b0;
		else if (ad_data <= 8'd127)
			data_in <= ('d255 - ad_data) ;
		else
			data_in <= ad_data;
	end

	
	//进行滤波
 	fir fir_inst (
		.clk              (clk2),              
		.reset_n          (sys_rst_n),          		  
		.ast_sink_data    (data_in),    
		.ast_sink_valid   (1'b1),   			
		.ast_source_ready (1'b1),				
		.ast_sink_error   (2'b0),   
		.ast_source_data  (data_fir),  
		.ast_sink_ready   (),			
		.ast_source_valid (valid), 
		.ast_source_error ()  
	);
	

	//PLL核
	pll	pll_inst (
	.inclk0 ( sys_clk ),
	.c0 ( clk1 ),		//10M
	.c1 ( clk2 ),		//10M
	.locked (  )
	);


endmodule