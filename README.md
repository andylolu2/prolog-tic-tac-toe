# Prolog Tic-Tac-Toe

This is a simple implementation of a Tic-Tac-Toe AI in Prolog using 
the minimax algorithm. 

The agent solves the entire game tree with some optimizations such 
as ignoring certain moves in symmetrical posistions.

## Example

```terminal
$ swipl main.pl
Welcome to SWI-Prolog (threaded, 64 bits, version 8.4.1)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit https://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).
?- evaluate(state([
    -,-,-,
    -,x,o,
    -,-,-
], x), Move, Value).
Move = 9,
Value = 1 .

%   -,-,-,
%   -,x,o,
%   -,-,x  

?- evaluate(state([
$   o,-,-,
    -,x,o,
    -,-,x
], x), Move, Value).
Move = 8,
Value = 1 .

%   o,-,-,
%   -,x,o,
%   -,x,x  

?- evaluate(state([
    o,o,-,
    -,x,o,
    -,x,x
], x), Move, Value).
Move = 7,
Value = 1 .

%   o,o,-,
%   -,x,o,
%   x,x,x  

?- evaluate(state([o,o,-,-,x,o,x,x,x], o), Move, Value).
Value = 1 .
```
