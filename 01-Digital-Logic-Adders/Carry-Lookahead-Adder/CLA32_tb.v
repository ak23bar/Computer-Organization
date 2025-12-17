`timescale 1ns / 1ps

module CLA32_tb;
    reg [31:0] A, B;
    reg Cin;
    wire [31:0] S;
    wire Cout;
    integer i;
    reg [32:0] expected;


    // Instantiate the CLA module
    CLA uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        // Test cases
        $display("Running CLA Test Cases...");
        for (i = 0; i < 512; i = i + 1) begin
            A = $random;
            B = $random;
            Cin = $random % 2;
            
            #10; // Wait for computation
            
            // Compute expected values
            expected = A + B + Cin;
            
            // Display results
            $display("Test case %0d: %h + %h. Expected: %h. Actual: %h. [%s]", i, A, B, expected[31:0], S, (S === expected[31:0]) ? "PASS" : "FAIL");
        end
        
        $stop;
    end
endmodule
