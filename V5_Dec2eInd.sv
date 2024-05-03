// Descrição usando endereçamento de saída por índice do decodificador 1:2.

module Dec2E_ind (input E, A0,
                  output [1:0] Y);

  reg [1:0] Yr;

  always @ (*) begin
    Yr = 2'b00;
    Yr[A0] = E;
  end; //always

  assign Y = Yr;

endmodule // Dec2E_ind

//Sendo i igual ao endereço A0, basta fazer a saída Y[i] = 1 se E = 1 (decodificador habilitado), e
//Y[i] = 0 se E = 0 (decodificador desabilitado); portanto, podemos fazer Y[i] = E e deixar as demais saídas em zero.
