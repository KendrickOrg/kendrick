as yet unclassified
acceptKEDeterministicSimulator: aNode
	|aStream|
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: 'void solverDeterministic()';cr.
	aStream nextPutAll: '{';cr.
	aStream nextPutAll: String tab,'state_type x(nbOfCompartments, nbOfSpecies, 0.0);';cr.
	aStream nextPutAll: String tab, 'double t = tMin;';cr.
	aStream nextPutAll: String tab,'for (int i = 0; i < nbOfCompartments; i++)';cr.
	aStream nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'x(i, j) = initialValue[i][j];';cr.
	aStream nextPutAll: String tab,'while (t <= tMax)';cr.
	aStream nextPutAll: String tab, '{';cr.
	aStream nextPutAll: String tab, String tab, 'cout << t << "  ";';cr.
	aStream nextPutAll: String tab, String tab,'rk4.do_step(initializeEquations, x, t, tStep);';cr.
	aStream nextPutAll: String tab, String tab,'for (int i = 0; i < nbOfCompartments; i++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, '{';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, 'cout <<', function asString, '(x(i, j)) << "  ";';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, 'chartManager[i][j].addPoint(', function asString, '(x(i, j)));' ;cr.	
	aStream nextPutAll: String tab, String tab, String tab, '}';cr.
	aStream nextPutAll: String tab, String tab, 'cout << endl;';cr.
	aStream nextPutAll: String tab, String tab, 't += tStep;';cr.
	aStream nextPutAll: String tab,'}';cr.
	aStream nextPutAll: String tab,'for (int i = 0; i < nbOfCompartment; i++)';cr.
	aStream nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'chartManager[i][j].drawChart(compartmentName[i], j+1, tMin, tMax, tStep);' ;cr.
	aStream nextPutAll: '}';cr;cr.
	^ aStream contents.