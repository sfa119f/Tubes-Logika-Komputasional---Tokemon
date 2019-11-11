:-include('map.pl').
:-dynamic(player/2).
:-dynamic(gameMai/1).


asserta(gameMain(1)),
lebarPeta(L),
tinggiPeta(T),
random(1,L,X),
random(1,T,Y),
asserta(player(X,Y)).

u:-
	\+gameMain(_),
	write('Game belum dimulai'),nl,!.
u:-
	player(_,Y),
	Y=:=1,!.
u:-
	retract(player(X,Y)),
	Y > 1,
	newY is Y-1,
	write([X,newY]),nl,
	asserta(player(X,newY)),!.
d:-
	\+gameMain(_),
	write('Game belum dimulai'),nl,!.
d:-
	player(_,Y),
	Y=:=T,!.
d:-
	retract(player(X,Y)),
	Y < T,
	newY is Y+1,
	write([X,newY]),nl,
	asserta(player(X,newY)),!.
l:-
	\+gameMain(_),
	write('Game belum dimulai'),nl,!.
l:-
	player(X,_),
	X=:=1,!.
l:-
	retract(player(X,Y)),
	X > 1,
	newX is X-1,
	write([newX,Y]),nl,
	asserta(player(newX,Y)),!.
r:-
	\+gameMain(_),
	write('Game belum dimulai'),nl,!.
r:-
	player(X,_),
	X=:=L,!.
r:-
	retract(player(X,Y)),
	X < L,
	newX is X + 1,
	write([newX,Y]),nl,
	asserta(player(newX,Y)),!.
