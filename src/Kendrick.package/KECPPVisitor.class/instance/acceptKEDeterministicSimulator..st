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
	aStream nextPutAll: 'state_type x (nbOfCompartment);';cr.
	aStream nextPutAll: 'for( size_t i = 0; i < nbOfCompartment; ++i )';cr.
	aStream nextPutAll: 'x[i] = initialValue[i];';cr.
	aStream nextPutAll: 'for( size_t i = tMin ; i < tMax ; ++i,t+=dt )';cr.
	aStream nextPutAll: '{';cr.
	aStream nextPutAll: 'rk4.do_step( modelEquations , x , t , dt );';cr.
	aStream nextPutAll: 'std::cout<<t<<":: "<< x[0]<<" "<<x[1]<< x[2] <<  "\n";';cr.
	aStream nextPutAll: '}';cr.
	aStream nextPutAll: '}';cr.
	^ aStream contents.