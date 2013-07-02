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
	stream nextPutAll: 'ChartManager chartManager[nbOfCompartments][nbOfSpecies];';cr;cr.
	
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
	stream nextPutAll:  String tab,'cvWaitKey(0);';cr.
	stream nextPutAll: '}';cr.
		
	"Enregistrer le fichier"
	stream close.