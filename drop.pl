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
	jumInv(X),
	Xn is X-1,
	retract(jumInv(_)),
	asserta(jumInv(Xn)),
	write('Sayang sekali, Tokemon '),write(Obj),write(' telah dilepaskan'),
	nl,!.

dropP(Obj):-
	retract(inventory(Obj)),
	retract(healthP(Obj,_)),
	jumInv(X),
	Xn is X-1,
	retract(jumInv(_)),
	asserta(jumInv(Xn)),
	!.

dropM(Obj):-
	retract(musuh(Obj,_)),
	retract(healthM(Obj,_)),
	jumMusuh(X),
	Xn is X-1,
	retract(jumMusuh(_)),
	asserta(jumMusuh(Xn)),
	(jenis(Obj,legendary)->
	    retract(legend(Obj)),
	    jumLegend(Y),
	    Yn is Y-1,
	    retract(jumLegend(_)),
	    asserta(jumLegend(Yn))
	    ;
	    !
	),
	!.
