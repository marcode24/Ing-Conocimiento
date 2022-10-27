aux1 :- read(Elemento),
        (Elemento='atributo'->atributo;
          Elemento='fin'->write('');
          write('error '), write(elemento)
        ).
aux2 :- read(Elemento),
        (Elemento='valor'->valor;
          Elemento='fin'->write('');
          write('error '), write(elemento)
        ).
atributo :- read(Nbatributo),
          write('"'), write(Nbatributo), write('"'),
          write(':'), valor.
valor :- read(TipoAtributo),
          (TipoAtributo='cadena'->cadena;
           TipoAtributo='objeto'->objeto;
           TipoAtributo='numero'->read(X), write(X);
           TipoAtributo='arreglo'->arreglo;
            write('error: '), write(TipoAtributo)
          ).

cadena :- read(X), write('"'), write(X), write('"').
objeto :- write('{'), aux1, write('}').
arreglo :- write('['), aux2, write(']').

:- objeto.