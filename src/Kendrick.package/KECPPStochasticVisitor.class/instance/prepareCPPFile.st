as yet unclassified
prepareCPPFile
	| tmp2 tmp4 tmp6 tmp8 tmp10 tmp12 tmp14 tmp16 tmp18 tmp20 |
	tmp2 := stream.
	tmp2
		nextPutAll: '//stochastic model';
		cr.
	tmp4 := stream.
	tmp4
		nextPutAll: '#include <iostream>';
		cr.
	tmp6 := stream.
	tmp6
		nextPutAll: '#include <string>';
		cr.
	tmp8 := stream.
	tmp8
		nextPutAll: '#include <stdio.h>';
		cr.
	tmp10 := stream.
	tmp10
		nextPutAll: '#include <stdlib.h>';
		cr.
	tmp12 := stream.
	tmp12
		nextPutAll: '#include <math.h>';
		cr.
	tmp14 := stream.
	tmp14
		nextPutAll: '#include <time.h>';
		cr.
	tmp16 := stream.
	tmp16
		nextPutAll: '#include <fstream>';
		cr.
	tmp18 := stream.
	tmp18
		nextPutAll: '#include <sstream>';
		cr;
		cr.
	tmp20 := stream.
	tmp20
		nextPutAll: 'using namespace std;';
		cr;
		cr