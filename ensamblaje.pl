% --- Base de conocimiento ---
% pieza(Nombre, [ListaDeComponentes])

pieza(bicicleta, [rueda_delantera, rueda_trasera, cuadro, sillin, cadena, pedal]).
pieza(rueda_delantera, [aro, radios, eje]).
pieza(rueda_trasera, [aro, radios, eje]).
pieza(cuadro, []).
pieza(sillin, []).
pieza(cadena, []).
pieza(pedal, []).
pieza(aro, []).
pieza(radios, []).
pieza(eje, []).

% --- Caso: la pieza es básica (caso base) ---
componentes(Pieza, [Pieza]) :-
    pieza(Pieza, []).

% --- Regla principal (para piezas compuestas) ---
componentes(Pieza, Lista) :-
    pieza(Pieza, Subpiezas),
    Subpiezas \= [],           % opcional pero explícito: asegura que sea compuesta
    piezas_basicas(Subpiezas, Lista).

% --- Procesa una lista de subpiezas ---
piezas_basicas([], []).
piezas_basicas([Cabeza|Resto], Total) :-
    componentes(Cabeza, Lista1),
    piezas_basicas(Resto, Lista2),
    concatenar(Lista1, Lista2, Total).

% --- Concatenar listas sin usar append/3 ---
concatenar([], L, L).
concatenar([X|R], L2, [X|Resultado]) :-
    concatenar(R, L2, Resultado).


