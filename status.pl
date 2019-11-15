:- dynamic(inventory/1).
:- dynamic(legend/1).
:- dynamic(healt/2).
:- dynamic(type/2).
status :-
	write('YOUR TOKEMON :'), nl,
	forall(
	    inventory(Obj),
		(
			write(Obj), nl,
			healthP(Obj,X),write('Health : '),write(X),nl,
			type(Obj,X),write('Type   : '),nl,nl
		)
	),
	nl,
	write('YOUR ENEMY :'),nl,
	forall(
	    legend(Msh),
		(
			write(Msh), nl,
			healthM(Msh,X),write('Health : '),write(X),nl,
			type(Msh,X),write('Type   : '),nl,nl
		)
	),
	nl,!.







