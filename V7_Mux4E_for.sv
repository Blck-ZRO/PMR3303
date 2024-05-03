//Descrição procedural com laço for de multiplexador 4:1 com enable.

module Mux4E_for (input E, [3:0] I, [1,0] S,
                  output Y );

  reg ypi, Yr;
  integer i ;

  always @ (*) begin
    Yr = 0;
    for (i = 0, i <= 3, i = i + 1) begin

      //gerando os produtos ypi
      ypi = E & I[i] & (i[1:0] == s[1:0]); // (i == S) resulta em 1 quando verdadeiro

      //Gera iterativamente a porta OR de saída
      Yr = Yr | ypi/ // Construção iterativa do OR de saída
    end // for i
  end // Always

  assign Y = Yr;

endmodule //Mux4E_for

// Note que as iterações controem o circuito da saida Y da forma
//Yr = (((0 + yp0) + yp1) + yp2) + yp3
