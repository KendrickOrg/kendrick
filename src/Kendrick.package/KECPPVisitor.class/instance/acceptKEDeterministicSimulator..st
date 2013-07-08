as yet unclassified
acceptKEDeterministicSimulator: aNode
	|aStream|
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: 'void solverDeterministic()';cr.
	aStream nextPutAll: '{';cr.
	aStream nextPutAll: String tab,'	#if USE_GNU_PLOT';cr.
	aStream nextPutAll: String tab,'FILE *out=fopen(OUTFILE, "w");';cr.
	aStream nextPutAll: String tab,'#endif';cr;cr.	
	aStream nextPutAll: String tab,'#if USE_R_PLOT';cr.
	aStream nextPutAll: String tab,'fprintf(out, "time\t");';cr.
	aStream nextPutAll: String tab,'for (int i = 0; i < nbOfCompartments; i++) {';cr.
	aStream nextPutAll: String tab,String tab,'for (int j = 0; j < nbOfSpecies; j++){ ';cr.
	aStream nextPutAll: String tab,String tab,String tab,'if(j>0)';cr.
	aStream nextPutAll: String tab,String tab,String tab,String tab,'fprintf(out, "%s[%d]",compartmentName[i].c_str(),j);';cr.
	aStream nextPutAll: String tab,String tab,String tab,'else';cr.
	aStream nextPutAll: String tab,String tab,String tab,String tab,'fprintf(out, "%s",compartmentName[i].c_str());';cr.
	aStream nextPutAll: String tab,String tab,String tab,'if(j < nbOfSpecies-1)';cr.
	aStream nextPutAll: String tab,String tab,String tab,String tab,'fprintf(out, "\t");';cr.
	aStream nextPutAll: String tab,String tab,'}';cr.
	aStream nextPutAll: String tab,String tab,'if(i < nbOfCompartments-1)';cr.
	aStream nextPutAll: String tab,String tab,String tab,'fprintf(out, "\t");';cr.
	aStream nextPutAll: String tab,'}';cr.
	aStream nextPutAll: String tab,'fprintf(out, "\n");';cr.
	aStream nextPutAll: String tab,'#endif';cr.
	
	aStream nextPutAll: String tab,'state_type x(nbOfCompartments, nbOfSpecies, 0.0);';cr.
	aStream nextPutAll: String tab, 'double t = tMin;';cr.
	aStream nextPutAll: String tab,'for (int i = 0; i < nbOfCompartments; i++)';cr.
	aStream nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'x(i, j) = initialValue[i][j];';cr.
	aStream nextPutAll: String tab,'while (t <= tMax)';cr.
	aStream nextPutAll: String tab, '{';cr.
	
	aStream nextPutAll: String tab, String tab, 'cout << t << "  ";';cr.
	aStream nextPutAll: String tab, String tab, '#if USE_GNU_PLOT';cr.
	aStream nextPutAll: String tab, String tab, String tab,'fprintf(out, "%f", t);';cr.
	aStream nextPutAll: String tab, String tab, '#endif';cr.
	
	aStream nextPutAll: String tab, String tab,'rk4.do_step(initializeEquations, x, t, tStep);';cr.
	aStream nextPutAll: String tab, String tab,'for (int i = 0; i < nbOfCompartments; i++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, '{';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, 'cout <<', function asString, '(x(i, j)) << "  ";';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, '#if USE_CV_PLOT';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, 'chartManager[i][j].addPoint(',function asString,'(x(i, j)));';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, '#endif';cr;cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, '#if USE_GNU_PLOT';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, String tab,'fprintf(out, "\t%f",',function asString,'x(i, j)); ';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, '#endif';cr.
	aStream nextPutAll: String tab, String tab, String tab, '}';cr.
	aStream nextPutAll: String tab, String tab, '#if USE_GNU_PLOT';cr.
	aStream nextPutAll: String tab, String tab, String tab,'fprintf(out, "\n");';cr.
	aStream nextPutAll: String tab, String tab, '#endif';cr.
	aStream nextPutAll: String tab, String tab, 'cout << endl;';cr.
	aStream nextPutAll: String tab, String tab, 't += tStep;';cr.
	aStream nextPutAll: String tab,'}';cr.
	aStream nextPutAll: String tab,'for (int i = 0; i < nbOfCompartments; i++)';cr.
	aStream nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, '#if USE_CV_PLOT';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab,'chartManager[i][j].drawChart(compartmentName[i], j+1, tMin, tMax, tStep);';cr.
	aStream nextPutAll: String tab, String tab, String tab, '#endif';cr.
	aStream nextPutAll: '}';cr;cr.
	^ aStream contents.