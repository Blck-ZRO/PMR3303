module Dec2E_for (input E, A0,
                  output [1:0] Y);

  reg test; //net auxiliar para o bloco always
  reg [1,0] Yr; //Não misturar variáveis de dimensões diferentes
  integer i; //Variavel auxiliar para o laço for do tipo inteiro

  always @ (*) begin //Lista de sensibilidade, "*" significa que "Todos os sinais de entrada do bloco, sem precisar especificar um por um.

    for (i = 0; i < 2; i = i + 1) begin // Não usar i++ em verilog puro. (O que significa um verilog puro?)

      test = (A0 == i[0]); // teste lógico que resulta em 0 ou 1
      Yr[i] = E & test;

    end;//for
  end;//always
  assign Y = Yr;
endmodule //Dec2E_for
