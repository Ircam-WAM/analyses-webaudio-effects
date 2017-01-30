//--------------------------------------------------------------------------------------//
// HARMONIZER FAUST CODE
// Translated from the Max harmonizers used in En Echo by Philippe Manoury
// Author : Alain Bonardi
// January 2017
//--------------------------------------------------------------------------------------//
import("stdfaust.lib"); 

//--------------------------------------------------------------------------------------//
// DEFINITION OF CONTROLS
//--------------------------------------------------------------------------------------//
//transpositions in midicents between -2400 and 2400//
//initialized with Manoury's values in En Echo in the 4th piece Mea Lux at events 19 and 20
//the ambitus is -100 to 100 (one half-tone under, one half-tone above)
transposition1 = hslider("transposition1", 30, -100, 100, 1); 
transposition2 = hslider("transposition2", 15, -100, 100, 1); 
transposition3 = hslider("transposition3", -15, -100, 100, 1); 
transposition4 = hslider("transposition4", -30, -100, 100, 1); 

//harmonizer window between 0 and 127//
//initialized with Manoury's value of 50 in En Echo in the 4th piece Mea Lux at events 19 and 20//
//with the lineDrive the actual value is 19.7032

//possible extra delay in milliseconds//
//no delay implemented here
//del = hslider("del", 0, 0, 1000, 1);

//drywet between harmonized sound (wet, 1) and direct sound (dry, 0)//
drywet = hslider("drywet", 1, 0, 1, 0.01) : smoothLine; 

//general gainlitude between 0 and 1
gain = hslider("gain", 1, 0, 1, 0.01) : smoothLine;

//--------------------------------------------------------------------------------------//
tablesize = 1 << 16;
sinustable = os.sinwaveform(tablesize);
millisec = ma.SR / 1000.0;
gainh = 0.218265; //harmonizer gain
gaind = 0.217966; //direct sound gain
smoothLine = si.smooth(ba.tau2pole(0.050));
//--------------------------------------------------------------------------------------//

//--------------------------------------------------------------------------------------//
// GENERATORS
//--------------------------------------------------------------------------------------//
//--------------------------------------------------------------------------------------//
// PHASOR THAT ACCEPTS BOTH NEGATIVE AND POSITIVE FREQUENCES
//--------------------------------------------------------------------------------------//
pdPhasor(f) = os.phasor(1, f);

//--------------------------------------------------------------------------------------//
// SINUS ENVELOPE
//--------------------------------------------------------------------------------------//
sinusEnvelop(phase) = s1 + d * (s2 - s1)
	with {
			zeroToOnePhase = phase : ma.decimal;
			myIndex = zeroToOnePhase * float(tablesize);
			i1 = int(myIndex);
			d = ma.decimal(myIndex);
			i2 = (i1+1) % int(tablesize);
			s1 = rdtable(tablesize, sinustable, i1);
			s2 = rdtable(tablesize, sinustable, i2);

};

//--------------------------------------------------------------------------------------//
//DEFINITION OF AN ELEMENTARY TRANSPOSITION BLOCK
//--------------------------------------------------------------------------------------//
transpoBlock(moduleOffset, midicents, win, extradel, gainlitude) = dopplerDelay
			with {
					freq = midicents : +(6000) : *(0.01) : ba.midikey2hz : -(261.625977) : *(-3.8224) /(float(win));
					//shifted phasor//
					adjustedPhasor = freq : pdPhasor : +(moduleOffset) : ma.decimal;
					//threshold to input new control values//
					th_trigger = (adjustedPhasor > 0.001) * (adjustedPhasor@1 <= 0.001);
					trig_win = win : ba.sAndH(th_trigger);
					trig_del = extradel : ba.sAndH(th_trigger);
					delayInSgainles = adjustedPhasor : *(trig_win) : +(trig_del) : *(millisec);
					variableDelay = de.fdelay(262144, delayInSgainles);
					cosinusEnvelop = adjustedPhasor : *(0.5) : sinusEnvelop;
					dopplerDelay = (variableDelay, cosinusEnvelop) : * : *(gainlitude);
				};

//--------------------------------------------------------------------------------------//
//DEFINITION OF AN ELEMENTARY HARMONIZER AS TWO TRANSPOSITION BLOCKS OVERLAPPED
//--------------------------------------------------------------------------------------//
harmonizer(midicents, win, extradel, gainlitude) = _ <: (transpoBlock(0, midicents, win, extradel, gainlitude), transpoBlock(0.5, midicents, win, extradel, gainlitude)) : +;

//--------------------------------------------------------------------------------------//
//DEFINITION OF 4 HARMONIZERS AS IN EN ECHO
//--------------------------------------------------------------------------------------//
blockOf4Harmonizer = _ <: (harmonizer(transposition1, 19.7032, 0, gainh), harmonizer(transposition2, 19.7032, 0, gainh), harmonizer(transposition3, 19.7032, 0, gainh), harmonizer(transposition4, 19.7032, 0, gainh));
process = _ <: (_, blockOf4Harmonizer) : (*(gaind), +, +) : (_, +) : (*(1 - drywet), *(drywet)) : + : *(gain);