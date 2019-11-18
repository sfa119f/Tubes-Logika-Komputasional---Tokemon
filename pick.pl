:- dynamic(pickTokemon/1).

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
	retractall(pickTokemon(_)),
	asserta(pickTokemon(Obj)),
	write('Player: " '),write('Keluarlah '),write(Obj),write(' !"'),nl,nl,

	write(Obj),nl,
	healthP(Obj,XP),write('Health: '),write(XP),nl,
	type(Obj,YP),write('Type: '),write(YP),nl,nl,

	player([A,B]),
	musuh(Msh,[A,B]),
	write(Msh),nl,
	healthM(Msh,XM),write('Health: '),write(XM),nl,
	type(Msh,YM),write('Type: '),write(YM),nl,
	nl,!.



