drop(_):-
	play(false),
	write('Game belum dimulai'), nl,
	nl,!.
drop(Obj):-
	\+inventory(Obj),!,write('Kamu tidak punya '),write(Obj),write(' di inventorymu'),
	nl,!.
drop(Obj):-
	retrect(inventory(Obj)),
	retrect(healthP(Obj,_)),
	nl,!.
