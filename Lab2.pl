%DOMAINS
%list = integer*

%PREDICATES
%genl(integer, list)
%count(list, integer)

%CLAUSES
genl(0, []) :- !.
genl(N, [H|T]) :-
    N > 0,
    write("Enter element: "), 
    read(H),                 
    N1 is N - 1,
    genl(N1, T).

count([], 0) :- !.
count([H|T], Count) :-
    H =\= 0,
    count(T, TailCount),
    Count is TailCount + 1, !.
count([H|T], Count) :-
    H =:= 0,
    count(T, Count).

% GOAL
main :-
    write("Enter number of elements: "), 
    read(N),
    genl(N, List),
    count(List, Count),
    write("Your list = "), write(List), nl,
    write("Number of non-zero elements = "), write(Count), nl.