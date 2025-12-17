module PPA16(A, B, Cin, S, Cout);
	input  [15:0] A, B;
	input         Cin;
	output [15:0] S;
	output        Cout;

	wire [15:0] P, G;
	assign P = A | B;
	assign G = A & B;

	//----------------------------------------------------------------
	// Level 1
	//----------------------------------------------------------------
	wire P14_13, G14_13;
	wire P12_11, G12_11;
	wire P10_9,  G10_9;
	wire P8_7,   G8_7;
	wire P6_5,   G6_5;
	wire P4_3,   G4_3;
	wire P2_1,   G2_1;
	wire P0_n1,  G0_n1; 

	assign P0_n1 = P[0] & 0;  
	assign G0_n1 = G[0] | (P[0] & Cin);

	assign P2_1  = P[2] & P[1];
	assign G2_1  = G[2] | (P[2] & G[1]);

	assign P4_3  = P[4] & P[3];
	assign G4_3  = G[4] | (P[4] & G[3]);

	assign P6_5  = P[6] & P[5];
	assign G6_5  = G[6] | (P[6] & G[5]);

	assign P8_7  = P[8]& P[7];
	assign G8_7  = G[8] | (P[8] & G[7]);

	assign P10_9 = P[10] & P[9];
	assign G10_9 = G[10] | (P[10] & G[9]);

	assign P12_11 = P[12] & P[11];
	assign G12_11 = G[12] | (P[12] & G[11]);

	assign P14_13 = P[14] & P[13];
	assign G14_13 = G[14] | (P[14] & G[13]);

	//----------------------------------------------------------------
	// Level 2
	//----------------------------------------------------------------
	wire P14_11, G14_11;
	wire P13_11, G13_11;
	wire P10_7,  G10_7;
	wire P9_7,   G9_7;
	wire P6_3,   G6_3;
	wire P5_3,   G5_3;
	wire P2_n1,  G2_n1;
	wire P1_n1,  G1_n1;

	assign P14_11 = P14_13 & P12_11;
	assign G14_11 = G14_13 | (P14_13 & G12_11);

	assign P13_11 = P[13] & P12_11;
	assign G13_11 = G[13] | (P[13] & G12_11);

	assign P10_7  = P10_9 & P8_7;
	assign G10_7  = G10_9 | (P10_9 & G8_7);

	assign P9_7   = P[9] & P8_7;
	assign G9_7   = G[9] | (P[9] & G8_7);

	assign P6_3   = P6_5 & P4_3;
	assign G6_3   = G6_5 | (P6_5 & G4_3);

	assign P5_3   = P[5] & P4_3;
	assign G5_3   = G[5] | (P[5] & G4_3);

	assign P2_n1  = P2_1 & P0_n1;
	assign G2_n1  = G2_1 | (P2_1 & G0_n1);

	assign P1_n1  = P[1] & P0_n1;
	assign G1_n1  = G[1] | (P[1] & G0_n1);

	//----------------------------------------------------------------
	// Level 3
	//----------------------------------------------------------------
	wire P14_7, G14_7;
	wire P13_7, G13_7;
	wire P12_7, G12_7;
	wire P11_7, G11_7;
	wire P6_n1, G6_n1;
	wire P5_n1, G5_n1;
	wire P4_n1, G4_n1;
	wire P3_n1, G3_n1;

	assign P14_7 = P14_11 & P10_7;
	assign G14_7 = G14_11 | (P14_11 & G10_7);

	assign P13_7 = P13_11 & P10_7;
	assign G13_7 = G13_11 | (P13_11 & G10_7);

	assign P12_7 = P12_11 & P10_7;
	assign G12_7 = G12_11 | (P12_11 & G10_7);

	assign P11_7 = P[11] & P10_7;
	assign G11_7 = G[11] | (P[11] & G10_7);

	assign P6_n1 = P6_3 & P2_n1;
	assign G6_n1 = G6_3 | (P6_3 & G2_n1);

	assign P5_n1 = P5_3 & P2_n1;
	assign G5_n1 = G5_3 | (P5_3 & G2_n1);

	assign P4_n1 = P4_3 & P2_n1;
	assign G4_n1 = G4_3 | (P4_3 & G2_n1);

	assign P3_n1 = P[3] & P2_n1;
	assign G3_n1 = G[3] | (P[3] & G2_n1);

	//----------------------------------------------------------------
	// Level 4
	//----------------------------------------------------------------
	wire P14_n1, G14_n1;
	wire P13_n1, G13_n1;
	wire P12_n1, G12_n1;
	wire P11_n1, G11_n1;
	wire P10_n1, G10_n1;
	wire P9_n1,  G9_n1;
	wire P8_n1,  G8_n1;
	wire P7_n1,  G7_n1;

	assign P14_n1 = P14_7 & P6_n1;
	assign G14_n1 = G14_7 | (P14_7 & G6_n1);

	assign P13_n1 = P13_7 & P6_n1;
	assign G13_n1 = G13_7 | (P13_7 & G6_n1);

	assign P12_n1 = P12_7 & P6_n1;
	assign G12_n1 = G12_7 | (P12_7 & G6_n1);

	assign P11_n1 = P11_7 & P6_n1;
	assign G11_n1 = G11_7 | (P11_7 & G6_n1);

	assign P10_n1 = P10_7 & P6_n1;
	assign G10_n1 = G10_7 | (P10_7 & G6_n1);

	assign P9_n1  = P9_7 & P6_n1;
	assign G9_n1  = G9_7 | (P9_7 & G6_n1);

	assign P8_n1  = P8_7 & P6_n1;
	assign G8_n1  = G8_7 | (P8_7 & G6_n1);

	assign P7_n1  = P[7] & P6_n1;
	assign G7_n1  = G[7] | (P[7] & G6_n1);

	//----------------------------------------------------------------
	// Sum calculations
	//----------------------------------------------------------------
	assign S[0] = Cin ^ A[0] ^ B[0];
	assign S[1] = G0_n1 ^ A[1] ^ B[1];
	assign S[2] = G1_n1 ^ A[2] ^ B[2];
	assign S[3] = G2_n1 ^ A[3] ^ B[3];
	assign S[4] = G3_n1 ^ A[4] ^ B[4];
	assign S[5] = G4_n1 ^ A[5] ^ B[5];
	assign S[6] = G5_n1 ^ A[6] ^ B[6];
	assign S[7] = G6_n1 ^ A[7] ^ B[7];
	assign S[8] = G7_n1 ^ A[8] ^ B[8];
	assign S[9] = G8_n1 ^ A[9] ^ B[9];
	assign S[10] = G9_n1 ^ A[10] ^ B[10];
	assign S[11] = G10_n1 ^ A[11] ^ B[11];
	assign S[12] = G11_n1 ^ A[12] ^ B[12];
	assign S[13] = G12_n1 ^ A[13] ^ B[13];
	assign S[14] = G13_n1 ^ A[14] ^ B[14];
	assign S[15] = G14_n1 ^ A[15] ^ B[15];

	assign Cout = G[15]
endmodule
