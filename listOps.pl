% replace(+List, +Index, +Elem, +Result) succeeds with the Index-th item of List set to 
% Elem, using 1-indices.
replace([_|T], 1, Elem, [Elem|T]).
replace([H|T], Index, Elem, [H|List]) :- N is Index - 1, replace(T, N, Elem, List).

% allIn(+List, +Symbols) succeeds if all elements of List are elements of Symbols.
allIn([], _).
allIn([H|T], Symbols) :- member(H, Symbols), allIn(T, Symbols).
