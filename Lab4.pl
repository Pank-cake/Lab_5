main :-
    Kittens = [druzhok, elisei, fantik, murlyka],
    permutation(Kittens, [Misha, Maksim, Lenya, Dima]),

    Colors = [black, white, red, grey],
    permutation(Colors, [CD, CE, CF, CM]),

    Maksim = murlyka,
    Lenya  = elisei,
    Dima \= fantik,

    one_false([CF \= red, CM \= grey, CD \= white, CE \= grey, CD \= grey]),

    write("Misha has "), write(Misha), write(" (color: "), write_color(Misha, CD, CE, CF, CM), write(")"), nl,
    write("Maksim has "), write(Maksim), write(" (color: "), write_color(Maksim, CD, CE, CF, CM), write(")"), nl,
    write("Lenya has "), write(Lenya), write(" (color: "), write_color(Lenya, CD, CE, CF, CM), write(")"), nl,
    write("Dima has "), write(Dima), write(" (color: "), write_color(Dima, CD, CE, CF, CM), write(")"), nl.

write_color(druzhok, CD, _, _, _) :- write(CD).
write_color(elisei,  _, CE, _, _) :- write(CE).
write_color(fantik,  _, _, CF, _) :- write(CF).
write_color(murlyka, _, _, _, CM) :- write(CM).

one_false(L) :-
    include(call, L, TrueList),
    length(L, N),
    length(TrueList, T),
    N - T =:= 1.