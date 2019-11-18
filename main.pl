:- include('attack.pl').
:- include('specialattack.pl').
:- include('status.pl').
:- include('map.pl').
:- include('set.pl').
:- include('heal.pl').
:- include('pick.pl').
:- include('capture.pl').
:- include('drop.pl').
:- dynamic(play/1).
:- dynamic(menang/1).
:- dynamic(kalah/1).

% FAKTA

% VARIASI

% VARIASI TOKEMON
% Jumlah Tokemon : 18 Normal Tokemon + 3 Legendary Tokemon
% a. Normal Tokemon
tokemon(bulbasaur). tokemon(oddish). tokemon(gloom).
tokemon(charmander). tokemon(flareon). tokemon(magmar).
tokemon(squirtle). tokemon(magikarp). tokemon(horsea).
tokemon(sandshrew). tokemon(diglett). tokemon(geodude).
tokemon(pikachu). tokemon(electrode). tokemon(magneton).
tokemon(pidgey). tokemon(spearow). tokemon(zubat).
% b. Legendary Tokemon
tokemon(zapdos). tokemon(moltres). tokemon(articuno).


% -------------------------------------
% VARIASI JENIS TOKEMON a. Jenis Normal
jenis(bulbasaur, normal). jenis(oddish, normal). jenis(gloom, normal).
jenis(charmander, normal). jenis(flareon, normal). jenis(magmar, normal).
jenis(squirtle, normal). jenis(magikarp, normal). jenis(horsea, normal).
jenis(sandshrew, normal). jenis(diglett, normal). jenis(geodude, normal).
jenis(pikachu, normal). jenis(electrode, normal). jenis(magneton, normal).
jenis(pidgey, normal). jenis(spearow, normal). jenis(zubat, normal).
% b. Jenis Legendary
jenis(zapdos, legendary). jenis(moltres, legendary). jenis(articuno, legendary).

% -------------------------------------
% VARIASI TYPE TOKEMON
% a. Type Leaves
%    jika melawan Tokemon type :
%        1. water    : Damage lebih besar 50% dari biasanya.
%        2. ground   : Damage lebih besar 50% dari biasanya.
%        3. fire     : Damage lebih kecil 50% dari biasanya.
%        4. flying   : Damage lebih kecil 50% dari biasanya.
%
% - Normal Tokemon
type(bulbasaur, leaves). type(oddish, leaves). type(gloom, leaves).
% - Legendary Tokemon
type(zapdos, leaves).

% b. Type Fire
%    jika melawan Tokemon type :
%        1. leaves   : damage lebih besar 50% dari biasanya.
%        2. water    : damage lebih kecil 50% dari biasanya.
%        3. ground   : damage lebih kecil 50% dari biasanya.
%
% - Normal Tokemon
type(charmander, fire). type(flareon, fire). type(magmar, fire).
% - Legendary Tokemon
type(moltres, fire).

% c. Type Water
%    jika melawan Tokemon type :
%        1. fire     : damage lebih besar 50% dari biasanya.
%        2. ground   : damage lebih besar 50% dari biasanya.
%        3. leaves   : damage lebih kecil 50% dari biasanya.
%        4. electric : damage lebih kecil 50% dari biasanya.
%
% - Normal Tokemon
type(squirtle, water). type(magikarp, water). type(horsea, water).
% - Legendary Tokemon
type(articuno, water).

% < BONUS >
% d. Type Ground
%    jika melawan Tokemon type :
%        1. fire     : damage lebih besar 50% dari biasanya.
%        2. electric : damage lebih besar 50% dari biasanya.
%        3. water    : damage lebih kecil 50% dari biasanya.
%        4. leaves   : damage lebih kecil 50% dari biasanya.
%
% - Normal Tokemon
type(sandshrew, ground). type(diglett, ground). type(geodude, ground).

% e. Type Electric
%    jika melawan Tokemon type :
%        1. water    : damage lebih besar 50% dari biasanya.
%        2. flying   : damage lebih besar 50% dari biasanya.
%        3. ground   : damage lebih kecil 50% dari biasanya.
%
% - Normal Tokemon
type(pikachu, electric). type(electrode, electric). type(magneton, electric).

% f. Type Flying
%     jika melawan Tokemon type :
%	 1. leaves	: damage lebih besar 50% dari biasanya.
%	 2. electric	: damage lebih kecil 50% dari biasanya.
%
% - Normal Tokemon
type(pidgey, flying). type(spearow, flying). type(zubat, flying).

% -------------------------------------
% VARIASI ATTACK
% a. Normal Attack
% Normal Pokemon
attack(bulbasaur, 200). attack(oddish, 80). attack(gloom, 140).
attack(charmander, 200). attack(flareon, 140). attack(magmar, 80).
attack(squirtle, 200). attack(magikarp, 120). attack(horsea, 120).
attack(sandshrew, 200). attack(diglett, 140). attack(geodude, 80).
attack(pikachu, 200). attack(electrode, 120). attack(magneton, 120).
attack(pidgey, 200). attack(spearow, 80). attack(zubat, 140).
% Legendary Pokemon
attack(zapdos, 400). attack(moltres, 400). attack(articuno, 400).

% b. Special Attack
specialattack(bulbasaur, 300, leaf_blade). specialattack(oddish, 180, chlorophyll). specialattack(gloom, 240, stench).
specialattack(charmander, 300, fire_bomb). specialattack(flareon, 240, flash_fire). specialattack(magmar, 180, flame_body).
specialattack(squirtle, 300, water_canon). specialattack(magikarp, 220, swift_swim). specialattack(horsea, 220, dance_water).
specialattack(sandshrew, 300, slush_rush). specialattack(diglett, 240, magic_ground). specialattack(geodude, 180, earthquake).
specialattack(pikachu, 300, lightning_rod). specialattack(electrode, 220, soundproof). specialattack(magneton, 220, magnet_pull).
specialattack(pidgey, 300, tangled_feet). specialattack(spearow, 180, sniper). specialattack(zubat, 240, infiltrator).
% Legendary Pokemon
specialattack(zapdos, 600, legendary_blade). specialattack(moltres, 600, legendary_bomb). specialattack(articuno, 600, legendary_magic).

% ----------------------------------
% VARIASI MAX HEALTH
maxhealth(articuno,1000).
maxhealth(moltres,1500).
maxhealth(zapdos,2000).
maxhealth(pikachu,500).
maxhealth(squirtle,400).
maxhealth(sandshrew,550).
maxhealth(charmander,700).
maxhealth(pidgey,450).
maxhealth(flareon,600).
maxhealth(magikarp,400).
maxhealth(diglett,500).
maxhealth(electrode,450).
maxhealth(spearow,550).
maxhealth(gloom,400).
maxhealth(magmar,650).
maxhealth(horsea,500).
maxhealth(geodude,650).
maxhealth(magneton,750).
maxhealth(zubat,450).
maxhealth(bulbasaur,600).
maxhealth(oddish,500).

% ----------------------------------
%set play to false
play(false).

start :- play(true), write('Anda sudah berada di dalam permainan.'), !.
start :-
    play(false),

	retract(play(false)),
	asserta(play(true)),

	setFalseDone,

	setInvLgd, makeMap, setMusuhBiasa, setMusuhLegend,
	printheader, printhelp, printlegend.

help :- printhelp.

printheader :-

    write('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'), nl,
    write('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'), nl,
    write('XX                                                                     XX'), nl,
    write('XX                                                                     XX'), nl,
    write('XX                                                                     XX'), nl,
    write('XX   8888888  88888  888  88  888888  888       88  88888  888    88   XX'), nl,
    write('XX   8888888  888 8  888 88   888     8888     888  888 8  8888   88   XX'), nl,
    write('XX     888    888 8  88888    888     88888   8888  888 8  88888  88   XX'), nl,
    write('XX     888    888 8  88888    88888   888 88 88 88  888 8  888 88 88   XX'), nl,
    write('XX     888    888 8  888 88   888     888  888  88  888 8  888  8888   XX'), nl,
    write('XX     888    88888  888  88  888888  888   8   88  88888  888   888   XX'), nl,
    write('XX                                                                     XX'), nl,
    write('XX        88888    88888    88888   888     88888   8888888            XX'), nl,
    write('XX        888 88   888 88   888 8   888     888 8   888  88            XX'), nl,
    write('XX        888 88   888 88   888 8   888     888 8   888                XX'), nl,
    write('XX        88888    88888    888 8   888     888 8   888 888            XX'), nl,
    write('XX        888      88 88    888 8   888     888 8   888  88            XX'), nl,
    write('XX        888      88  88   88888   88888   88888   8888888            XX'), nl,
    write('XX                                                                     XX'), nl,
    write('XX                                                                     XX'), nl,
    write('XX                                                                     XX'), nl,
    write('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'), nl,
    write('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'), nl,
    nl,
    write('Gotta catch em all!                                                  '), nl,
    write('Hello there! Welcome to the world of Tokemon! My name is Aril!       '), nl,
    write('People call me the Tokemon Professor! This world is inhabited by     '), nl,
    write('creatures called Tokemon! There are hundreds of Tokemon loose in     '), nl,
    write('Labtek 5! You can catch them all to get stronger, but what I am      '), nl,
    write('really interested in are the 3 legendary Tokemons, Zapdos, Moltres,  '), nl,
    write('and Articuno. If you can defeat or capture all those Tokemons I      '), nl,
    write('will not kill you.'), nl.

printhelp :-
    write('Available commands:'),nl,
    write('    start.          -- Start the Game!'),nl,
    write('    help.           -- Show Available Command'),nl,
    write('    quit.           -- Quit the Game'),nl,
    write('    n. s. e. w.     -- Move'),nl,
    write('    map.            -- Look at the Map'),nl,
    write('    heal.           -- Cure Tokemon in Inventory if in Gym Center'),nl,
    write('    status.         -- Show Your Status'),nl,
    write('    save(Filename). -- Save Your Game'),nl,
    write('    load(Filename). -- Load Previously Saved Game'),nl,
    nl.

printlegend :-
    write('Legends:'),nl,
    write('   - X = Pagar  '),nl,
    write('   - P = Player '),nl,
    write('   - G = Gym    '),nl,
    nl.

menang :-
	play(true),
	write('Congratulation!!! You have helped me in defeating or capturing the
3 Legendary Tokemons. As promised, I wont kill you and youre free!'), nl, nl,
	write('&&    && &&&&&&    &&    &&    && '),nl,
	write(' &&  &&  &&      &&  &&   &&  &&  '),nl,
	write('   &&    &&&&&& &&&&&&&&    &&    '),nl,
	write('   &&    &&     &&    &&    &&    '),nl,
	write('   &&    &&&&&& &&    &&    &&    '),nl,
	nl,keluar,
	!.

kalah :-
	play(true),
	write('Ho ho ho. You have failed to complete the missions. As for now,
meet your fate and disappear from this world!'),nl,nl,
	write('&&       &&     &&&&& &&&&&& &&&&&  '),nl,
	write('&&     &&  &&  &&     &&     &&  && '),nl,
	write('&&    &&    &&  &&&&  &&&&&& &&&&   '),nl,
	write('&&     &&  &&      && &&     && &&  '),nl,
	write('&&&&&    &&    &&&&&  &&&&&& &&  && '),nl,
	nl, keluar,
	!.

keluar :-

	retractall(jumInv(_)),
	retractall(inventory(_)),
	retractall(healthP(_,_)),

	retractall(jumMusuh(_)),
	retractall(jumLegend(_)),
	retractall(legend(_)),
	retractall(healthM(_,_)),

	retractall(player(_)),
	retractall(musuh(_,_)),
	retractall(panjangPeta(_)),
	retractall(lebarPeta(_)),
	retractall(gym(_)),
	retractall(battle(_)),

	retractall(isHeal(_)),

	retractall(acakrun(_)),

	nl, !.



quit :-
	play(false),
	write('Game aja belum mulai, udah mau keluar aja'),
	nl,!.

quit :-
	keluar,
	write('Kamu keluar dari pemainan ini.'),
	retract(play(true)),
	asserta(play(false)), !.

/*
save(_) :-
	play(false),
	write('Apa yang mau di save? game nya aja belum mulai'),nl,!.
save(Filename) :-
	tell(Filename),
		player([A,B]),
		write(player([A,B])),write('.'),nl,
		lebarpeta(Lebar),
		write(lebarpeta(Lebar)),write('.'),nl,
		panjangpeta(Panjang),
		write(panjangpeta(Panjang)),write('.'),nl,
		gym([X,Y]),
		write(gym([X,Y])),write('.'),nl,
		forall(
		    inventory(Obj),
		    (
			write(inventory(Obj)),write('.'),nl
		    )
		),
		forall(
		    legend(L),
		    (
			write(legend(L)),write('.'),nl
		    )
		),
        fold,!.
loads(_) :-
	play(true),
	write('Kamu tidak bisa memulai game lainnya ketika ada game yang sudah dimulai.'), nl, !.
loads(Filename):-
	\+file_exists(Filename),
	write('File tersebut tidak ada.'), nl, !.
loads(FileName):-
	open(FileName, read, Str),
	read_file_lines(Str,Lines),
	close(Str),
	assertaList(Lines), !.
*/













