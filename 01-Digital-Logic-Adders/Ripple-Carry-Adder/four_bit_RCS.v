module four_bit_RCS(A, B, Cin, S, Cout);
    input [3:0] A, B;
    input Cin;
    output [3:0] S;
    output Cout;
    
    wire C1, C2, C3, B0_inv, B1_inv, B2_inv, B3_inv;
    
    not (B0_inv, B[0]);
    not (B1_inv, B[1]);
    not (B2_inv, B[2]);
    not (B3_inv, B[3]);
    
    one_bit_full_adder fa0 (A[0], B0_inv, Cin, S[0], C1);
    one_bit_full_adder fa1 (A[1], B1_inv, C1, S[1], C2);
    one_bit_full_adder fa2 (A[2], B2_inv, C2, S[2], C3);
    one_bit_full_adder fa3 (A[3], B3_inv, C3, S[3], Cout);
endmodule
