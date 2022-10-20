objeto :- write('{'), aux1, write('}').
aux1 :- read(Elemento),
        (Elemento='atributo'->
          atributo;
          write('error '), write(elemento)
        ).
atributo :- read(Nbatributo),
            write('"'),
            write(Nbatributo),
            write('"'),
            write(':'),
            valor.
valor :- read(TipoAtributo),
          (TipoAtributo='cadena'->
              cadena;
              TipoAtributo='objeto'->objeto;
              write('error: '),
              write(TipoAtributo)
          ).

cadena :- read(X), write('"'), write(X), write('"').
:- objeto.