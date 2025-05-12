% peano.pl
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Peano arithmetic formalism
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% is_number/1 recognizes a valid Peano numeral
is_number(0).
is_number(s(X)) :-
    is_number(X).

% add/3: Peano addition
add(0, N, N) :-
    is_number(N).
add(s(N), M, s(Y)) :-
    add(N, M, Y).

% mul/3: Peano multiplication
mul(0, _, 0).
mul(s(N), M, Y) :-
    mul(N, M, YY),
    add(M, YY, Y).

%%%%%%%%%%%%%%%%%%%%%%
% Your code goes here:
%%%%%%%%%%%%%%%%%%%%%%

% exp/3: Peano exponentiation
% Base^0 = 1  (represented by s(0))
exp(_, 0, s(0)).
exp(X, s(N), Z) :-
    exp(X, N, Y),
    mul(X, Y, Z).

% Example runs:
% ?- exp(s(s(0)), s(s(0)), Z).   % 2^2 = 4
% Z = s(s(s(s(0)))).
% ?- exp(s(s(0)), s(s(s(0))), Z).  % 2^3 = 8
% Z = s(s(s(s(s(s(s(s(0)))))))).
