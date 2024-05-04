// forma prática de se simular um circuito é aplicar uma sequência de entradas composta por apenas algumas combinações selecionadas. É o que se costuma chamar de vetor de teste.
//Basicamente aplica-se uma das combinações de entrada, avança-se o tempo de simulação, aplica-se outra combinação, e assim sucessivamente.

`timescale 1ns / 1ps

module Dec2E_VetSim();

  reg E;
  reg [1:0] A;
  wire [3:0] Y;

  Dec2_4E UUT (E, A, Y);

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
    $timeformat(-9, 0, "ns", 3); //tempo em ns (10E-9)
    //testa algumas combinações de entrada
    //definição do vetor de teste e impressão de saída

    E = 0; A = 2'b00; #10;
    $write ("%t: E=%b, A=%b => Y3=%b Y2=%b Y1=%b Y0=%b\n", $time, E, A, Y[3], Y[2], Y[1], Y[0]);

    E = 1; A = 2'b00; #10;
    $write ("%t: E=%b, A=%b => Y3=%b Y2=%b Y1=%b Y0=%b\n", $time, E, A, Y[3], Y[2], Y[1], Y[0]);

    E = 0; A = 2'b10; #10;
    $write ("%t: E=%b, A=%b => Y3=%b Y2=%b Y1=%b Y0=%b\n", $time, E, A, Y[3], Y[2], Y[1], Y[0]);

    E = 1; A = 2'b10; #10;
    $write ("%t: E=%b, A=%b => Y3=%b Y2=%b Y1=%b Y0=%b\n", $time, E, A, Y[3], Y[2], Y[1], Y[0]);
    end //inicial
endmodule
