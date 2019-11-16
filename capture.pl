:- dynamic(jumInv/1).

capture:-
	play(false),
	write('Game belum dimulai'), nl,
	nl,!.
capture:-
	player([A,B]),
	musuh(_,[X,Y]),
	A\==X, B\==Y,
	write('Tidak ada musuh yang dicapture.'),
	nl,!.
capture:-
	player([A,B]),
	musuh(Obj,[A,B]),
	healthM(Obj,X),
	X\==0,
	write('Musuh belum menyerah, lawan dulu dong!'),
	nl,!.
capture:-
	jumInv(X),X=:=6,
	write('Inventory penuh, drop inventory duls.'),
	nl,!.
capture:-
	jumInv(X),
	Xn is X+1,
	retract((jumInv,_)),
	asserta(jumInv(Xn)),
	player([A,B]),
	musuh(Obj,[A,B]),
	asserta(inventory(Obj)),
	maxhealth(Obj,A),
	asserta(healthP(Obj,A)),
	write(Obj), write(' berhasil ditangkap, YEAY!!'),
	nl,!.



