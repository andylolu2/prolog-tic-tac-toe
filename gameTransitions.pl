:- [listOps, properties].

% next(+State, -Moves, -NextStates) succeeds with list Moves and NextStates which 
% holds the possible moves from the current State and its corresponding resultant 
% state, with duplicated moves due to symmetry removed.
next(State, Moves, NextStates) :-
    \+terminal(State),
    move(State,Locs,S),
    filterDup(State, Locs, S, Moves, NextStates).

% move/5(+State, +Board, Index, -Locations, -Afters)
move(_, [], _, [], []).
move(state(Board, Player),[-|T],Index,[Index|Locs],[state(After, NextPlayer)|Afters]) :- 
    nextPlayer(state(Board, Player), NextPlayer),
    replace(Board, Index, Player, After),
    N is Index + 1,
    move(state(Board, Player), T, N, Locs, Afters).
move(state(Board, Player),[H|T],Index,Locs,Afters) :- 
    H \= e,
    N is Index + 1,
    move(state(Board, Player), T, N, Locs, Afters).

% move/3(+State, -Locations, -Afters) succeeds with possible locations for the next move 
% for current State in Locations and the corresponding state after the move in Afters.
move(state(Board, Player), Locations, Afters) :- 
    move(state(Board, Player), Board, 1, Locations, Afters).

% filterDup(+State, +Moves, +NextStates, -FilteredMoves, -FilteredNextStates) succeeds with 
% FilteredMoves and FilteredNextStates as filtered versions of Moves and NextStates 
% where duplicated moves due to symmetry at current State is removed. 
filterDup(_, [], _, [], []).
filterDup(State, [Move|Moves], [_|NextStates], OutMoves, OutStates) :- 
    symmetric(State, SymLocs), 
    member(Move, SymLocs), 
    filterDup(State, Moves, NextStates, OutMoves, OutStates).
filterDup(State, [Move|Moves], [S|NextStates], [Move|OutMoves], [S|OutStates]) :- 
    filterDup(State, Moves, NextStates, OutMoves, OutStates).
