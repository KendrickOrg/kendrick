as yet unclassified
acceptKEDeterministicSimulator: aNode
	|aStream|
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: 'void solverDeterministic()';cr.
	aStream nextPutAll: '{';cr.
	aStream nextPutAll: String tab,'state_type x(nbOfCompartments, nbOfSpecies, 0.0);';cr.
	aStream nextPutAll: String tab, 'double t = tMin;';cr.
	aStream nextPutAll: String tab, 'stringstream fname;';cr.
	aStream nextPutAll: String tab, 'fname << "data_";';cr.
	aStream nextPutAll: String tab, 'for (int i = 0; i < nbOfCompartments; i++)';cr.
	aStream nextPutAll: String tab, String tab, 'fname << compartmentName[i];';cr.
	aStream nextPutAll: String tab, 'fname << "_det.dat";';cr.
	
	"use gnu plot"
	aStream nextPutAll: String tab, 'output_gnuplot(fname.str().data(),nbOfCompartments,nbOfSpecies,compartmentName);';cr.
	
	aStream nextPutAll: String tab, 'ofstream f(fname.str().data());';cr.
	aStream nextPutAll: String tab,'for (int i = 0; i < nbOfCompartments; i++)';cr.
	aStream nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'x(i, j) = initialValue[i][j];';cr.
	aStream nextPutAll: String tab, 'if (f.is_open())';cr.
	aStream nextPutAll: String tab, '{';cr.
	aStream nextPutAll: String tab, String tab, 'while (t <= tMax)';cr.
	aStream nextPutAll: String tab, String tab, '{';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'f << t << ''\t'';';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'rk4.do_step(initializeEquations, x, t, tStep);';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'for (int i = 0; i < nbOfCompartments; i++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, '{';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, String tab, 'f << ', function asString, '(x(i, j)) << ''\t'';';cr.
	"aStream nextPutAll: String tab, String tab, String tab, String tab, 'chartManager[i][j].addPoint(', function asString, '(x(i, j)));' ;cr.	"
	aStream nextPutAll: String tab, String tab, String tab, String tab, '}';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'f << ''\n'';';cr.
	aStream nextPutAll: String tab, String tab, 't += tStep;';cr.
	aStream nextPutAll: String tab, String tab, '}';cr.
	aStream nextPutAll: String tab, String tab, 'f.close();';cr.
	aStream nextPutAll: String tab, '}';cr.
	"aStream nextPutAll: String tab,'for (int i = 0; i < nbOfCompartment; i++)';cr.
	aStream nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'chartManager[i][j].drawChart(compartmentName[i], j+1, tMin, tMax, tStep);' ;cr."
	aStream nextPutAll: '}';cr;cr.
	^ aStream contents.