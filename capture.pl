:- dynamic(jumInv/1).
:- dynamic(jumLegend/1).
:- dynamic(jumMusuh/1).

capture:-
	play(false),
	write('Game belum dimulai'), nl,
	nl,!.

capture:-
	play(true),
	player([A,B]),
	musuh(Obj,[A,B]),
	healthM(Obj,X),
	X>0,
	write('Musuh belum menyerah, lawan dulu dong!'),
	nl,!.

capture:-
	play(true),
	player([A,B]),
	musuh(_,[A,B]),
	jumInv(X),X=:=6,
	write('Inventory penuh, drop inventory duls.'),
	nl,!.

capture:-
	play(true),
	retractall(doneAttack(_)),
	asserta(doneAttack(false)),

	player([A,B]),
	musuh(Obj,[A,B]),
	(jenis(Obj,legendary)->
	    jumLegend(Y),
	    Yn is Y-1,
	    retractall(jumLegend(_)),
	    asserta(jumLegend(Yn))
	    ;
	    !
	),
	jumMusuh(Z),
	Zn is Z-1,
	retractall(jumMusuh(_)),
	asserta(jumMusuh(Zn)),

	(inventory(Obj)->
	    retract(healthP(Obj,_))
	    ;
	    jumInv(X),
	    Xn is X+1,
	    retract(jumInv(_)),
	    asserta(jumInv(Xn)),
	    asserta(inventory(Obj))
	),
	maxhealth(Obj,HObj),
	asserta(healthP(Obj,HObj)),
	write(Obj), write(' berhasil ditangkap, YEAY!!'),
	nl, dropM(Obj), !.

capture:-
	write('Tidak ada musuh yang dicapture.'),
	nl,!.



















