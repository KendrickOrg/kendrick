as yet unclassified
acceptKEDeterministicSimulator: aNode
	|aStream|
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: '#define tMin ', (aNode tMin) asString ;cr.
	aStream nextPutAll: '#define tMax ', (aNode tMax) asString ;cr.
	aStream nextPutAll: 'const double dt = ', (aNode step) asString, ';';cr.
	aStream nextPutAll: 'double t = tMin;';cr.
	aStream nextPutAll: 'void solverDeteministe()';cr.
	aStream nextPutAll: '{';cr.
	aStream nextPutAll: 'state_type x (nbOfCompartment * nbOfSpecies);';cr.
	aStream nextPutAll: 'for( size_t i = 0; i < nbOfCompartment*nbOfSpecies; ++i )';cr.
	aStream nextPutAll: 'x[i] = initialValue[i];';cr.
	aStream nextPutAll: 'for( size_t i = tMin ; t < tMax ; ++i,t+=dt )';cr.
	aStream nextPutAll: '{';cr.
	aStream nextPutAll: 'rk4.do_step( modelEquations , x , t , dt );';cr.
	aStream nextPutAll: 'std::cout<<t<<":: "<< x[0]<<" "<<x[1]<< x[2] <<  "\n";';cr.
	
	aStream nextPutAll: 	'for(int j = 0; j < nbOfCompartment * nbOfSpecies; j++)' 	;cr.
	aStream nextPutAll: 	'chartManager[j].addPoint(x[j]);' ;cr.
		
	
	aStream nextPutAll: '}';cr.
	aStream nextPutAll: 	'for(int j = 0; j < nbOfCompartment * nbOfSpecies; j++)' 	;cr.
	aStream nextPutAll: 	'chartManager[j].drawChart(compartmentName[j],j+1,tMin,tMax,dt);' ;cr.
	aStream nextPutAll: '}';cr.
	^ aStream contents.