declare name 		"Cloche 128 Songes";
declare version 	"1.0";

//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
// 			Cloche 128 Songes				    
//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------

import("stdfaust.lib");

OnOf    = checkbox("On/Of") : si.smoo;
gain 	= hslider("gain [unit:dB]", -6, -96, 0, 0.1) : ba.db2linear : si.smoo ;
freq 	= hslider("freq1 [unit:Hz]", 300, 0, 5000, 0.1);
duree 	= hslider("duree [unit:Sec]", 1, 0, 20, 0.01);
gate    = button("play");


//-----------------------------------------------
// 			Amplitude Index
//-----------------------------------------------
A_index1 = 200 / 975; A_index2 = 200 / 975; A_index3 = 200 / 975; A_index4 = 200 / 975;
A_index5 = 200 / 975; A_index6 = 200 / 975; A_index7 = 200 / 975; A_index8 = 200 / 975; A_index9 = 200 / 975;
//-----------------------------------------------

//-----------------------------------------------
// 			Frequence Index
//-----------------------------------------------
F_index1 =  349 / 675;  F_index2 =  349 / 124;  F_index3 =  349 / 346;  F_index4 =  349 / 1108;
F_index5 =  349 / 1634; F_index6 =  349 / 2249; F_index7 =  349 / 2941; F_index8 =  349 / 3700; F_index9 =  349 / 4504;
//-----------------------------------------------

//-----------------------------------------------
// 			Duree Index
//-----------------------------------------------
D_index1 =  24 / 24;  D_index2 =  16 / 24;  D_index3 =  22 / 24;  D_index4 =  17 / 24;
D_index5 =  6 / 24; D_index6 =  3 / 24; D_index7 =  2 / 24; D_index8 =  1.5 / 24; D_index9 =  0.8 / 24;
//-----------------------------------------------


OS1 = os.osc(freq*F_index1) * en.ar(0.0015, duree*D_index1,gate)*(gain*A_index1);
OS2 = os.osc(freq*F_index2) * en.ar(0.0015, duree*D_index2,gate)*(gain*A_index2);
OS3 = os.osc(freq*F_index3) * en.ar(0.0015, duree*D_index3,gate)*(gain*A_index3);
OS4 = os.osc(freq*F_index4) * en.ar(0.0015, duree*D_index4,gate)*(gain*A_index4);
OS5 = os.osc(freq*F_index5) * en.ar(0.0015, duree*D_index5,gate)*(gain*A_index5);
OS6 = os.osc(freq*F_index6) * en.ar(0.0015, duree*D_index6,gate)*(gain*A_index6);
OS7 = os.osc(freq*F_index7) * en.ar(0.0015, duree*D_index7,gate)*(gain*A_index7);
OS8 = os.osc(freq*F_index8) * en.ar(0.0015, duree*D_index8,gate)*(gain*A_index8);
OS9 = os.osc(freq*F_index9) * en.ar(0.0015, duree*D_index9,gate)*(gain*A_index9);


//Aout = OS1 + OS2 + OS3 + OS4 + OS5 + OS6 + OS7 + OS8 + OS9; 

gainEnvelope = en.ar(0.015, duree, gate)*gain;

Aout = (OS1 + OS2 + OS3 + OS4 + OS5 + OS6 + OS7 + OS8 + OS9)*gainEnvelope : fi.lowpass(3,gainEnvelope*5000+50);
process = Aout*OnOf, Aout*OnOf;
