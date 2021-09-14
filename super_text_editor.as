	exec "stop_watch.exe"
	cls 2
	title "Super Text Editor(ÅMÅEÉ÷ÅEÅL)"
	screen 0,640,600,1
	sdim buf,36000
	flg=1:flg2=0
	buf=""
	mesbox buf,640,440,flg+4
	objsize 60,24
	pos 430,448:button "Load",*load1
	pos 500,448:button "Save",*save1
	pos 570,448:button "END",*endbtn
	pos 430,468:button "Script",*scr
	pos 500,468:button "ScriptGo",*scrg
	pos 570,468:button "Stop",*stop1
	pos 570,488:button "UNDO",*undo1

	lb=0
	objsize 160,24
	list="äÁï∂éöÉäÉXÉg\n(ÅLÅEÉ÷ÅE`)\n(ÅOÉ÷ÅO)\n(ÅLÅGÉ÷ÅG`)\n(ÅLA`)"
	pos 0,460:combox lb,64,list
	objsize 220,24
	lb2=0
	list="\nÑ¨\nÑ≠\nÑØ\nÑÆ\nÑ´\nÑ™"
	pos 160,460:listbox lb2,64,list

*main2
	color 0,0,0
	randomize
	rnd a1,899
	a1+=100
	randomize
	rnd a2,499
	a2+=500
	pos 430,490:
	mes "î]ÉgÉå":mes ""+a1+"+"+a2
	input c1
	button "Answer",*kaitou
	goto *loop1

*stop1	
	a=0
	a2=-1
	if(flg2==0){
	objsend 0,$cf,-1,a,1	; èëÇ´çûÇ›ã÷é~ÉtÉâÉOÇÃê›íË
	objsend 1,$f4,$01,a2,1
	objsend 2,$f4,$02,a2,1
	objsend 3,$f4,$03,a2,1
	objsend 4,$f4,$04,a2,1
	objsend 5,$f4,$05,a2,1
	objsend 6,$f4,$01,a2,1
	flg2=1
	}else{
	objsend 0,$cf,o,a,1
	objsend 1,$f4,$00,a2,1
	objsend 2,$f4,$00,a2,1
	objsend 3,$f4,$00,a2,1
	objsend 4,$f4,$00,a2,1
	objsend 5,$f4,$00,a2,1
	objsend 6,$f4,$00,a2,1
	flg2=0
	}
	goto *loop1

*undo1
	s3=0
	objsend 0,$c7,0,a3,1
	goto *loop1

*kaitou
	if(c1==(a1+a2)){
	color 255,255,255
	boxf 430,490,600,600
	color 0,0,0
	pos 430,580
	mes "Good"
	}else{
	color 255,255,255
	boxf 430,490,600,600
	color 0,0,0
	pos 430,580
	mes "Bad"
	}
	goto *main2

*loop1
	if(lb==1){
	buf+="(ÅLÅEÉ÷ÅE`)"
	objprm 0,buf
	lb=0
	}if(lb==2){
	buf+="(ÅOÉ÷ÅO)"
	objprm 0,buf
	lb=0
	}if(lb==3){
	buf+="(ÅLÅGÉ÷ÅG`)"
	objprm 0,buf
	lb=0
	}if(lb==4){
	buf+="(ÅLA`)"
	objprm 0,buf
	lb=0
	}
	if(lb2==1){
	buf+="Ñ¨"
	objprm 0,buf
	lb2=0
	}
	if(lb2==2){
	buf+="Ñ≠"
	objprm 0,buf
	lb2=0
	}
	if(lb2==3){
	buf+="ÑØ"
	objprm 0,buf
	lb2=0
	}
	if(lb2==4){
	buf+="ÑÆ"
	objprm 0,buf
	lb2=0
	}
	if(lb2==5){
	buf+="Ñ´"
	objprm 0,buf
	lb2=0
	}
	if(lb2==6){
	buf+="Ñ™"
	objprm 0,buf
	lb2=0
	}
	wait 10
	goto *loop1

*scr
	buf+="GRP s.jpg\nMSG Hello Jap\nMSG Do you like susi\nPSE\nGRP s2.jpg\nBGM tes1.wav\nPSE\nGRP s2.jpg\nMSG I like Hamburger\nMSG Oh good\nPSE\nEND"
	objprm 0,buf
	lb=0
	wait 10
	goto *loop1

*scrg
	sdim w,256
	sdim prm,256
	notesel buf
	lin=0
	screen 0,480,400 :cls 4
	x=8: y=272
	
*main
	noteget w,lin
	getstr cmd,w,0,' '
	if cmd="END":end
	if cmd="PSE":pos 208,368 :button "NEXT",*next :stop
	getstr prm,w,4
	if cmd="GRP":cls 4 :picload prm,1,40,8 :x=8 :y=272
	if cmd="BGM":sndload prm:snd
	if cmd="MSG"{color 120,120,120 :pos x+1,y+1 :mes prm
		color 255,255,255 :pos x,y :mes prm
		y+=24
	}

*next
	lin+
	goto *main

*save1
	dialog "txt",17,"ÉeÉLÉXÉgÉtÉ@ÉCÉã"
	if stat=0:goto *dlcan
	strlen a,buf
	bsave refstr,buf,a
	goto *loop1

*dlcan
	goto *loop1
	stop
*load1
	dialog "txt",16,"ÉeÉLÉXÉgÉtÉ@ÉCÉã"
	if stat=0:goto *dlcan2
	bload refstr,buf
	objprm 0,buf
	goto *loop1

*dlcan2
	goto *loop1
	stop

*endbtn
	stop