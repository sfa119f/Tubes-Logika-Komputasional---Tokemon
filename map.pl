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
	nomor(X,1),
	asserta(musuh(X,[A,B])),
	maxhealth(X,HX),
	asserta(healthM(X,HX)),
	!,
	random(1,Panjang,C),
	random(1,Lebar,D),
	nomor(Y,2),
	asserta(musuh(Y,[C,D])),
	maxhealth(Y,HY),
	asserta(healthM(Y,HY)),
	!,
	random(1,Panjang,E),
	random(1,Lebar,F),
	nomor(Z,3),
	asserta(musuh(Z,[E,F])),
	maxhealth(Z,HZ),
	asserta(healthM(Z,HZ)),
	!,
	random(1,Panjang,G),
	random(1,Lebar,H),
	nomor(P,4),
	asserta(musuh(P,[G,H])),
	maxhealth(P,HP),
	asserta(healthM(P,HP)),
	!,
	random(1,Panjang,I),
	random(1,Lebar,J),
	nomor(Q,5),
	asserta(musuh(Q,[I,J])),
	maxhealth(Q,HQ),
	asserta(healthM(Q,HQ)),
	!,
	random(1,Panjang,K),
	random(1,Lebar,L),
	nomor(R,6),
	asserta(musuh(R,[K,L])),
	maxhealth(R,HR),
	asserta(healthM(R,HR)),
	!,
	random(1,Panjang,MM),
	random(1,Lebar,NN),
	nomor(M,7),
	asserta(musuh(M,[MM,NN])),
	maxhealth(M,HM),
	asserta(healthM(M,HM)),
	!,
	random(1,Panjang,OO),
	random(1,Lebar,PP),
	nomor(N,8),
	asserta(musuh(N,[OO,PP])),
	maxhealth(N,HN),
	asserta(healthM(N,HN)),
	!,
	random(1,Panjang,QQ),
	random(1,Lebar,RR),
	nomor(O,9),
	asserta(musuh(O,[QQ,RR])),
	maxhealth(O,HO),
	asserta(healthM(O,HO)),
	!,
	random(1,Panjang,AA),
	random(1,Lebar,AB),
	nomor(AC,10),
	asserta(musuh(AC,[AA,AB])),
	maxhealth(AC,AD),
	asserta(healthM(AC,AD)),
	!,
	random(1,Panjang,BA),
	random(1,Lebar,BB),
	nomor(BC,11),
	asserta(musuh(BC,[BA,BB])),
	maxhealth(BC,BD),
	asserta(healthM(BC,BD)),
	!,
	random(1,Panjang,CA),
	random(1,Lebar,CB),
	nomor(CC,12),
	asserta(musuh(CC,[CA,CB])),
	maxhealth(CC,CD),
	asserta(healthM(CC,CD)),
	!,
	random(1,Panjang,DA),
	random(1,Lebar,DB),
	nomor(DC,13),
	asserta(musuh(DC,[DA,DB])),
	maxhealth(DC,DD),
	asserta(healthM(DC,DD)),
	!,
	random(1,Panjang,EA),
	random(1,Lebar,EB),
	nomor(EC,14),
	asserta(musuh(EC,[EA,EB])),
	maxhealth(EC,ED),
	asserta(healthM(EC,ED)),
	!,
	random(1,Panjang,FA),
	random(1,Lebar,FB),
	nomor(FC,15),
	asserta(musuh(FC,[FA,FB])),
	maxhealth(FC,FD),
	asserta(healthM(FC,FD)),
	!,
	random(1,Panjang,GA),
	random(1,Lebar,GB),
	nomor(GC,16),
	asserta(musuh(GC,[GA,GB])),
	maxhealth(GC,GD),
	asserta(healthM(GC,GD)),
	!,
	random(1,Panjang,HA),
	random(1,Lebar,HB),
	nomor(HC,17),
	asserta(musuh(HC,[HA,HB])),
	maxhealth(HC,HD),
	asserta(healthM(HC,HD)),
	!,
	random(1,Panjang,IA),
	random(1,Lebar,IB),
	nomor(IC,18),
	asserta(musuh(IC,[IA,IB])),
	maxhealth(IC,ID),
	asserta(healthM(IC,ID)),
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


randomPosisi :-
	forall((musuh(Obj,_)),
		(panjangPeta(P),
		lebarPeta(L),
		random(1,P,A),
		random(1,L,B),
		retractall(musuh(Obj,_)),
		asserta(musuh(Obj,[A,B])), !
		)
	), !.

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
	printMap(X+1,Y), !.

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
n :- randomPosisi, player([X,Y]), Ya is Y-1, musuh(_,[X,Y]), isRun(true), setFalseDone, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Utara, anda berada pada tanah kosong.'), !.
n :- randomPosisi, player([X,Y]), Ya is Y-1, musuh(Obj,[X,Y]), dropM(Obj), setFalseDone, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Utara, anda berada pada tanah kosong.'), !.
n :- randomPosisi, player([X,Y]), Ya is Y-1, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Utara, anda berada pada tanah kosong.'),!.

% 2. South (Bawah)
s :- play(false), write('start dulu wkwk'), !.
s :- battle(true), write('Anda berada di dalam Battle.'), !.
s :- battle(pending), write('Anda tidak bisa bergerak.'), nl, write('Fight or Run?'), !.
s :- player([X,Y]), Ya is Y+1, isBorderBawah(X,Ya), write('Pagar bro'), !.
s :- player([X,Y]), Ya is Y+1, gym([A,B]), X =:= A, Ya =:= B, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Selatan, anda berada pada Gym.'), !.
s :- player([X,Y]), Ya is Y+1, musuh(_,[A,B]), X =:= A, Ya =:= B, retractall(player(_)), asserta(player([X,Ya])), write('A wild Tokemon appears'), nl, nl, printMusuh, write('Fight or Run?'), retract(battle(false)), asserta(battle(pending)), !.
s :- randomPosisi, player([X,Y]), Ya is Y+1, musuh(_,[X,Y]), isRun(true), setFalseDone, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Selatan, anda berada pada tanah kosong.'), !.
s :- randomPosisi, player([X,Y]), Ya is Y+1, musuh(Obj,[X,Y]), dropM(Obj), setFalseDone, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Selatan, anda berada pada tanah kosong.'), !.
s :- randomPosisi, player([X,Y]), Ya is Y+1, retractall(player(_)), asserta(player([X,Ya])), write('Anda bergerak ke Selatan, anda berada pada tanah kosong.'),!.

% 3. East (Kanan)
e :- play(false), write('start dulu wkwk'), !.
e :- battle(true), write('Anda berada di dalam Battle.'), !.
e :- battle(pending), write('Anda tidak bisa bergerak.'), nl, write('Fight or Run?'), !.
e :- player([X,Y]), Xa is X+1, isBorderKanan(Xa,Y), write('Pagar bro'), !.
e :- player([X,Y]), Xa is X+1, gym([A,B]), Xa =:= A, Y =:= B, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Timur, anda berada pada Gym.'), !.
e :- player([X,Y]), Xa is X+1, musuh(_,[A,B]), Xa =:= A, Y =:= B, retractall(player(_)), asserta(player([Xa,Y])), write('A wild Tokemon appears'), nl, nl, printMusuh, write('Fight or Run?'),  retract(battle(false)), asserta(battle(pending)), !.
e :- randomPosisi, player([X,Y]), Xa is X+1, musuh(_,[X,Y]), isRun(true), setFalseDone, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Timur, anda berada pada tanah kosong.'), !.
e :- randomPosisi, player([X,Y]), Xa is X+1, musuh(Obj,[X,Y]), dropM(Obj), setFalseDone, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Timur, anda berada pada tanah kosong.'), !.
e :- randomPosisi, player([X,Y]), Xa is X+1, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Timur, anda berada pada tanah kosong.'),!.

% 4. West (Kiri)
w :- play(false), write('start dulu wkwk'), !.
w :- battle(true), write('Anda berada di dalam Battle.'), !.
w :- battle(pending), write('Anda tidak bisa bergerak.'), nl, write('Fight or Run?'), !.
w :- player([X,Y]), Xa is X-1, isBorderKiri(Xa,Y), write('Pagar bro'), !.
w :- player([X,Y]), Xa is X-1, gym([A,B]), Xa =:= A, Y =:= B, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Barat, anda berada pada Gym.'), !.
w :- player([X,Y]), Xa is X-1, musuh(_,[A,B]), Xa =:= A, Y =:= B, retractall(player(_)), asserta(player([Xa,Y])), write('A wild Tokemon appears'), nl, nl, printMusuh, write('Fight or Run?'), retract(battle(false)), asserta(battle(pending)), !.
w :- randomPosisi, player([X,Y]), Xa is X-1, musuh(_,[X,Y]), isRun(true), setFalseDone, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Barat, anda berada pada tanah kosong.'), !.
w :- randomPosisi, player([X,Y]), Xa is X-1, musuh(Obj,[X,Y]), dropM(Obj), setFalseDone, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Barat, anda berada pada tanah kosong.'), !.
w :- randomPosisi, player([X,Y]), Xa is X-1, retractall(player(_)), asserta(player([Xa,Y])), write('Anda bergerak ke Barat, anda berada pada tanah kosong.'), !.

%coba-coba
printposisi :-
	battle(pending),
	player([A,B]),
	musuh(Obj,[A,B]),
	write(Obj).

printMusuh :-
	player([A,B]),
	musuh(Obj,[A,B]),
	(jenis(Obj,legendary) -> 
		write('Oh No! You Meet A Legendary Tokemon.'), nl;
		!
	)
	write('YOUR ENEMY : '),
	write(Obj),
	type(Obj,XM),
	write(' / Type '), write(XM), nl,
	nl, !.


















