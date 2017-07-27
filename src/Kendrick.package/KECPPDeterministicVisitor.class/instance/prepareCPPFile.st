as yet unclassified
prepareCPPFile
	| tmp2 tmp4 tmp6 tmp8 tmp10 tmp12 tmp14 tmp16 tmp18 tmp20 tmp22 tmp24 tmp26 tmp28 |
	tmp2 := stream.
	tmp2
		nextPutAll: '//deterministic model';
		cr.
	tmp4 := stream.
	tmp4
		nextPutAll: '#include <boost/array.hpp>';
		cr.
	tmp6 := stream.
	tmp6
		nextPutAll: '#include <boost/numeric/odeint.hpp>';
		cr.
	tmp8 := stream.
	tmp8
		nextPutAll: '#include <string>';
		cr.
	tmp10 := stream.
	tmp10
		nextPutAll: '#include <stdio.h>';
		cr.
	tmp12 := stream.
	tmp12
		nextPutAll: '#include <stdlib.h>';
		cr.
	tmp14 := stream.
	tmp14
		nextPutAll: '#include <iostream>';
		cr.
	tmp16 := stream.
	tmp16
		nextPutAll: '#include <math.h>';
		cr.
	tmp18 := stream.
	tmp18
		nextPutAll: '#include <fstream>';
		cr.
	tmp20 := stream.
	tmp20
		nextPutAll: '#include <sstream>';
		cr.
	tmp22 := stream.
	tmp22
		nextPutAll: 'using namespace std;';
		cr.
	tmp24 := stream.
	tmp24
		nextPutAll: 'using namespace boost::numeric::odeint;';
		cr;
		cr.
	tmp26 := stream.
	tmp26
		nextPutAll: 'typedef boost::numeric::ublas::matrix<double> state_type;';
		cr.
	tmp28 := stream.
	tmp28
		nextPutAll: 'runge_kutta4<state_type> rk4;';
		cr;
		cr