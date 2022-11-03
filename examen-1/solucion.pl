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
           TipoAtributo='metodo'->metodo;
            write('error: '), write(TipoAtributo)
          ).

cadena :- read(X), write('"'), write(X), write('"').
objeto :- write('{'), aux1, write('}').
arreglo :- write('['), aux2, write(']').
metodo :- read(Nbmetodo), write('"function() {'), instruccion, write('return '), write(Nbmetodo), write('}"').
instruccion :- read(T),
            (T='asignacion'->asignacion, instruccion;
             T='decision'->decision, instruccion;
             T='fin'->write('');
             write('error'), write(T)
            ).
asignacion :- read(I), write(I), write('='), read(D), write(D), write(';').
decision :- write('if('),
                read(G),
                write(G),
            write(')'),
            write('{'),
                instruccion,
            write('}'),
            aux3.

aux3 :- read(S),
        (S='sino'->write(' else {'), instruccion, write('}');
         S='fin'->write('')
         ).
:- objeto.