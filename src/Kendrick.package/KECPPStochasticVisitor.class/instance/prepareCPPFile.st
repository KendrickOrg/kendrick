as yet unclassified
prepareCPPFile
	stream nextPutAll: '//stochastic model';cr.
	stream nextPutAll: '#include <iostream>';cr.
	stream nextPutAll: '#include <string>';cr.
	stream nextPutAll: '#include <stdio.h>';cr.
	stream nextPutAll: '#include <stdlib.h>';cr.
	stream nextPutAll: '#include <math.h>';cr.
	stream nextPutAll: '#include <limits.h>';cr;cr.
	
	stream nextPutAll: '#define USE_CV_PLOT 1';cr.
	stream nextPutAll: '#define USE_GNU_PLOT 1';cr.
	stream nextPutAll: '#define USE_R_PLOT 1';cr.

	stream nextPutAll: '#if USE_CV_PLOT';cr.
	stream nextPutAll: '#include "libplot.h"';cr.
	stream nextPutAll: '#endif';cr.

	stream nextPutAll: '#if USE_GNU_PLOT ';cr.
	stream nextPutAll: '#define OUTFILE	  "out.dat"	// output file';cr.
	stream nextPutAll: '	#define PLTFILE   "out.plt"	// gnuplot script file ';cr.
	stream nextPutAll: '	#define PNGFILE   "out.png"	// png file';cr.
	stream nextPutAll: '#endif';cr.
	
	stream nextPutAll: 'using namespace std;';cr;cr.

	
	
	


