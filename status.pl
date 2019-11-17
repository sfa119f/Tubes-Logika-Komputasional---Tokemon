:- dynamic(inventory/1).
:- dynamic(legend/1).
:- dynamic(healthP/2).
:- dynamic(healthM/2).
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
	write('YOUR ENEMY :'),nl,
	forall(
	    musuh(Msh,_),
		(
			write(Msh), nl,
			healthM(Msh,X),write('Health : '),write(X),nl,
			type(Msh,Y),write('Type   : '),write(Y),nl,nl
		)
	),
	nl,!.







