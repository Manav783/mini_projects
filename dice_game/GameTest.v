module GameTest (Rb, Reset, Sum, CLK, Roll, Win, Lose);

    reg clk;
    reg reset;
    reg Rb;
    reg [3:0] Sum;

    wire Roll;
    wire Win;
    wire Lose;

    // Instantiate DiceGame
    DiceGame uut (
        .clk(clk),
        .reset(reset),
        .Rb(Rb),
        .Sum(Sum),
        .Roll(Roll),
        .Win(Win),
        .Lose(Lose)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10ns clock period
    end

    // Simulation logic
    initial begin
        reset = 1;
        Rb = 0;
        Sum = 0;

        #10 reset = 0;

        // Start game
        Rb = 1;
        #10 Rb = 0;

        forever begin
            @(posedge clk);

            if (Roll) begin
                // Simulate dice sum (random between 2–12)
                Sum = ($random % 11) + 2;
                $display("Rolled Sum = %d", Sum);
            end

            if (Win) begin
                $display("Player WINS!");
                #10 reset = 1;
                #10 reset = 0;
                Rb = 1;
                #10 Rb = 0;
            end

            if (Lose) begin
                $display("Player LOSES!");
                #10 reset = 1;
                #10 reset = 0;
                Rb = 1;
                #10 Rb = 0;
            end
        end
    end

endmodule
