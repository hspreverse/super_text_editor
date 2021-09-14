#include "hgimg.as"
	screen 0,100,100,0,0,560
	cls 1
	hgini
	setuv 0,0,30,100
	addspr pchr
	texload "hari1.jpg"
	regobj mychr,pchr,OBJ_2D
	selpos mychr
	objsetf3 0.0f, 0.0f, 0.0f
	selang mychr
	objsetf3 0.0f, 0.0f, 0.0f
	selscale mychr
	objsetf3 1.0f, 1.0f, 1.0f

	setuv 0,0,100,100
	addspr pchr2
	texload "back.jpg"
	regobj mychr2,pchr2,OBJ_2D
	gsel 0
	palcopy 3
	test1=0
	time1=0
	objsetf3 0.1f, 0.1f, 0.0f
*main
	hgdraw
	hgsync 10
	time1+
	pos 0,0
	color 0,0,0
	mes time1
	selang mychr
	objaddf1 2,0.0014f
	selscale mychr
	if(test1<60){
	objaddf3 0.01f, 0.01f, 0.0f
	test1+=1
	}
	
	goto *main
