as yet unclassified
prepareCPPFile
	stream nextPutAll: '#include <iostream>';cr.
	stream nextPutAll: '#include <boost/array.hpp>';cr.
	stream nextPutAll: '#include <boost/numeric/odeint.hpp>';cr.
	
	stream nextPutAll: '#include "libplot.h"';cr.
	stream nextPutAll: '#include <string>';cr.
	
	stream nextPutAll: 'using namespace std;';cr.
	stream nextPutAll: 'using namespace boost::numeric::odeint;';cr.
	stream nextPutAll: 'typedef std::vector< double > state_type;';cr.
	stream nextPutAll: 'runge_kutta4< state_type > rk4;';cr.
	
	
	


