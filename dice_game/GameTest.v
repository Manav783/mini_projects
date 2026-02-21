module GameTest (Rb, Reset, Sum, CLK, Roll, Win, Lose);
    output reg Rb, Reset;
    output reg [3:0] Sum;
    input CLK, Roll, Win, Lose;
    
    reg [1:0] Tstate, Tnest;
    reg Trig1;

    integer Summary[0:11];
    integer i;

    initial begin
        Summary[0] = 7;
        Summary[1] = 7;
        Summary[2] = 3;
        Summary[3] = 4;
        Summary[4] = 7;
        Summary[5] = 5;
        Summary[6] = 6;
        Summary[7] = 7;
        Summary[8] = 6;
        Summary[9] = 8;
        Summary[10] = 9;
        Summary[11] = 6;
        i = 0;
        Tstate = 0;
        Tnext = 0;
        Trig1 = 0;
    end 

    always @(Roll or Win or Lose or Tstate) begin
        case (Tstate) 
            0 : begin
                Rb = 1'b1; 
                Reset = 1'b0;
                if (i >= 12) Tnest = 3;
                else if (Roll == 1'b1) begin
                    Sum = Summary[i];
                    i = i+1;
                    Tnext = 1;
                end
            end
            1 : begin
                Rb = 1'b0; 
                Tnext = 2;
            end
            2: begin
                Tnext = 0;
                Trig1 = ~Trig1;
                if ((Win || Lose) == 1'b1) Reset = 1'b1;
            end
            3 : begin 
            end
        endcase
    end

    always @(posedge CLK) begin
        Tstate <= Tnext ;
    end
    
endmodule
