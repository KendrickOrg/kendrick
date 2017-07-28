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
	stream nextPutAll: '#include <fstream>';cr.
	stream nextPutAll: '#include <sstream>';cr.
	"stream nextPutAll: '#include ""libplot.h""';cr;cr."
	
	stream nextPutAll: 'using namespace std;';cr.
	stream nextPutAll: 'using namespace boost::numeric::odeint;';cr;cr.
	
	stream nextPutAll: 'typedef boost::numeric::ublas::matrix<double> state_type;';cr.
	stream nextPutAll: 'runge_kutta4<state_type> rk4;';cr;cr.
	
	
	


