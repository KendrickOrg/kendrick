as yet unclassified
acceptKEModel: aNode
	|working fileName|
	"Get the name of the model as the name of cpp file"
	fileName := self getFileName: aNode.
	"Initialize a file in which all code cpp generated will be saved"
	working := FileSystem disk workingDirectory.
	stream := (working / fileName) writeStream.
	function := ''.
	isDeterministic := true.
	"Traverse the model and visit each node"
	self prepareCPPFile.
	"visit all compartments"
	stream nextPutAll: 'const int nbOfCompartments = ', aNode compartments size asString, ';';cr.
	stream nextPutAll: 'const int nbOfSpecies = ', aNode numberOfSpecies asString, ';';cr.
	stream nextPutAll: 'const double tMin = ', aNode simulator tMin asString, ';';cr.
	stream nextPutAll: 'const double tMax = ', aNode simulator tMax asString, ';';cr.
	stream nextPutAll: 'const double tStep = ', aNode simulator step asString, ';';cr;cr.
	
	stream nextPutAll: 'double initialValue[nbOfCompartments][nbOfSpecies];';cr.		
	stream nextPutAll: 'string compartmentName[nbOfCompartments];';cr.
	stream nextPutAll: '#if USE_CV_PLOT';cr.
	stream nextPutAll: String tab,'ChartManager chartManager[nbOfCompartments][nbOfSpecies];';cr.
	stream nextPutAll: '#endif';cr.
	
	stream nextPutAll: '#if USE_GNU_PLOT';cr.
	stream nextPutAll: 'void output_gnuplot(){';cr.
	stream nextPutAll: String tab,'int i;';cr.
	stream nextPutAll: String tab,'FILE *out = fopen(PLTFILE,"w");';cr.
	stream nextPutAll: String tab,'char *outfile = OUTFILE;';cr.
	stream nextPutAll: String tab,'char *pngfile = PNGFILE;';cr.
	stream nextPutAll: String tab,'fprintf(out, "set xlabel \"Time\"\n");';cr.
	stream nextPutAll: String tab,'fprintf(out, "set ylabel \"Number of Inviduals\"\n");';cr.
	stream nextPutAll: String tab,'for (int i = 0; i < nbOfCompartments; i++) {';cr.
	stream nextPutAll: String tab,String tab,'fprintf(out,"set term png\n");';cr.
	stream nextPutAll: String tab,String tab,'fprintf(out,"set out \"out%d.png\"\n",i);';cr.
	stream nextPutAll: String tab,String tab,'fprintf(out, "p ");';cr.
	stream nextPutAll: String tab,String tab,'for (int j = 0; j < nbOfSpecies; j++) {';cr.
	stream nextPutAll: String tab,String tab,String tab,'if(j>0) fprintf(out, ",");';cr.
	stream nextPutAll: String tab,String tab,String tab,'if(nbOfSpecies > 1)';cr.
	stream nextPutAll: String tab,String tab,String tab,String tab,'fprintf(out, "\"%s\" u 1:%d t \"%s\" w l", outfile, i*nbOfCompartments+j+2, compartmentName[i].c_str());';cr.
	stream nextPutAll: String tab,String tab,String tab,'else';cr.
	stream nextPutAll: String tab,String tab,String tab,String tab,'fprintf(out, "\"%s\" u 1:%d t \"%s\" w l", outfile, i+j+2, compartmentName[i].c_str());';cr.
	stream nextPutAll: String tab,String tab,'}';cr.
	stream nextPutAll: String tab,'fprintf(out,"\n");';cr.
	stream nextPutAll: String tab,'}';cr.	
	stream nextPutAll: String tab,'fprintf(out, "\n");';cr.
	stream nextPutAll: String tab,'fprintf(out, "rep\n");';cr.
	
	stream nextPutAll: String tab,'printf("Type the following command if gnuplot is installed in your computer.\n");';cr.
	stream nextPutAll: String tab,'printf(">gnuplot %s\n",PLTFILE);';cr.
	stream nextPutAll: String tab,'fclose(out);';cr.
	stream nextPutAll: '}';cr.
	stream nextPutAll: '#endif';cr.
	
	stream nextPutAll: 'void initializeCompartments()';cr.
	stream nextPutAll: '{';cr.
	aNode compartments do: [:each|
		stream nextPutAll: (self visitNode: each).
		].
	stream nextPutAll: '}';cr.
	
	"visit all parameters"
	aNode parameters do: [:each|
		stream nextPutAll: (self visitNode: each).
		].
	
 	"visit all equations"
	stream nextPutAll: 'void initializeEquations(const state_type &x, state_type &dxdt, double t)';cr.
	stream nextPutAll: '{';cr.
	aNode equations do: [:each|
		stream nextPutAll: (self visitNode: each).
		].
	stream nextPutAll: '}';cr;cr.
	
	stream nextPutAll: (self visitNode: aNode simulator).
	
	stream nextPutAll: 'int main(int argc, char **argv)';cr.
	stream nextPutAll: '{';cr.
	stream nextPutAll: String tab,'initializeCompartments();';cr.
	stream nextPutAll: String tab,'solverDeterministic();';cr.
	stream nextPutAll: String tab,'#if USE_GNU_PLOT';cr.
	stream nextPutAll: String tab,String tab,'output_gnuplot();';cr.
	stream nextPutAll: String tab,'#endif';cr.
	
	stream nextPutAll: String tab,'#if USE_CV_PLOT';cr.
	stream nextPutAll: String tab,String tab,'cvWaitKey(0);';cr.
	stream nextPutAll: String tab,'#endif';cr.
	stream nextPutAll: '}';cr.
		
	"Enregistrer le fichier"
	stream close.