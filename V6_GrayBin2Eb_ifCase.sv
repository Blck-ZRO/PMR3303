//Código Gray
// Usando os comandos if-else e case, podemos passar a tabela da verdade para Verilog de forma quase que direta.

module GrayBin2Eb_ifcase (input _E, [1,0] G, //por default inputs e outputs são do tipo
                          output [1,0] B ); // Ou seja, componentes fisicos

  reg [1:0] Br; //net do tipo reg

  always @ (_E or G) begin // Lista de sensibilidade
    //Sempre que houver alguma mudança em algo na lista de sensibilidade
    if(_E) begin
      Br = 2'b11;
    end //não tem ; antes do else
    else begin
      case(G) //tabela de conversão de G --> B
        2'b00 : Br = 2'b00;
        2'b01 : Br = 2'b01;
        2'b11 : Br = 2'b10;
        2'b10 : Br = 2'b11;
        default = 2'b11 //Recomendado fazer o default para casos inexistentes

      endcase; //fim do caso
    end;//else
  end;// fim do always

  assign B = Br; //Alterando tipo wire fora do always, como elas tem a mesma dimensão não precisa escrever bit por bit
endmodule //Fim do modulo
