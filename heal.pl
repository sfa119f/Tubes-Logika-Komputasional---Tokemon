:- dynamic(isHeal/1).

heal:- play(false),
       write('gamenya belum mulai, pencet start dulu'),
       nl,!.
heal:- player([X,Y]),gym([A,B]),
       X =\= A, Y =\= B,
       write('Kamu sedang tidak di gym'),
       nl,!.
heal:- isHeal(true),
       write('Tokemon-tokemon kamu sudah pernah diheal'),
       nl,!.
heal:-
	forall(
	    inventory(Obj),
	    (
		retract(healthP(Obj,_)),
		maxhealth(Obj,X),
		asserta(healthP(Obj,X))
	    )
	),
	retract(isHeal(false)),
	asserta(isHeal(true)),
	write('Tokemon-tokemon mu sekarang dalam keadaan powerfull.'),
	nl,!.
