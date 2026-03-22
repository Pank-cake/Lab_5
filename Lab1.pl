%PREDICATES
%quant(int) 
%sum(int, int) 
%result(real)

%CLAUSES
sum(0,0):- !.  
sum(X,S):- X > 0,
    Q is X mod 10,
    R is X // 10,
    sum(R,S1),
    S is S1 + Q, !.

%GOAL
main :-
    write("Three-digit number = "), read(X),
    sum(X, S),
    Result is X / S,
    write("Number divided by sum of digits = "), write(Result), nl.