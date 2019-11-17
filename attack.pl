

fight :- battle(false), write('Anda tidak bertemu musuh.'),!.
fight :- battle(true), write('Anda sudah berada dalam battle.'),!.
fight :-
	battle(pending),

	retract(battle(_)),
	asserta(battle(true)),
	printInventory,
	!.

:- dynamic(acakrun/1).
peluangRun :- random(0,4,A),
	assert(acakrun(A)),!.

run :- battle(false), write('Anda tidak bertemu musuh.'),!.
run :-
	battle(true),
	write('Anda sedang berada dalam battle'), nl,
	write('Anda tidak bisa Run.'),!.

run :-
	battle(pending),

	peluangRun,
	acakrun(A),
	A =:= 0,

	retract(battle(_)),
	assert(battle(true)),

	write('You failed to run!'), nl,
	write('Choose your Tokemon!'),nl,

	printInventory,
	!.

run :-
	battle(pending),

	peluangRun,
	acakrun(A),
	A > 0,

	retract(battle(_)),
	assert(battle(false)),

	write('You succesfully escaped the Tokemon.'),
	!.

printInventory :-
	write('Available Tokemons: '),
	forall(inventory(Obj),
		  (
			write('['),
		        write(Obj),
		        write(']')
		  )
	).

printStatusAttack(Player, Enemy) :-
    inventory(Player),
    write(Player), nl,
    healthP(Player,X),write('Health : '),write(X),nl,
    type(Player,X),write('Type   : '),nl,nl,
	nl,
    legend(Enemy),
    write(Enemy), nl,
    healthM(Enemy,X),write('Health : '),write(X),nl,
    type(Enemy,X),write('Type   : '),nl,nl,
	nl,!.


%update health dengan x sebagai tokemon dan y sebagai serangan
updateHealth(X,Y) :-
    retract(healthP(X,Darah)),
    Darahbaru is Darah-Y,
    asserta(healthP(X, Darahbaru)).

updateHealthMusuh(X,Y) :-
    retract(healthM(X,Darah)),
    Darahbaru is Darah-Y,
    asserta(healthM(X, Darahbaru)).

pattackLebih(X,Enemy) :-
	 attack(X,DamageP),
	 DamagePNew is DamageP*3/2,
	 write('You dealt '), write(DamagePNew), write(' damage to '), write(Enemy), nl,
	 updateHealthMusuh(Enemy,DamagePNew),
	 printStatusAttack(X,Enemy), !.

pattackKurang(X,Enemy) :-
	 attack(X,DamageP),
	 DamagePNew is DamageP*1/2,
	 write('You dealt '), write(DamagePNew), write(' damage to '), write(Enemy), nl,
	 updateHealthMusuh(Enemy,DamagePNew),
	 printStatusAttack(X,Enemy), !.

pattack(X,Enemy) :-
	 attack(X,DamageP),
	 write('You dealt '), write(DamageP), write(' damage to '), write(Enemy), nl,
	 updateHealthMusuh(Enemy,DamageP),
	 printStatusAttack(X,Enemy), !.

mattackLebih(X,Enemy) :-
	write(Enemy), write(' attacks!'), nl,
	attack(Enemy,DamageM),
	DamageMNew is DamageM*3/2,
	write('It dealts '), write(DamageMNew), write(' damage to '), write(X), nl,
	updateHealth(X,DamageMNew),
	printStatusAttack(X,Enemy), !.

mattackKurang(X, Enemy) :-
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM),
        DamageMNew is DamageM*1/2,
        write('It dealts '), write(DamageMNew), write(' damage to '), write(X), nl,
        updateHealth(X,DamageMNew),
        printStatusAttack(X,Enemy), !.

mattack(X, Enemy) :-
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM),
        write('It dealts '), write(DamageM), write(' damage to '), write(X), nl,
        updateHealth(X,DamageM),
        printStatusAttack(X,Enemy), !.

attack :- play(false), write('Start dulu'), !.
attack :- battle(false), write('Anda tidak sedang dalam battle.'), !.
attack :- battle(pending), write('Fight or Run?'),!.

/* 1. Leaves vs Water */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, leaves),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, water),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackLebih(X,Enemy),
				mattackKurang(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 2. Leaves vs Ground */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, leaves),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, ground),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackLebih(X,Enemy),
				mattackKurang(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 3. Leaves vs Fire */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, leaves),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, fire),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackKurang(X,Enemy),
				mattackLebih(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 4. Leaves vs Flying */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, leaves),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, flying),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackKurang(X,Enemy),
				mattackLebih(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.


/* 5. Leaves vs Leaves */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, leaves),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, leaves),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattack(X,Enemy),
				mattack(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 6. Leaves vs Electric */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, leaves),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, electric),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattack(X,Enemy),
				mattack(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.


/* 7. Fire vs Leaves */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, fire),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, leaves),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackLebih(X,Enemy),
				mattackKurang(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 8. Fire vs Fire */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, fire),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, fire),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattack(X,Enemy),
				mattack(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 9. Fire vs Water */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, fire),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, water),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackKurang(X,Enemy),
				mattackLebih(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 10. Fire vs Ground */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, fire),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, ground),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackKurang(X,Enemy),
				mattackLebih(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 11. Fire vs Electric */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, fire),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, electric),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattack(X,Enemy),
				mattack(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 12. Fire vs Flying */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, fire),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, flying),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattack(X,Enemy),
				mattack(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 13. Water vs Leaves */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, water),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, leaves),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackKurang(X,Enemy),
				mattackLebih(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 14. Water vs Fire */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, water),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, fire),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackLebih(X,Enemy),
				mattackKurang(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 15. Water vs Water */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, water),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, water),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattack(X,Enemy),
				mattack(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 16. Water vs Ground */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, water),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, ground),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackLebih(X,Enemy),
				mattackKurang(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 17. Water vs Electric */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, water),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, electric),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackKurang(X,Enemy),
				mattackLebih(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 18. Water vs Flying */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, water),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, flying),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackLebih(X,Enemy),
				mattackKurang(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 19. Ground vs Leaves */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, ground),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, leaves),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackKurang(X,Enemy),
				mattackLebih(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 20. Ground vs Fire */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, ground),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, fire),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackLebih(X,Enemy),
				mattackKurang(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 21. Ground vs Water */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, ground),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, water),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackKurang(X,Enemy),
				mattackLebih(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 22. Ground vs Ground */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, ground),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, ground),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattack(X,Enemy),
				mattack(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 23. Ground vs Electric */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, ground),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, electric),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackLebih(X,Enemy),
				mattackKurang(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 24. Ground vs Flying */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, ground),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, flying),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattack(X,Enemy),
				mattack(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 25. Electric vs Leaves */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, electric),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, leaves),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattack(X,Enemy),
				mattack(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 26. Electric vs Fire */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, electric),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, fire),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattack(X,Enemy),
				mattack(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 27. Electric vs Water */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, electric),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, water),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackLebih(X,Enemy),
				mattackKurang(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 28. Electric vs Ground */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, electric),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, ground),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackKurang(X,Enemy),
				mattackLebih(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 29. Electric vs Electric */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, electric),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, electric),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattack(X,Enemy),
				mattack(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 30. Electric vs Flying */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, electric),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, flying),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackLebih(X,Enemy),
				mattackKurang(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 31. Flying vs Leaves */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, flying),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, leaves),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackLebih(X,Enemy),
				mattackKurang(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 32. Flying vs Fire */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, flying),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, fire),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattack(X,Enemy),
				mattack(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 33. Flying vs Water */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, flying),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, water),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattack(X,Enemy),
				mattack(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 34. Flying vs Ground */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, flying),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, ground),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattack(X,Enemy),
				mattack(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 35. Flying vs Electric */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, flying),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, electric),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackKurang(X,Enemy),
				mattackLebih(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.

/* 36. Flying vs Flying */
attack :-
    battle(true),
    pickTokemon(X),
    type(X, flying),

    %enemy
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, flying),
	healthP(X,P),
    healthM(Enemy,M),
    (	(M > 0) ->
			( (P > 0) ->
		        pattackLebih(X,Enemy),
				mattackKurang(X,Enemy), !;
				/* Pokemon Player Mati */
				retract(inventory(X)),
				retract(pickPokemon(_)),
				jumInv(A), B is A-1, asserta(jumInv(B)),
				( (B =:= 0) ->
					kalah, !;
					write(X), write(' kalah. Segera pilih Tokemonmu yang lain!'), printInventory, !
				)
			), !;
		/* Musuh Mati */
		write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? capture/0 to capture '),
		write(Enemy), write(' , otherwise move away.'),
		retract(battle(true)),
		asserta(battle(false))
    ), !.
