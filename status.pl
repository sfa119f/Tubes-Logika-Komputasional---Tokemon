:- dynamic(inventory/2).
:- dynamic(healt/2).
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
  write('Your Enemy'),nl,
  maxhealt(articuno,X),
  asserta(healt(articuno,Y)),
  Y is X
  write('articuno'),nl,
  write('healt:'),write(Y),nl,
  write('type :water'),nl,
  
  maxhealt(moltres,A),
  asserta(healt(moltres,B)),
  B is A
  write('moltres'),nl,
  write('healt:'),write(B),nl,
  write('type :fire'),nl,
  
  maxhealt(moltres,C),
  asserta(healt(moltres,D)),
  D is C
  write('Zapdos'),nl,
  write('healt:'),write(D),nl,
  write('type :leave'),nl.
  
  
