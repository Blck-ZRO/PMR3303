//Vamos construir um decodificador 2:4 com enable, de nome Dec2_4E, por meio do cascateamento de duas instanciações de Dec2E (que é um decodificador 1:2).


module Dec2_4E (input [1:0] A,
                output [3:0] Y);

  wire A0, A1, E0, E1;

  assign A0 = A[0];
  assign A1 = A[1];
  assign E0 = E & (~A1); //enable decoder U0
  assign E1 = E & A1; // enable decoder U1

  //Instanciando os decodificadores
  Dec2E_ind UO (E0, A0, Y[1:0]);
  Dec2E_ind U1 (E1, A0, y[3:2]);

endmodule //Dec2_4E
