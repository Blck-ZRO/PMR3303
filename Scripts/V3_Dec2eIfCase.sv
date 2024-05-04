// Em descrição procedural, podemos usar comandos da linguagem Verilog para construir circuitos condicionalmente

module Dec2E_ifcase (input E,A0,
                     output [1:0] Y);

  reg YOr, Y1r; //Pq não usamos o _AO aqui?

  always @ (E or AO) begin // Lista de sensibilidade
    {Y1r, YOr} = 2'b00 // Concatenação dos bits a e b
    if (E == 0) begin // Recomendado sempre explicitar o número de bits
      {Y1r,Y0r} = 2'b00; //representa uma constante binária de dois bits, no caso (00)
    end
    else begin
      case (AO)
        1'b0: Y0r = 1; //Se A0 = 0, executa 1'b0
        1'b1: Y1r = 1; //Se A0 = 1, executa 1'b1

        default: {Y0r, Y1r} = 2'b00; //Outros casos inexistentes, realizado caso nenhum dos valores corresponda ao case anterior

        //Note que: Nesse caso nunca teremos um caso de excessão válido, mas é sempre recomendado por boa prática implementar a condição default em seus códigos

      endcase;
    end; //else
  end//always

  assign Y[1:0] = {Y1r, Y0r}; //Saídas do tipo wire são feitas fora do always

endmodule //Dec2e_ifcase

//Atente-se que condições em aberto geram circuitos adicionais que podem causar problemas
