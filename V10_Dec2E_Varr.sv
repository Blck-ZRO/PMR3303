//Uma forma prática de se simular circuitos combinacionais (como o decodificador Dec2E) de n entradas é usar uma variável, de pelo menos n bits, e incrementá-la a cada iteração para varrer todas as 2n possíveis combinações de entrada.

`timescale 1ns / 1ps //Unidade de tempo / precisão da simulação

module Dec2E_VarrSim();

  reg A0, E; //precisa ser do tipo reg para ser alterada dentro do inicial
  wire [1:0] Y;
  integer k;

  Dec2E_ind UUT (E, A0, Y); //Instanciação do modulo a simular e os sinais

  initial begin //inicial é usado para simular os estimulos, não possui lista de sensibilidade pois são executados incondicionalmente

    $dumpfile("dump.vcd"); //Nome do arquivo onde serão salvos os sinais
    $dumpvars(0); //Os sinais que serão salvos, no caso 0 todos sinais serão
    $timeformat(-9, 0, "ns", 3); //tempo em ns (10E-9) a ser impresso
    // No caso, em 10-9 s, com 0 dígitos depois da vírgula, “ns” como unidade e em 3 dígitos

    for (k = 0; k<4; k=k+1 ) begin //i(k?) gera todas as combinações das entradas
      //Usamos o K para varrer todas as possibilidades entre A0 e E

      A0 = k[0];
      E = k[1];
      #10 //avança a unidade de tempo no timescale

      $write("%t: E=%b, A0=%b => Y0=%b, Y1=%b\n", $time, E, A0, Y[0], Y[1]);
      //imprime a mensagem na tela do console, segue a mesma semantica do printf da linguagem C

    end//for i
    $finish; //Encerra a simulação
  end // inicial

endmodule //dec2E_VarrSim
