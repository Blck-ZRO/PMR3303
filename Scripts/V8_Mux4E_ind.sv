//Descrição usando endereçamento de entrada por índice do multiplexador 4:1.

module Mux4E_ind (input E, [3,0] I,
                  output Y );
  reg = Yr;

  always @ (*) begin
    Yr = E & I [S];
  end

  assign Y = Yr;
endmodule //Mux4E_ ind

//Sendo i igual ao endereço S, basta fazer a saída Y = I[i] se E = 1, e Y = 0 se E = 0; portanto,
//podemos simplesmente fazer Y = E∙I[i].
