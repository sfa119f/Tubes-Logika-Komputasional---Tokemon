heal(X) :- Player(X,Y),
		   GYM(A,B),
		   X =\= A, Y =\= B,
		   write('kamu sedang tidak di gym'),nl,!.
heal(X) :- healt(X,Y), 
		   Y =:= 0,
		   write('pokemon kamu sudah mati'),nl,!.
heal(X) :- pernah(d),
		   d =:= 1
		   write('Pokemon kamu sudah pernah di heal'),nl,!.
heal(X) :- retract(healt(X,Y)),
		   maxhealt(X,Z), 
		   newY is Z, 
		   asserta(X,newY),
		   pernah(d),
		   d is 1.
		    
