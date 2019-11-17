setInvLgd:-

	asserta(isHeal(false)),

	asserta(menang(false)),
	asserta(kalah(false)),

	asserta(jumInv(3)),
	random(1,18,NA),
	random(1,18,NB),
	random(1,18,NC),
	nomor(A,NA),
	nomor(B,NB),
	nomor(C,NC),
	asserta(inventory(A)),
	maxhealth(A,HA),
	asserta(healthP(A,HA)),
	asserta(inventory(B)),
	maxhealth(B,HB),
	asserta(healthP(B,HB)),
	asserta(inventory(C)),
	maxhealth(C,HC),
	asserta(healthP(C,HC)),

	asserta(jumLegend(3)),
	asserta(legend(zapdos)),
	maxhealth(zapdos,X),
	asserta(healthM(zapdos,X)),
	asserta(legend(moltres)),
	maxhealth(moltres,Y),
	asserta(healthM(moltres,Y)),
	asserta(legend(articuno)),
	maxhealth(articuno,Z),
	asserta(healthM(articuno,Z)),


	!.
