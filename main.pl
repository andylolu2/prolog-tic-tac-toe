:- [gameTransitions].

% evaluate(+State, -BestMove, -Value)
evaluate(State, _, 1) :- win(State, x).
evaluate(State, _, -1) :- win(State, o).
evaluate(state(Board, _), _, 0) :- allIn(Board, [o, x]). 
evaluate(state(Board, Player), BestMove, BestValue) :- 
    next(state(Board, Player), Moves, NextStates), 
    bestStateValue(Player, Moves, NextStates, BestMove, BestValue).

% bestStateValue(++Player, +Moves, +States, -BestMove, -BestValue)
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
