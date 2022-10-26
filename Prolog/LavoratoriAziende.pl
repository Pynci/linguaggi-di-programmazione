%%% -*- Mode: Prolog -*-

works(samantha, esa, astronaut).
works(elena, coop, casher).
works(gino, coop, casher).
works(ugo, amazon, programmer).
works(ugo, amazon, manager).
works(ciro, microsoft, programmer).

% PER CAPIRE: :- significa "se"
colleghi(X, Y) :- 
    works(X, Azienda, _), 
    works(Y, Azienda, _), 
    X \= Y.
% La condizione per cui X deve essere diversa da Y deve essere messa dopo

sburna(X, Y) :-
    writeln("Ciao").
