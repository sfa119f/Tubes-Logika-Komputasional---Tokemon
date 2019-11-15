:- dynamic(play/1).
:- dynamic(battle/1).
play(false).
battle(false).
pick(_) :-
	play(false),
	write('Game belum dimulai'),
	nl,!.
pick(Obj) :-
	\+inventory(Obj),!,write('Kamu tidak punya '),write(Obj),write(' di inventorymu'),
	nl,!.
pick(Obj) :-
	battle(false),
	write('Tidak ada musuh bro! Biarkan '),write(Obj),write(' beristirahat.'),
	nl,!.
pick(Obj) :-
	battle(true),
	write('Player: " '),write('Keluarlah '),write(Obj),write(' !"'),nl,nl,
	write(Obj),nl,
	maxhealth(Obj,X),write('Health: '),write(X),nl,
	type(Obj,Y),write('Type: '),write(Y),nl,nl,
	player([A,B]),
	musuh(Msh,[A,B]),
	write(Msh),nl,
	maxhealth(Msh,X),write('Health: '),write(X),nl,
	type(Msh,Y),write('Type: '),write(Y),nl,
	nl,!.


