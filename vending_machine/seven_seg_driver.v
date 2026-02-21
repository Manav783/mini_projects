module seven_seg_driver(
  	input clk,
    input [3:0] tens,
    input [3:0] ones,
    output reg [6:0] seg,
	output reg [7:0] an );

    reg [15:0] refresh_cnt;
    reg current_digit;
  
	always @(posedge clk) begin 
      refresh_cnt <= refresh_cnt + 1; current_digit <= refresh_cnt[15];
	end
  
	always @(*) begin
		if (current_digit) begin
			an = 4'b1101;
			case (tens)
				0: seg = 7'b0000001; 
		        1: seg = 7'b1001111; 
		        2: seg = 7'b0010010; 
        		default: seg = 7'b1111111; 
      		endcase 
     	end 
     	else begin
			an = 4'b1110;
			case (ones)
				0: seg = 7'b0000001;
				2: seg = 7'b0010010;
				8: seg = 7'b0000000; 
	        	default: seg = 7'b1111111;
			endcase
		end
	end
  
endmodule
