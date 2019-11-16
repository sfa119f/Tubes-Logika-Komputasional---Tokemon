drop(_):-
	play(false),
	write('Game belum dimulai'), nl,
	nl,!.
drop(Obj):-
	\+inventory(Obj),!,write('Kamu tidak punya '),write(Obj),write(' di inventorymu'),
	nl,!.
drop(Obj):-
	retract(inventory(Obj)),
	retract(healthP(Obj,_)),
	write('Sayang sekali, Tokemon '),write(Obj),write(' telah dilepaskan'),
	nl,!.
