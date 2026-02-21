`timescale 1ns/1ps

module testbench();

  // Inputs
  reg clk;
  reg rst;
  reg buy;
  reg load;
  reg [3:0] b_in;
  reg [1:0] sel;

  // Outputs
  wire [6:0] seg;
  wire [3:0] an;
  wire yes;
  wire no;

  // Instantiate DUT
  vending_machine dut (
      .clk(clk),
      .rst(rst),
      .buy(buy),
      .load(load),
      .b_in(b_in),
      .sel(sel),
      .seg(seg),
      .an(an),
      .yes(yes),
      .no(no)
  );

  // Clock generation (10ns period)
  always #5 clk = ~clk;

  initial begin
    // Initialize
    clk = 0;
    rst = 1;
    buy = 0;
    load = 0;
    b_in = 0;
    sel = 0;

    // Reset pulse
    #20 rst = 0;


    // Load money = 6
    #10 load = 1;
        b_in = 4'd6;
    #10 load = 0;

    // Select product (fare = 5)
    #10 sel = 2'b00;

    // Buy → should succeed
    #10 buy = 1;
    #10 buy = 0;

    // Load money = 3
    #10 load = 1;
        b_in = 4'd3;
    #10 load = 0;

    // Select product (fare = 8)
    #10 sel = 2'b01;

    // Buy → should fail
    #10 buy = 1;
    #10 buy = 0;

    // Finish
    #100 $finish;
  end

  // Monitor
  initial begin
    $monitor(
      "T=%0t | sel=%b | b_in=%d | yes=%b | no=%b | seg=%b an=%b",
      $time, sel, b_in, yes, no, seg, an
    );
  end

endmodule
