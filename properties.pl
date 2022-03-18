:- [listOps].

% win(+State, +Player) succeeds if Player is the immediate winner of the State.
win(state([S1,S2,S3,S4,S5,S6,S7,S8,S9], _), Player) :-
    % three in a row
    allIn([S1,S2,S3], [Player]); 
    allIn([S4,S5,S6], [Player]); 
    allIn([S7,S8,S9], [Player]); 
    allIn([S1,S4,S7], [Player]); 
    allIn([S2,S5,S8], [Player]); 
    allIn([S3,S6,S9], [Player]); 
    allIn([S1,S5,S9], [Player]); 
    allIn([S3,S5,S7], [Player]).

% terminal(+State, +Player) succeeds if State is a terminal state, where the outcome of the 
% has been decided.
terminal(state(Board, _)) :- 
    win(state(Board, _), x);
    win(state(Board, _), o);
    allIn(Board, [o, x]). 

% symmetric(+State, ?DuplicateLocations) succeeds if the current board is symmetric along the 
% y-axis, x-axis, y=-x-axis or y=x-axis, with DuplicateLocations as the duplicated locations
% that does not need to be considered due to symmetry.
symmetric(state([S1,_,S1,S4,_,S4,S7,_,S7], _), [1,4,7]).
symmetric(state([S1,S2,S3,_,_,_,S1,S2,S3], _), [1,2,3]).
symmetric(state([_,S2,S3,S2,_,S6,S3,S6,_], _), [2,3,6]).
symmetric(state([S1,S2,_,S4,_,S2,_,S4,S1], _), [1,2,4]).

% nextPlayer(+State, ?NextPlayer) succeeds with NextPlayer as the next player given
% the current State.
nextPlayer(state(_, x), o).
nextPlayer(state(_, o), x).
