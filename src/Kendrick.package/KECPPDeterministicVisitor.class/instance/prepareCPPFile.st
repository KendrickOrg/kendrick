as yet unclassified
prepareCPPFile
	stream nextPutAll: '//deterministic model';cr.
	stream nextPutAll: '#include <boost/array.hpp>';cr.
	stream nextPutAll: '#include <boost/numeric/odeint.hpp>';cr.
	stream nextPutAll: '#include <string>';cr.	
	stream nextPutAll: '#include <stdio.h>';cr.
	stream nextPutAll: '#include <stdlib.h>';cr.
	stream nextPutAll: '#include <iostream>';cr.
	stream nextPutAll: '#include <math.h>';cr.	
	stream nextPutAll: '#include <fstream>';cr;cr.

	stream nextPutAll: '#define USE_CV_PLOT 1';cr.
	stream nextPutAll: '#define USE_GNU_PLOT 1';cr.
	stream nextPutAll: '#define USE_R_PLOT 1';cr;cr.

	stream nextPutAll: '#if USE_CV_PLOT';cr.
	stream nextPutAll: String tab,'#include "libplot.h"';cr.
	stream nextPutAll: '#endif';cr;cr.

	stream nextPutAll: '#if USE_GNU_PLOT ';cr.
	stream nextPutAll: String tab,'#define OUTFILE	  "out.dat" // output file';cr.
	stream nextPutAll: String tab,'#define PLTFILE   "out.plt"  // gnuplot script file ';cr.
	stream nextPutAll: String tab,'#define PNGFILE   "out.png"// png file';cr.
	stream nextPutAll: '#endif';cr;cr.
	
	stream nextPutAll: 'using namespace std;';cr.
	stream nextPutAll: 'using namespace boost::numeric::odeint;';cr;cr.
	
	stream nextPutAll: 'typedef boost::numeric::ublas::matrix<double> state_type;';cr.
	stream nextPutAll: 'runge_kutta4<state_type> rk4;';cr;cr.
	
	
	


