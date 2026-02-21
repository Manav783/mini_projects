module main(
		input clk,rst,buy,load,
	  input [3:0] b_in,
	  input [1:0] sel,
  	output reg [3:0] b_out,
	output reg yes,no
);
  reg [4:0] fare;
  
  //price selection
  always @(*) begin
    case(sel)
      2'b00: fare = 5;
      2'b01: fare = 8;
      2'b10: fare = 10;
      2'b11: fare = 12;
      default : fare = 0;
    endcase
  end
  
  //main logic
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      b_out<=0; yes<=0; no<=0;
    end
    else begin
      yes<=0; no<=0;
      if(load) b_out <= b_out + b_in;
      else if (buy) begin
        if(b_out>fare) begin
          b_out <= b_out-fare;
          yes <= 1;
        end
        else if (b_out<fare) begin
          no <= 1'b1;
        end
      end
    end
  end
endmodule
