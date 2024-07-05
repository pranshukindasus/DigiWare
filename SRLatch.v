module srlatch(
    input wire S, R,
    output wire Q, Q_not);

    assign Q     = ~(R | Q_not);
    assign Q_not = ~(S | Q);
endmodule