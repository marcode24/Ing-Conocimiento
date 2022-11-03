# Examen 1er Parcial

## Código

```pl
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
```

### Input

```shell
atributo. metodo1. metodo. metodo1. asignacion. metodo1. 5+3. decision. metodo1>10. asignacion. metodo1. metodo1*2. fin. sino. asignacion. metodo1. metodo1/10. fin. fin.
```

### Output

```json
{
  "metodo1": "function() {
    metodo1=5+3;
    if(metodo1>10){
      metodo1=metodo1*2;
    } else {
      metodo1=metodo1/10;
    }
    return metodo1
  }"
}
```
