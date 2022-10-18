objeto :- write('{'), aux1, write('}').
  aux1 :- read(X),
    (X=='atributo'->
      atributo;
      write('error '), write(X)
    ).
  atributo :- read(Nbatributo),
    write('"'),
    write(Nbatributo),
    write('" '),
    write(':'),
    valor.
  valor :-  write('aqui nos quedamos').
:- objeto.