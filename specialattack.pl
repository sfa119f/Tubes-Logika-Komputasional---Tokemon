
:- dynamic(doneAttack/1). %sudah melakukan special attack
%leaves-water
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,leaves),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, water),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*3/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
        write('Special attacks can only be used once per battle!'),nl.

%leaves-ground
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,leaves),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, ground),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*3/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1)),
    %sudah pernah melakukan special attack
    doneAttack(1) -> write('Special attacks can only be used once per battle!'),nl.

%leaves-fire
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,leaves),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy,fire),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*1/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%leaves-flying
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,leaves),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy,flying),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*1/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%fire-leaves
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,fire),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy,leaves),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*3/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%fire-water
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,fire),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, water),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*1/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%fire-ground
special(X,Enemy) :-
    assert(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,fire),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy,ground),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*1/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%water-fire
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,water),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, fire),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*3/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%water-ground
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,water),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, ground),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*3/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%water-leaves
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,water),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, leaves),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*1/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%water-electric
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,water),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy,electric),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*3/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%ground-fire
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,ground),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, fire),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*3/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%ground-electric
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,ground),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy,electric),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*3/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%ground-water
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,ground),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy,leaves),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*1/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%ground-leaves
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,ground),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy,leaves),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*1/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%electric-water
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,electric),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, water),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*3/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%electric-flying
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,electric),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, flying),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*3/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%electric-ground
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,electric),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy,ground),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*1/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%flying-grass
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,flying),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy,grass),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*3/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.

%flying-electric
special(X,Enemy) :-
    asserta(doneAttack(0)),
    specialattack(X,Damage,Name),
    type(X,flying),
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy,electric),

    doneAttack(0) ->
        write(X), write(' uses '),write(Name), write(' ! '),nl,
        write('COOL!! SUPER EFFECTIVE!'), nl,
        write('You dealt '),
        DamageNew is Damage*1/2,
        write(DamageNew),write(' Damage to '), write(Enemy), nl,
        updateHealthMusuh(Enemy,DamageNew),
        printStatusAttack(X,Enemy),
        retract(doneAttack(0)),
        asserta(doneAttack(1));
    %sudah pernah melakukan special attack
    write('Special attacks can only be used once per battle!'),nl.
