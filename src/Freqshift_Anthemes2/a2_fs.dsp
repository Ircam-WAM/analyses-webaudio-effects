import("stdfaust.lib"); 

//Faust code for Anthemes 2 frequency-shifter (one output freqshift)
//positive frequencies give transpositions to the treble
//negative frequencies give transpositions to the bass

f0 = hslider("f0", 0, -10000, 10000, 0.01);
//--------------------------------------------------------------------------------------//
tablesize = 1 << 16;
sinustable = os.sinwaveform(tablesize);

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
// DEFINITION OF A HILBERT FILTER
//--------------------------------------------------------------------------------------//
bq1 = fi.tf21(0.94657, -1.94632, 1., -1.94632, 0.94657);
bq2 = fi.tf21(0.06338, -0.83774, 1., -0.83774, 0.06338);
bq3 = fi.tf21(-0.260502, 0.02569, 1., 0.02569, -0.260502);
bq4 = fi.tf21(0.870686, -1.8685, 1., -1.8685, 0.870686);
hilbertFilter = _ <: (bq1, bq3) : (bq2, bq4);


//--------------------------------------------------------------------------------------//
// DEFINITION OF A COMPLEX PRODUCT
//--------------------------------------------------------------------------------------//
complexmod(f) = doubleMod
with {
	p1(a, b, c, d) = (a, c, b, d);
	//computes -sin() and cos()
	doubleCycle = pdPhasor(f) <: (sinusEnvelop, *(-1)) : (*(-1), +(0.25)) : (_, sinusEnvelop);
	doubleMod = (_, _, doubleCycle) : p1 : (*, *) : +;
};

//--------------------------------------------------------------------------------------//
// FINAL BIQUAD TO FILTER DC
//--------------------------------------------------------------------------------------//
finalbq = fi.tf21(1., -1., 0., -0.9997, 0.);


freqShift(f) = hilbertFilter : complexmod(f) : finalbq;


process = freqShift(f0);