module DiceGame (Rb, Reset, CLK, Sum, Roll, Win, Lose);
  input Rb, Reset, CLK;
  input [3:0] Sum;
  output reg Roll, Win, Lose;

  reg [2:0] State, Nextstate;
  reg [3:0] Point;
  reg Sp;

  initial begin
    State = 0;
    Nextstate = 0;
    Point = 2;
  end

  always @(Rb or Reset or Sum or State) begin
    Sp = 1'b0; 
    Roll = 1'b0;
    Win = 1'b0;
    Lose = 1'b0;

    case(State) 
      0 : if (Rb==1'b1) Nextstate = 1;
      1 : begin
        if (Rb==1'b1) Roll = 1'b1; 
        else if (Sum==7 || Sum==11) Nextstate = 2;
        else if (Sum==2 || Sum==3 || Sum=12) Nextstate = 3;
        else begin 
          Sp = 1'b1;
          Nextstate = 4; 
        end
      end
      2 : begin
        Win = 1'b1;
        if (Reset == 1'b1) Nextstate = 0;
      end
      3 : begin
        Lose = 1'b1;
        if (Reset == 1'b1) Nextstate = 0;
      end
      4 : if (Rb == 1'b1) Nextstate = 5;
      5 : begin
        if (Rb == 1'b1) Roll = 1'b1;
        else if (Sum == Point) Nextstate = 2;
        else if (Sum == 7) Nextstate = 3;
        else Nextstate = 4; 
      end
      default : Nextstate = 0;
    endcase
  end

  always @(posedge CLK) begin
    State <= Nextstate; 
    if (Sp == 1'b1) Point <= Sum;
  end
  
endmodule 
