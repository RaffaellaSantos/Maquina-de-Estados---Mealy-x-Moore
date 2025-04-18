module mooreJK (
  input x, clk, rst,
  output reg y
);

  wire Q2, Q1, Q0; // bits do estado
  wire J2, K2, J1, K1, J0, K0;

// Saída y = 1 quando estado for 100 (Q2=1, Q1=0, Q0=0)
  always @(*) begin
    y = (Q2 & ~Q1 & ~Q0);
  end

  // Equações obtidas diretamente do circuito:
  assign J2 = Q1 & Q0 & ~x;
  assign K2 = Q2 & ~Q1 & ~Q0;

  assign J1 = ~Q2 & ~Q1 & Q0 & x;
  assign K1 = ~Q2 & Q1 & ~x;

  assign J0 = (~Q2 & ~Q1 & ~Q0 & x) | (~Q2 & Q1 & Q0 & ~x);
  assign K0 = (~Q2 & Q0 & ~x) | (~Q2 & Q1 & Q0 & ~x);                   // ativa em b->a ou d->e

  // Instanciando os FF JK
  jk_ff ff2 (.j(J2), .k(K2), .clk(clk), .rst(rst), .q(Q2));
  jk_ff ff1 (.j(J1), .k(K1), .clk(clk), .rst(rst), .q(Q1));
  jk_ff ff0 (.j(J0), .k(K0), .clk(clk), .rst(rst), .q(Q0));

endmodule
