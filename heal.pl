:- dynamic(healt/2).
:- dynamic(pernah/2).

heal(_) :- play(false),
	   write ('gamenya belum mulai pencet start dulu'),!.

heal(obj) :- player([X,Y]),gym([A,B]),
	   X =\= A, Y =\= B,
	   write('kamu sedang tidak di gym'),nl,!.
heal(obj):-
	   \+inventory(Obj),!,write('Kamu tidak punya '),write(Obj),write(' di inventorymu'),
	    nl,!.

heal(obj) :- healt(obj,Y), 
           Y =:= 0,
	   write('pokemon kamu sudah mati'),nl,!.

heal(obj) :- pernah(obj,d),
	   d =:= 1
           write('Pokemon kamu sudah pernah di heal'),nl,!.

heal(obj) :- retract(healt(obj,Y)),
	    maxhealt(obj,Z), 
            newY is Z, 
	    asserta(obj,newY),
	    pernah(obj,d),
	    d is 1.
		    
