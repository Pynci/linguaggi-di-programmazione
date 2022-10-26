% query che chiede "quando X è uguale a 42"?
% rispota: "X = 42" ovvero "quando X è uguale a 42"
X = 42.

% query che chiede "42 è uguale a 42?"
% risposta: "true".
42 = 42.

% Forma normale delle query in prolog
=(42,42).

% l'uguale non è l'assegnamento ma l'unificazione
% la virgola rappresenta la congiunzione in prolog
42 = X, X = Y, Y = 42.