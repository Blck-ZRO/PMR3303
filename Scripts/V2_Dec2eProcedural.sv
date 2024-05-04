// Fazendo o mesmo componente proceduralmente
module Dec2E_always (input E, A0,
                     output [1,0] Y); //inputs e outputs são wire por default
  reg _A0r, YOr, Y1r; // Nets auxiliares tipo reg

  always @ (E or A0) begin //lista de sensibilidade
    _AOr = ~AO; // somente nets tipos reg podem ser alteradas no bloco always
    Y0r = E & _A0r;
    Y1r = E & A0;
  end

  assign Y = {Y1r,Y0r}; //Saídas são wires que precisam ser alterada fora do always
endmodule
