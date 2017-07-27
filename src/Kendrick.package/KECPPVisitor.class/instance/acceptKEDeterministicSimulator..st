as yet unclassified
acceptKEDeterministicSimulator: arg1
	| tmp1 |
	tmp1 := WriteStream on: (String new: 60).
	tmp1
		nextPutAll: 'void solverDeterministic()';
		cr;
		nextPutAll: '{';
		cr;
		nextPutAll: String tab , 'state_type x(nbOfCompartments, nbOfSpecies, 0.0);';
		cr;
		nextPutAll: String tab , 'double t = tMin;';
		cr;
		nextPutAll: String tab , 'stringstream fname;';
		cr;
		nextPutAll: String tab , 'fname << "data_";';
		cr;
		nextPutAll: String tab , 'for (int i = 0; i < nbOfCompartments; i++)';
		cr;
		nextPutAll: String tab , String tab , 'fname << compartmentName[i];';
		cr;
		nextPutAll: String tab , 'fname << "_det.dat";';
		cr;
		nextPutAll: String tab , 'ofstream f(fname.str().data());';
		cr;
		nextPutAll: String tab , 'for (int i = 0; i < nbOfCompartments; i++)';
		cr;
		nextPutAll: String tab , String tab , 'for (int j = 0; j < nbOfSpecies; j++)';
		cr;
		nextPutAll: String tab , String tab , String tab , 'x(i, j) = initialValue[i][j];';
		cr;
		nextPutAll: String tab , 'if (f.is_open())';
		cr;
		nextPutAll: String tab , '{';
		cr;
		nextPutAll: String tab , String tab , 'while (t <= tMax)';
		cr;
		nextPutAll: String tab , String tab , '{';
		cr;
		nextPutAll: String tab , String tab , String tab , 'f << t << ''\t'';';
		cr;
		nextPutAll:
			String tab , String tab , String tab
				, 'rk4.do_step(initializeEquations, x, t, tStep);';
		cr;
		nextPutAll:
			String tab , String tab , String tab
				, 'for (int i = 0; i < nbOfCompartments; i++)';
		cr;
		nextPutAll:
			String tab , String tab , String tab , String tab
				, 'for (int j = 0; j < nbOfSpecies; j++)';
		cr;
		nextPutAll: String tab , String tab , String tab , String tab , '{';
		cr;
		nextPutAll:
			String tab , String tab , String tab , String tab , String tab
				, 'f << ' , function asString , '(x(i, j)) << ''\t'';';
		cr;
		nextPutAll: String tab , String tab , String tab , String tab , '}';
		cr;
		nextPutAll: String tab , String tab , String tab , 'f << ''\n'';';
		cr;
		nextPutAll: String tab , String tab , 't += tStep;';
		cr;
		nextPutAll: String tab , String tab , '}';
		cr;
		nextPutAll: String tab , String tab , 'f.close();';
		cr;
		nextPutAll: String tab , '}';
		cr;
		nextPutAll: '}';
		cr;
		cr.
	^ tmp1 contents