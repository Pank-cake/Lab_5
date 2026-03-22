%DOMAINS
%element = integer
%set = element*  

%PREDICATES
%nondeterm read_set(integer, set)
%nondeterm union(set, set, set)
%nondeterm intersection(set, set, set)
%nondeterm main

%CLAUSES
read_set(0, []) :- !.
read_set(N, [H|T]) :-
    N > 0,
    write("Enter element: "),
    read(H),
    N1 is N - 1,
    read_set(N1, T).

union([], B, B).
union([H|T], B, R) :-
    member(H, B),
    union(T, B, R).
union([H|T], B, [H|R]) :-
    not(member(H, B)),
    union(T, B, R).

intersection([], _, []).
intersection([H|T], B, [H|R]) :-
    member(H, B),
    intersection(T, B, R).
intersection([H|T], B, R) :-
    not(member(H, B)),
    intersection(T, B, R).

%GOAL
main :-
    write("Enter number of elements in set A: "),
    read(Na),
    read_set(Na, A),

    write("Enter number of elements in set B: "),
    read(Nb),
    read_set(Nb, B),

    write("Enter number of elements in set C: "),
    read(Nc),
    read_set(Nc, C),

    union(B, C, BC),
    intersection(A, BC, Left),

    intersection(A, B, AB),
    intersection(A, C, AC),
    union(AB, AC, Right),

    write("Left = "), write(Left), nl,
    write("Right = "), write(Right), nl.