:- dynamic(inventory/2).

status :-
	write('Your Tokemon : '), nl,
	inventory(_,_)->(
		forall(inventory(Object,Atribut),
		(
			write(Obj), nl,
			write('Type : '),write(Atribut),
			(
				(type(Obj,_));
			),
			write('Health : '),write(Atribut),
			(
				(health(Obj,_));
			)
			,nl
		))
	);(
		write(' Inventory kosong'),nl
	),
!.
