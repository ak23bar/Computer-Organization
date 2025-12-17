module cla_block(A, B, Cin, S, Cout);

	input [3:0] A, B;
	input Cin;
	output [3:0] S;
	output Cout;

	wire g0, g1, g2, g3, p0, p1, p2, p3;
	wire c1, c2, c3;
	wire [3:0] C; // unused

	and (g0, A[0], B[0]);
	and (g1, A[1], B[1]);
	and (g2, A[2], B[2]);
	and (g3, A[3], B[3]);

	or (p0, A[0], B[0]);
	or (p1, A[1], B[1]);
	or (p2, A[2], B[2]);
	or (p3, A[3], B[3]);

	assign c1 = g0 | (p0 & Cin);
	assign c2 = g1 | (p1 & g0) | (p1 & p0 & Cin);
	assign c3 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & Cin);
	assign Cout = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & Cin);

	one_bit_full_adder fa0 (A[0], B[0], Cin, S[0], C[0]);
	one_bit_full_adder fa1 (A[1], B[1], c1, S[1], C[1]);
	one_bit_full_adder fa2 (A[2], B[2], c2, S[2], C[2]);
	one_bit_full_adder fa3 (A[3], B[3], c3, S[3], C[3]);

endmodule