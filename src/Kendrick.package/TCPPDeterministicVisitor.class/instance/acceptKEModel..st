as yet unclassified 
acceptKEModel: aNode
	|working fileName|
	
	"Get the name of the model as the name of cpp file"
	fileName := self getFileName: aNode.
	"Initialize a file in which all code cpp generated will be saved"
	working := FileSystem disk workingDirectory.
	stream := (working / fileName) writeStream.	
	isDeterministic := true.
	"Traverse the model and visit each node"
	self prepareCPPFile.
	"visit all compartments"
	"ThanhNT 12/7"
	"stream nextPutAll: 'const int nbOfCompartments = ', aNode compartments size asString, ';';cr."
	"Endof ThanhNT 12/7"
	stream nextPutAll: 'const int nbOfCompartments = ', (self nbOfCompartments) asString, ';';cr.
	
	"ThanhNT 12/7"
	"This work still not yet finished"
	"stream nextPutAll: 'const int nbOfSpecies = ', aNode numberOfSpecies asString, ';';cr."
	"Endof ThanhNT 12/7"
	stream nextPutAll: 'const double tMin = ', aNode simulator tMin asFloat asString, ';';cr.
	stream nextPutAll: 'const double tMax = ', aNode simulator tMax asFloat asString, ';';cr.
	stream nextPutAll: 'const double tStep = ', aNode simulator step asFloat asString, ';';cr;cr.
	
	stream nextPutAll: 'double initialValue[nbOfCompartments][nbOfSpecies];';cr.		
	stream nextPutAll: 'string compartmentName[nbOfCompartments];';cr.
	"stream nextPutAll: 'ChartManager chartManager[nbOfCompartments][nbOfSpecies];';cr;cr."
	
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
	stream nextPutAll: String tab, 'cout << "Start..." << endl;';cr.
	stream nextPutAll: String tab,'initializeCompartments();';cr.
	stream nextPutAll: String tab,'solverDeterministic();';cr.
	stream nextPutAll: String tab, 'cout << "Finished..." << endl;';cr.
	"stream nextPutAll:  String tab,'cvWaitKey(0);';cr."
	stream nextPutAll: '}';cr.
		
	"Enregistrer le fichier"
	stream close.