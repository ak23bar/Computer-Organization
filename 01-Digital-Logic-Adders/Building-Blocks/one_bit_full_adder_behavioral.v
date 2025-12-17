module one_bit_full_adder(A, B, Cin, S, Cout);
    input A, B, Cin;
    output S, Cout;
    
    wire AxorB, AB, ACin, BCin;

    xor (AxorB, A, B);
    xor (S, AxorB, Cin);

    and (AB, A, B);
    and (ACin, A, Cin);
    and (BCin, B, Cin);

    or (Cout, AB, ACin, BCin);
endmodule
