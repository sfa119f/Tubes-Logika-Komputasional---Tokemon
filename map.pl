:- dynamic(panjangPeta/1).
:- dynamic(lebarPeta/1).
:- dynamic(gym/1).            %gym([X,Y])
:- dynamic(player/1).         %player([X,Y])
:- dynamic(musuh/2).    %musuh(nama,[X,Y])
:- dynamic(battle/1).

makeMap :-
	random(10,20,Panjang),
	random(10,20,Lebar),
	asserta(panjangPeta(Panjang)),
	asserta(lebarPeta(Lebar)),
        !,
	%set gym
	random(1,Panjang,X),
	random(1,Lebar,Y),
	asserta(gym([X,Y])),
	!,
	%set player
	random(1,Panjang,A),
	random(1,Lebar,B),
	asserta(player([A,B])),
	!.

/* Nomor Tokemon (Untuk Random) */
nomor(bulbasaur,1). nomor(oddish,2). nomor(gloom,3).
nomor(charmander,4). nomor(flareon,5). nomor(magmar,6).
nomor(squirtle,7). nomor(magikarp,8). nomor(horsea,9).
nomor(sandshrew,10). nomor(diglett,11). nomor(geodude,12).
nomor(pikachu,13). nomor(electrode,14). nomor(magneton,15).
nomor(pidgey,16). nomor(spearow,17). nomor(zubat,18).

setMusuhBiasa :-
	panjangPeta(Panjang),
	lebarPeta(Lebar),
	random(1,Panjang,A),
	random(1,Lebar,B),
	random(1,6,Musuh1),
	nomor(X,Musuh1),
	%asserta(musuh(X,_)),
	asserta(musuh(X,[A,B])),
	maxhealth(X,HX),
	asserta(healthM(X,HX)),
	!,
	random(1,Panjang,C),
	random(1,Lebar,D),
	random(7,12,Musuh2),
	nomor(Y,Musuh2),
	%asserta(musuh(Y,_)),
	asserta(musuh(Y,[C,D])),
	maxhealth(Y,HY),
	asserta(healthM(Y,HY)),
	!,
	random(1,Panjang,E),
	random(1,Lebar,F),
	random(13,18,Musuh3),
	nomor(Z,Musuh3),
	%asserta(musuh(Z,_)),
	asserta(musuh(Z,[E,F])),
	maxhealth(Z,HZ),
	asserta(healthM(Z,HZ)),
	!.

setMusuhLegend :-
	panjangPeta(Panjang),
	lebarPeta(Lebar),
	random(1,Panjang,A),
	random(1,Lebar,B),
	asserta(musuh(zapdos,[A,B])),
	!,
	random(1,Panjang,C),
	random(1,Lebar,D),
	asserta(musuh(moltres,[C,D])),
	!,
	random(1,Panjang,E),
	random(1,Lebar,F),
	asserta(musuh(articuno,[E,F])),
	!.

map :- play(false), write('start dulu wkwk'), !.
map :- printMap(0,0).

isBorderAtas(_,Y) :-
    Y =:= 0
    ,!.
isBorderKiri(X,_) :-
    X =:= 0,
    !.
isBorderBawah(_,Y) :-
    lebarPeta(T),
    Y =:= T+1,
    !.
isBorderKanan(X,_) :-
    panjangPeta(L),
    X =:= L+1,
	!.
%Print Lokasi Player
printMap(X,Y) :-
	player([A,B]),
	X =:= A,
	Y =:= B,
	write(' P '),
	printMap(X+1,Y).

%Print Lokasi Gym
printMap(X,Y) :-
	gym([A,B]),
	X =:= A,
	Y =:= B,
	write(' G '),
	printMap(X+1,Y).

%Print Lokasi Musuh
printMap(X,Y) :-
	musuh(_,[A,B]),
	X =:= A,
	Y =:= B,
	write(' M '),
	printMap(X+1,Y).

printMap(X,Y) :-
	isBorderBawah(X,Y), isBorderKanan(X,Y), !, write(' X ').
printMap(X,Y) :-
	isBorderKiri(X,Y), !, write(' X '), printMap(X+1,Y).
printMap(X,Y) :-
	isBorderKanan(X,Y), !, write(' X '), nl, printMap(0,Y+1).
printMap(X,Y) :-
	isBorderAtas(X,Y), !, write(' X '), printMap(X+1,Y).
printMap(X,Y) :-
	isBorderBawah(X,Y), !, write(' X '), printMap(X+1,Y).
printMap(X,Y) :-
	write(' - '), printMap(X+1,Y), !.

battle(false).
%battle(false) = Tidak berada di dalam battle.
%battle(true) = Berada di dalam battle.
%battle(false) = Masih belum menentukan Fight or Run.

% MOVE
% 1. North (Atas)
n :- play(false), write('start dulu wkwk'), !.
n :- battle(true), write('Anda berada di dalam Battle.'), !.
n :- battle(pending), write('Anda tidak bisa bergerak.'), nl, write('Fight or Run'), !.
n :- player([X,Y]), Ya is Y-1, isBorderAtas(X,Ya), write('Pagar bro'), !.
n :- player([X,Y]), Ya is Y-1, gym([A,B]), X =:= A, Ya =:= B, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Utara, anda berada pada Gym.'), !.
n :- player([X,Y]), Ya is Y-1, musuh(_,[A,B]), X =:= A, Ya =:= B, retractall(player(_)), asserta(player([X,Ya])), write('A wild Tokemon appears'), nl, nl, printMusuh, write('Fight or Run?'), retract(battle(false)), asserta(battle(pending)), !.
n :- player([X,Y]), Ya is Y-1, musuh(_,[X,Y]), isRun(true), setFalseDone, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Utara, anda berada pada tanah kosong.'), !.
n :- player([X,Y]), Ya is Y-1, musuh(Obj,[X,Y]), dropM(Obj), setFalseDone, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Utara, anda berada pada tanah kosong.'), !.
n :- player([X,Y]), Ya is Y-1, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Utara, anda berada pada tanah kosong.'), !.

% 2. South (Bawah)
s :- play(false), write('start dulu wkwk'), !.
s :- battle(true), write('Anda berada di dalam Battle.'), !.
s :- battle(pending), write('Anda tidak bisa bergerak.'), nl, write('Fight or Run?'), !.
s :- player([X,Y]), Ya is Y+1, isBorderBawah(X,Ya), write('Pagar bro'), !.
s :- player([X,Y]), Ya is Y+1, gym([A,B]), X =:= A, Ya =:= B, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Selatan, anda berada pada Gym.'), !.
s :- player([X,Y]), Ya is Y+1, musuh(_,[A,B]), X =:= A, Ya =:= B, retractall(player(_)), asserta(player([X,Ya])), write('A wild Tokemon appears'), nl, nl, printMusuh, write('Fight or Run?'), retract(battle(false)), asserta(battle(pending)), !.
s :- player([X,Y]), Ya is Y+1, musuh(_,[X,Y]), isRun(true), setFalseDone, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Selatan, anda berada pada tanah kosong.'), !.
s :- player([X,Y]), Ya is Y+1, musuh(Obj,[X,Y]), dropM(Obj), setFalseDone, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Selatan, anda berada pada tanah kosong.'), !.
s :- player([X,Y]), Ya is Y+1, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Selatan, anda berada pada tanah kosong.'), !.

% 3. East (Kanan)
e :- play(false), write('start dulu wkwk'), !.
e :- battle(true), write('Anda berada di dalam Battle.'), !.
e :- battle(pending), write('Anda tidak bisa bergerak.'), nl, write('Fight or Run?'), !.
e :- player([X,Y]), Xa is X+1, isBorderKanan(Xa,Y), write('Pagar bro'), !.
e :- player([X,Y]), Xa is X+1, gym([A,B]), Xa =:= A, Y =:= B, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Timur, anda berada pada Gym.'), !.
e :- player([X,Y]), Xa is X+1, musuh(_,[A,B]), Xa =:= A, Y =:= B, retractall(player(_)), asserta(player([Xa,Y])), write('A wild Tokemon appears'), nl, nl, printMusuh, write('Fight or Run?'),  retract(battle(false)), asserta(battle(pending)), !.
e :- player([X,Y]), Xa is X+1, musuh(_,[X,Y]), isRun(true), setFalseDone, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Timur, anda berada pada tanah kosong.'), !.
e :- player([X,Y]), Xa is X+1, musuh(Obj,[X,Y]), dropM(Obj), setFalseDone, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Timur, anda berada pada tanah kosong.'), !.
e :- player([X,Y]), Xa is X+1, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Timur, anda berada pada tanah kosong.'), !.

% 4. West (Kiri)
w :- play(false), write('start dulu wkwk'), !.
w :- battle(true), write('Anda berada di dalam Battle.'), !.
w :- battle(pending), write('Anda tidak bisa bergerak.'), nl, write('Fight or Run?'), !.
w :- player([X,Y]), Xa is X-1, isBorderKiri(Xa,Y), write('Pagar bro'), !.
w :- player([X,Y]), Xa is X-1, gym([A,B]), Xa =:= A, Y =:= B, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Barat, anda berada pada Gym.'), !.
w :- player([X,Y]), Xa is X-1, musuh(_,[A,B]), Xa =:= A, Y =:= B, retractall(player(_)), asserta(player([Xa,Y])), write('A wild Tokemon appears'), nl, nl, printMusuh, write('Fight or Run?'), retract(battle(false)), asserta(battle(pending)), !.
w :- player([X,Y]), Xa is X-1, musuh(_,[X,Y]), isRun(true), setFalseDone, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Barat, anda berada pada tanah kosong.'), !.
w :- player([X,Y]), Xa is X-1, musuh(Obj,[X,Y]), dropM(Obj), setFalseDone, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Barat, anda berada pada tanah kosong.'), !.
w :- player([X,Y]), Xa is X-1, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Barat, anda berada pada tanah kosong.'), !.

%coba-coba
printposisi :-
	battle(pending),
	player([A,B]),
	musuh(Obj,[A,B]),
	write(Obj).

printMusuh :-
	player([A,B]),
	musuh(Obj,[A,B]),
	write('YOUR ENEMY : '),
	write(Obj),
	type(Obj,XM),
	write(' / Type '), write(XM), nl,
	nl, !.


















