% --- Representación del árbol binario ---
% nil = árbol vacío
% t(Izquierdo, Raíz, Derecho)

% --- Regla principal ---
% generacion(+N, +ListaDeArboles, -ListaDeNodos)
% Devuelve los nodos que están en la generación N
% (la raíz está en la generación 0)

generacion(_, [], []). % caso base: no hay árboles
generacion(0, [t(_, R, _)|Resto], [R|L]) :- 
    generacion(0, Resto, L). % generación 0: solo las raíces
generacion(N, [t(I, _, D)|Resto], L) :-
    N > 0,
    N1 is N - 1,
    generacion(N1, [I, D], L1),  % buscar en los subárboles
    generacion(N, Resto, L2),    % buscar en el resto de árboles
    concatenar(L1, L2, L).

% --- Concatenar listas ---
concatenar([], L, L).
concatenar([X|R], L2, [X|Resultado]) :-
    concatenar(R, L2, Resultado).
