module CLA32(A, B, Cin, S, Cout);

	input [31:0] A, B;
	input Cin;
	output [31:0] S;
	output Cout;

	wire [8:0] cla_cout; // Wires between CLA blocks

	cla_block cla0 (A[3:0], B[3:0], Cin, S[3:0], cla_cout[0]);
	cla_block cla1 (A[7:4], B[7:4], cla_cout[0], S[7:4], cla_cout[1]);
	cla_block cla2 (A[11:8], B[11:8], cla_cout[1], S[11:8], cla_cout[2]);
	cla_block cla3 (A[15:12], B[15:12], cla_cout[2], S[15:12], cla_cout[3]);
	cla_block cla4 (A[19:16], B[19:16], cla_cout[3], S[19:16], cla_cout[4]);
	cla_block cla5 (A[23:20], B[23:20], cla_cout[4], S[23:20], cla_cout[5]);
	cla_block cla6 (A[27:24], B[27:24], cla_cout[5], S[27:24], cla_cout[6]);
	cla_block cla7 (A[31:28], B[31:28], cla_cout[6], S[31:28], Cout);


endmodule