:- [gameTransitions].

% evaluate(+State, -BestMove, -Value) succeeds with the Value and BestMove at the give State.
evaluate(State, _, 1) :- win(State, x).
evaluate(State, _, -1) :- win(State, o).
evaluate(state(Board, _), _, 0) :- allIn(Board, [o, x]). 
evaluate(state(Board, Player), BestMove, BestValue) :- 
    next(state(Board, Player), Moves, NextStates), 
    bestStateValue(Player, Moves, NextStates, BestMove, BestValue).

% bestStateValue(++Player, +Moves, +States, -BestMove, -BestValue) succeeds with the 
% BestMove and BestValue of the most optimal move and state pair from Moves and States
% for the current Player.
bestStateValue(_, [Move], [State], Move, BestValue) :- evaluate(State, _, BestValue).
bestStateValue(x, [Move|Moves], [State|States], BestMove, BestValue) :- 
    evaluate(State, _, Value1), 
    bestStateValue(x, Moves, States, Move2, Value2), 
    (
        Value1 > Value2 -> 
        BestMove = Move, BestValue = Value1;
        BestMove = Move2, BestValue = Value2
    ).
bestStateValue(o, [Move|Moves], [State|States], BestMove, BestValue) :- 
    evaluate(State, _, Value1), 
    bestStateValue(o, Moves, States, Move2, Value2), 
    (
        Value1 < Value2 -> 
        BestMove = Move, BestValue = Value1;
        BestMove = Move2, BestValue = Value2
    ).
