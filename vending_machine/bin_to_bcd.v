module bin_to_bcd( 
  	input [3:0] bin,
  	output [3:0] tens,
	output [3:0] ones);

	assign tens = (bin >= 10) ? 4'd1 : 4'd0;
	assign ones = (bin >= 10)? (bin - 10) : bin; 
endmodule
