% printState(+State) prints the State for debugging purposes.
printState(state([S1,S2,S3,S4,S5,S6,S7,S8,S9], Player)) :- 
    write('Player: '), write(Player), nl,
    writeln([S1, S2, S3]),
    writeln([S4, S5, S6]),
    writeln([S7, S8, S9]).
