declare name 		"Phasing";
declare version 	"1.0";
declare author 		"Joao Svidzinski d'après Denis Lorrain";


//-----------------------------------------------
// 			Phasing Songes
//-----------------------------------------------

import("stdfaust.lib");

OnOf    = checkbox("On/Of") : si.smoo;
gain 	= hslider("gain [unit:dB]", -10, -96, 0, 0.1) : ba.db2linear : si.smoo;
freq 	= hslider("freq [unit:Hz]", 58, 50, 1000, 1);
inter   = hslider("Interval", 0.01, 0.01, 0.04, 0.001);

freq2 = (((os.osc(freq) + os.osc(freq+inter*1) + os.osc(freq-inter*1) + os.osc(freq+inter*2)+ os.osc(freq-inter*2) + os.osc(freq+inter*3) + os.osc(freq-inter*3) + os.osc(freq+inter*4) + os.osc(freq-inter*4)) * 0.5) * gain);

process = freq2*OnOf, freq2*OnOf;
