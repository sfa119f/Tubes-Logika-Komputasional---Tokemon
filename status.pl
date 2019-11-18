:- dynamic(inventory/1).
:- dynamic(legend/1).
:- dynamic(healthP/2).
:- dynamic(healthM/2).
status :-
	play(false),
	write('Game belum dimulai'), nl,
	nl,!.
status :-
	write('YOUR TOKEMON :'), nl,
	forall(
	    inventory(Obj),
		(
			write(Obj), nl,
			healthP(Obj,X),write('Health : '),write(X),nl,
			type(Obj,Y),write('Type   : '),write(Y),nl,nl
		)
	),
	nl,
	write('YOUR LEGENDARY ENEMY :'),nl,
	forall(
	    legend(L),
		(
			write(L), nl,
			healthM(L,X),write('Health : '),write(X),nl,
			type(L,Y),write('Type   : '),write(Y),nl,nl
		)
	),
	nl,!.







