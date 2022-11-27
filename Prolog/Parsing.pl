%%% -*- Mode: Prolog -*- %%%

%%% Parsing numeri interi

parse_integer(Chars, I, MoreChars) :-
    parse_integer(Chars, [], I, _, MoreChars).

parse_integer([D | Ds], DigitsSoFar, I, IntegerCodes, Rest) :-
    is_digit(D),
    !,
    parse_integer(Ds, [D | DigitsSoFar], I, IntegerCodes, Rest).

parse_integer([C | Cs], DigitsReversed, I, Digits, [C | Cs]) :-
    % not_digit(C)
    !,
    reverse(DigitsReversed, Digits),
    number_string(I, Digits).

parse_integer([], DigitsReversed, I, Digits, []) :-
    !,
    reverse(DigitsReversed, Digits),
    number_string(I, Digits).


%%% Parsing di numeri negativi

parse_negative(Chars, N, MoreChars) :-
    parse_negative(Chars, [], I, _, MoreChars).

parse_negative(Chars, DigitsReversed, I, IntegerCodes, Rest) :-
    parse_integer(Chars, I, Rest).

%% parse_negative([0'.| Ds], 
