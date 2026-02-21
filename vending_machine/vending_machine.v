module vending_machine(
	  	input clk, rst, buy, load,
	  	input [3:0] b_in,
	  	input [1:0] sel,
	  	output [6:0] seg,
		output [7:0] an,
	  	output yes,no
);

	wire [3:0] balance, tens, ones;
  	main u_main (
		  .clk(clk),
		  .rst(rst),
		  .buy(buy),
		  .load(load),
		  .b_in(b_in),
		  .sel(sel),
		  .b_out(balance),
		  .yes(yes),
		  .no(no)
		);

  
    bin_to_bcd bcd ( 
      .bin(balance),
    	.tens(tens),
    	.ones(ones)
    );
  
    seven_seg_driver disp(
		  .clk(clk),
		  .tens(tens),
		  .ones(ones),
		  .seg(seg),
		  .an(an)
		);

  
endmodule
