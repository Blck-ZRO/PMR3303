

module Dec2e_assign( //inicio o modulo e definos os inputs e output
  input E, //As definições acabam com virgula
  input A0,
  output[1:0] Y
);
  wire _A0, Y0, Y1; //Defino as conexões internas que iram auxiliar

  assign _A0 = ~A0; // Defino então os comandos
  assign Y0 = E & _A0; //Comandos terminam com ponto-virgula
  assign Y1 = E & A0;
  assign Y[0] = Y0;
  assign Y[1] = Y1;
endmodule
