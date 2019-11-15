:- dynamic(panjangPeta/1).
:- dynamic(lebarPeta/1).
:- dynamic(gym/2).
:- dynamic(player/2).


makeMap(Panjang,Lebar) :-
	random(10,20,Panjang),
	random(10,20,Lebar),
	asserta(panjangPeta(Panjang)),
	asserta(lebarPeta(Lebar)),
        !,
	random(10,Panjang,X),
	random(10,Lebar,Y),
	asserta(gym(X,Y)),
	!,
	random(10,Panjang,A),
	random(10,Lebar,B),
	asserta(player(A,B)),
	!.

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
	player(A,B),
	X =:= A,
	Y =:= B,
	write(' P '),
	printMap(X+1,Y).

%Print Lokasi Gym
printMap(X,Y) :-
	gym(A,B),
	X =:= A,
	Y =:= B,
	write(' G '),
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


% MOVE
% 1. North (Atas)
n :- player(X,Y), Ya is Y-1, isBorderAtas(X,Ya), write('Pagar bro'), !.
n :- player(X,Y), Ya is Y-1, gym(A,B), X \== A, Ya \== B, retractall(player(_,_)), asserta(player(X, Ya)), write('Anda bergerak ke Utara, anda berada pada tanah kosong.'), !.
n :- player(X,Y), Ya is Y-1, gym(A,_), X \== A, retractall(player(_,_)), asserta(player(X, Ya)), write('Anda bergerak ke Utara, anda berada pada tanah kosong.'), !.
n :- player(X,Y), Ya is Y-1, gym(_,B), Ya \== B, retractall(player(_,_)), asserta(player(X, Ya)), write('Anda bergerak ke Utara, anda berada pada tanah kosong.'), !.
n :- player(X,Y), Ya is Y-1, gym(A,B), X =:= A, Ya =:= B, retractall(player(_,_)), asserta(player(X, Ya)), write('Anda bergerak ke Utara, anda berada pada Gym.'), !.

% 2. South (Bawah)
s :- player(X,Y), Ya is Y+1, isBorderBawah(X,Ya), write('Pagar bro'), !.
s :- player(X,Y), Ya is Y+1, gym(A,B), X \== A, Ya \== B, retractall(player(_,_)), asserta(player(X, Ya)), write('Anda bergerak ke Selatan, anda berada pada tanah kosong.'), !.
s :- player(X,Y), Ya is Y+1, gym(A,_), X \== A, retractall(player(_,_)), asserta(player(X, Ya)), write('Anda bergerak ke Selatan, anda berada pada tanah kosong.'), !.
s :- player(X,Y), Ya is Y+1, gym(_,B), Ya \== B, retractall(player(_,_)), asserta(player(X, Ya)), write('Anda bergerak ke Selatan, anda berada pada tanah kosong.'), !.
s :- player(X,Y), Ya is Y+1, gym(A,B), X =:= A, Ya =:= B, retractall(player(_,_)), asserta(player(X, Ya)), write('Anda bergerak ke Selatan, anda berada pada Gym.'), !.

% 3. East (Kanan)
e :- player(X,Y), Xa is X+1, isBorderKanan(Xa,Y), write('Pagar bro'), !.
e :- player(X,Y), Xa is X+1, gym(A,B), Xa \== A, Y \== B, retractall(player(_,_)), asserta(player(Xa, Y)), write('Anda bergerak ke Timur, anda berada pada tanah kosong.'), !.
e :- player(X,Y), Xa is X+1, gym(A,_), Xa \== A, retractall(player(_,_)), asserta(player(Xa, Y)), write('Anda bergerak ke Timur, anda berada pada tanah kosong.'), !.
e :- player(X,Y), Xa is X+1, gym(_,B), Y \== B, retractall(player(_,_)), asserta(player(Xa, Y)), write('Anda bergerak ke Timur, anda berada pada tanah kosong.'), !.
e :- player(X,Y), Xa is X+1, gym(A,B), Xa =:= A, Y =:= B, retractall(player(_,_)), asserta(player(Xa, Y)), write('Anda bergerak ke Timur, anda berada pada Gym.'), !.

% 4. West (Kiri)
w :- player(X,Y), Xa is X-1, isBorderKiri(Xa,Y), write('Pagar bro'), !.
w :- player(X,Y), Xa is X-1, gym(A,B), Xa \== A, Y \== B, retractall(player(_,_)), asserta(player(Xa, Y)), write('Anda bergerak ke Barat, anda berada pada tanah kosong.'), !.
w :- player(X,Y), Xa is X-1, gym(A,_), Xa \== A, retractall(player(_,_)), asserta(player(Xa, Y)), write('Anda bergerak ke Barat, anda berada pada tanah kosong.'), !.
w :- player(X,Y), Xa is X-1, gym(_,B), Y \== B, retractall(player(_,_)), asserta(player(Xa, Y)), write('Anda bergerak ke Barat, anda berada pada tanah kosong.'), !.
w :- player(X,Y), Xa is X-1, gym(A,B), Xa =:= A, Y =:= B, retractall(player(_,_)), asserta(player(Xa, Y)), write('Anda bergerak ke Barat, anda berada pada tanah kosong.'), !.
















