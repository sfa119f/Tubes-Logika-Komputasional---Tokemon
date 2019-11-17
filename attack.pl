

printStatusAttack(Player, Enemy) :-
    inventory(Player),
    write(Player), nl,
    health(Player,X),write('Health : '),write(X),nl,
    type(Player,X),write('Type   : '),nl,nl,
	nl,
    legend(Enemy),
    write(Enemy), nl,
    healthMusuh(Enemy,X),write('Health : '),write(X),nl,
    type(Enemy,X),write('Type   : '),nl,nl,
	nl,!.


%update health dengan x sebagai tokemon dan y sebagai serangan 
updateHealth(X,Y) :-
    retract(health(X,Darah)),
    Darahbaru is Darah-Y,
    asserta(health(X, Darahbaru)).

updateHealthMusuh(X,Y) :-
    retract(healthMusuh(X,Darah)),
    Darahbaru is Darah-Y,
    asserta(healthMusuh(X, Darahbaru)).

%attack leaves-water     
attack(X, Enemy) :-
    pick(X),
    type(X, leaves),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, water),

    healthMusuh(Enemy,Atr),
    play(true),
        Atr > 0 ->
            attack(X,DamageP), %fakta attack dari main.pl
            DamagePNew is DamageP*3/2, %Damage lebih besar 50% dari biasanya.
            write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
            updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
            printStatusAttack(X,Enemy), %print status tokemon dan enemy
            write(Enemy), write(' attacks!'),nl,
            attack(Enemy,DamageM), %fakta dari main.pl
            DamageMNew is DamageM*1/2, %(water->leaves) Damage lebih kecil 50% dari biasanya.
            write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
            updateHealth(X, DamageMNew), 
            printStatusAttack(X,Enemy);
        %faint
        write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
        write(Enemy),write(', otherwise move away.)').

%attack leaves-ground     
attack(X, Enemy) :-
    pick(X),
    type(X, leaves),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, ground),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*3/2, %Damage lebih besar 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*1/2, %(ground->leaves) Damage lebih kecil 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy), write(', otherwise move away.)').

%attack leaves-fire     
attack(X, Enemy) :-
    pick(X),
    type(X, leaves),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, fire),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*1/2, %Damage lebih kecil 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*3/2, %(fire->leaves) Damage lebih besar 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy), write(', otherwise move away.)').

%attack leaves-flying      
attack(X, Enemy) :-
    pick(X),
    type(X, leaves),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, flying),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*1/2, %Damage lebih kecil 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*3/2, %(flying->leaves) Damage lebih besar 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy),write(', otherwise move away.)').

%attack fire-leaves   
attack(X, Enemy) :-
    pick(X),
    type(X, fire),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, leaves),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*3/2, %Damage lebih besar 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*1/2, %(leaves->fire) Damage lebih kecil 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy),write(', otherwise move away.)').

%attack fire-water    
attack(X, Enemy) :-
    pick(X),
    type(X, fire),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, water),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*1/2, %Damage lebih kecil 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*3/2, %(water->fire) Damage lebih besar 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy),write(', otherwise move away.)').

%attack fire-ground     
attack(X, Enemy) :-
    pick(X),
    type(X, fire),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, ground),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*1/2, %Damage lebih kecil 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*3/2, %(ground->fire) Damage lebih besar 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy),write(', otherwise move away.)').

%attack water-fire     
attack(X, Enemy) :-
    pick(X),
    type(X, water),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, fire),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*3/2, %Damage lebih besar 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*1/2, %(water->leaves) Damage lebih kecil 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy),write(', otherwise move away.)').

%attack water-electric     
attack(X, Enemy) :-
    pick(X),
    type(X, water),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, electric),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*1/2, %Damage lebih kecil 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*3/2, %(electric->water) Damage lebih besar 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy),write(', otherwise move away.)').

%attack ground-fire    
attack(X, Enemy) :-
    pick(X),
    type(X, ground),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, fire),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*3/2, %Damage lebih besar 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*1/2, %(fire->ground) Damage lebih kecil 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy),write(', otherwise move away.)').

%attack ground-electric     
attack(X, Enemy) :-
    pick(X),
    type(X, ground),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, electric),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*3/2, %Damage lebih besar 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*1/2, %(electric->ground) Damage lebih kecil 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy),write(', otherwise move away.)').

%attack ground-water     
attack(X, Enemy) :-
    pick(X),
    type(X, ground),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, water),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*1/2, %Damage lebih kecil 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*3/2, %(water->ground) Damage lebih besar 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy),write(', otherwise move away.)').

%attack ground-leaves     
attack(X, Enemy) :-
    pick(X),
    type(X, ground),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, leaves),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*1/2, %Damage lebih kecil 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*3/2, %(leaves->ground) Damage lebih besar 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy),write(', otherwise move away.)').

%attack electric-water     
attack(X, Enemy) :-
    pick(X),
    type(X, electric),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, water),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*3/2, %Damage lebih besar 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*1/2, %(water->electric) Damage lebih kecil 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy),write(', otherwise move away.)').

%attack electric-flying     
attack(X, Enemy) :-
    pick(X),
    type(X, electric),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, flying),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*3/2, %Damage lebih besar 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*1/2, %(flying->electric) Damage lebih kecil 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy), (' , otherwise move away.').

%attack electric-ground     
attack(X, Enemy) :-
    pick(X),
    type(X, electric),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, ground),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*1/2, %Damage lebih kecil 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*3/2, %(ground->electric) Damage lebih besar 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy), (' , otherwise move away.').

%attack flying-leaves     
attack(X, Enemy) :-
    pick(X),
    type(X, flying),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, leaves),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*3/2, %Damage lebih besar 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*1/2, %(leaves->flying) Damage lebih kecil 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy), (' , otherwise move away.').

%attack flying-electric     
attack(X, Enemy) :-
    pick(X),
    type(X, flying),

    %enemy 
    player([A,B]),
    musuh(Enemy, [A,B]),
    type(Enemy, electric),

    healthMusuh(Enemy,Atr),
    (Atr > 0) ->
        attack(X,DamageP), %fakta attack dari main.pl
        DamagePNew is DamageP*1/2, %Damage lebih kecil 50% dari biasanya.
        write('You dealt '), write(DamagePNew), write(' Damage to '), write(Enemy),
        updateHealthMusuh(Enemy,DamagePNew), %update health dari enemy
        printStatusAttack(X,Enemy), %print status tokemon dan enemy
        write(Enemy), write(' attacks!'),nl,
        attack(Enemy,DamageM), %fakta dari main.pl
        DamageMNew is DamageM*3/2, %(electric->flying) Damage lebih besar 50% dari biasanya.
        write('It dealts '), write(DamageMNew), write(' Damage to '), write(X), nl,
        updateHealth(X, DamageMNew), 
        printStatusAttack(X,Enemy);
    %faint
    write(Enemy), write(' faints! Do you want to capture '), write(Enemy), write(' ? (capture/0 to capture '),
    write(Enemy), (' , otherwise move away.').

% specialAttack :-
%     pick(X),
%     specialattack(X,Y),
%     write(X),write (' uses '), write() , nl,
%     write('It was super effective!'), nl,
%     write('You dealt '), write(_), write(' Damage to '), write %enemy
%     update( ,_)
%     printStatusAttack(X, ). %enemy

    


