`timescale 1ns / 1ps
module RCS_tb;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] S;
    wire Cout;
    four_bit_RCS rcs (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
    Cin = 1;
        
    A = 4'b1010; B = 4'b0011; #10; 
    $display("Unsigned test: A=%b (%0d) +  B=%b (%0d). Result: S=%b (%0d) Cout=%b", A, A, B, B, S, S, Cout);

    A = 4'b0001; B = 4'b1100; #10; 
    $display("Signed test: A=%b (%0d) +  B=%b (%0d). Result: S=%b (%0d) Cout=%b", A, $signed(A), B, $signed(B), S, $signed(S), Cout);

    $finish;
    end

endmodule
