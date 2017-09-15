declare name 		"Cloche 128 Songes";
declare version 	"1.0";

//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------
// 			Cloche Mirages	    
//-----------------------------------------------
//-----------------------------------------------
//-----------------------------------------------

import("stdfaust.lib");

OnOf    = checkbox("v:Paramètres Globaux/OnOf [1]") : si.smoo;
freq 	= hslider("v:Paramètres Globaux/freq1 [unit:Hz][1]", 300, 0, 5000, 0.1);
duree 	= hslider("v:Paramètres Globaux/duree [unit:Sec][1]", 1, 0, 20, 0.01);
gain 	= hslider("v:Jouer/gain [unit:dB][2]", -6, -96, 0, 0.1) : ba.db2linear : si.smoo ;
gate    = button("v:Jouer/play [2]");

//-----------------------------------------------
// 			Paramètres Relatifs
//-----------------------------------------------

/*
Rfreq = nentry("v:Paramètres Relatifs/Frequence relative [2]", 293, 50, 5000, 0.1);
Rgain = nentry("v:Paramètres Relatifs/Amplitude relative [2]", 1200, 0, 1500, 1);
Rduree = nentry("v:Paramètres Relatifs/Duree relative [2]", 15, 0, 30, 1);
*/

Rfreq = 293;
Rgain = 1200;
Rduree = 15;

//-----------------------------------------------
// 			Paramètres des partiels 
//-----------------------------------------------

freq1  = nentry("h:Partiel 1/Frequence [3]", 293, 50, 5000, 0.1);
gain1  = nentry("h:Partiel 1/Amplitude [3]", 300, 50, 5000, 0.1);
duree1 = nentry("h:Partiel 1/Duree [3]", 15, 0, 30, 1);

freq2  = nentry("h:Partiel 2/Frequence [4]", 415, 50, 5000, 0.1);
gain2  = nentry("h:Partiel 2/Amplitude [4]", 200, 50, 5000, 0.1);
duree2 = nentry("h:Partiel 2/Duree [4]", 10, 0, 30, 1);

freq3  = nentry("h:Partiel 3/Frequence [5]", 554, 50, 5000, 0.1);
gain3  = nentry("h:Partiel 3/Amplitude [5]", 200, 50, 5000, 0.1);
duree3 = nentry("h:Partiel 3/Duree [5]", 8, 0, 30, 1);

freq4  = nentry("h:Partiel 4/Frequence [6]", 698, 50, 5000, 0.1);
gain4  = nentry("h:Partiel 4/Amplitude [6]", 200, 50, 5000, 0.1);
duree4 = nentry("h:Partiel 4/Duree [6]", 6, 0, 30, 1);

freq5  = nentry("h:Partiel 5/Frequence [7]", 659, 50, 5000, 0.1);
gain5  = nentry("h:Partiel 5/Amplitude [7]", 200, 50, 5000, 0.1);
duree5 = nentry("h:Partiel 5/Duree [7]", 4, 0, 30, 1);

freq6  = nentry("h:Partiel 6/Frequence [8]", 830, 50, 5000, 0.1);
gain6  = nentry("h:Partiel 6/Amplitude [8]", 200, 50, 5000, 0.1);
duree6 = nentry("h:Partiel 6/Duree [8]", 2, 0, 30, 1);

freq7  = nentry("h:Partiel 7/Frequence [9]", 935, 50, 5000, 0.1);
gain7  = nentry("h:Partiel 7/Amplitude [9]", 200, 50, 5000, 0.1);
duree7 = nentry("h:Partiel 7/Duree [9]", 1.5, 0, 30, 1);

freq8  = nentry("h:Partiel 8/Frequence [10]", 987, 50, 5000, 0.1);
gain8  = nentry("h:Partiel 8/Amplitude [10]", 200, 50, 5000, 0.1);
duree8 = nentry("h:Partiel 8/Duree [10]", 1, 0, 30, 1);

//-----------------------------------------------
// 			Amplitude Index
//-----------------------------------------------
A_index = gain / Rgain; 
//-----------------------------------------------

//-----------------------------------------------
// 			Frequence Index
//-----------------------------------------------
F_index =  freq / Rfreq;  
//-----------------------------------------------

//-----------------------------------------------
// 			Duree Index
//-----------------------------------------------
D_index =  duree / Rduree;
//-----------------------------------------------


OS1 = os.osc(freq1*F_index) * en.ar(0.0015, duree1*D_index,gate)*(gain1*A_index);
OS2 = os.osc(freq2*F_index) * en.ar(0.0015, duree2*D_index,gate)*(gain2*A_index);
OS3 = os.osc(freq3*F_index) * en.ar(0.0015, duree3*D_index,gate)*(gain3*A_index);
OS4 = os.osc(freq4*F_index) * en.ar(0.0015, duree4*D_index,gate)*(gain4*A_index);
OS5 = os.osc(freq5*F_index) * en.ar(0.0015, duree5*D_index,gate)*(gain5*A_index);
OS6 = os.osc(freq6*F_index) * en.ar(0.0015, duree6*D_index,gate)*(gain6*A_index);
OS7 = os.osc(freq7*F_index) * en.ar(0.0015, duree7*D_index,gate)*(gain7*A_index);
OS8 = os.osc(freq8*F_index) * en.ar(0.0015, duree8*D_index,gate)*(gain8*A_index);

gainEnvelope = en.ar(0.015, duree, gate)*gain;

Aout = (OS1 + OS2 + OS3 + OS4 + OS5 + OS6 + OS7 + OS8)*gainEnvelope : fi.lowpass(3,gainEnvelope*5000+50);
process = Aout*OnOf, Aout*OnOf;
