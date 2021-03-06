:- dynamic(doneAttack/1).

%Definisi Awal
doneAttack(false).

setTrueDone :-
	retractall(doneAttack(_)),
	asserta(doneAttack(true)), !.

setFalseDone :-
	retractall(doneAttack(_)),
	asserta(doneAttack(false)), !.

specialAttack :-
	play(false),
	write('Start dulu ya'), !.

specialAttack :-
	battle(false),
	write('Anda tidak di dalam Battle.'), !.

specialAttack :-
	battle(true),
	doneAttack(true),
	write('Special attacks can only be used once per battle!'), !.

specialAttack :-
	battle(true),
	doneAttack(false),

	setTrueDone,
	setTrueTemp,

	pickTokemon(X),
	specialattack(X,_,Name),
	write(X), write(' uses '), write(Name), write('!'), nl,
	write('COOL!! SUPER EFFECTIVE!'), nl, nl,
	attack, !.
