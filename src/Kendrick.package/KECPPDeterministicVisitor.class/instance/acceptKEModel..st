as yet unclassified
acceptKEModel: aNode
	|working fileName|
	
	"Get the name of the model as the name of cpp file"
	fileName := self getFileName: aNode.
	"Initialize a file in which all code cpp generated will be saved"
	working := FileSystem disk workingDirectory.
	stream := (working / fileName) writeStream.
	"Traverse the model and visit each node"
	self prepareCPPFile.
	"visit all compartments"
	stream nextPutAll: '#define nbOfCompartment ', (aNode compartments size) asString;cr.
	stream nextPutAll: '#define nbOfSpecies ', (aNode numberOfSpecies  ) asString;cr.
	stream nextPutAll: 'double initialValue[nbOfCompartment * nbOfSpecies];';cr.
	
	stream nextPutAll: 'ChartManager chartManager[nbOfCompartment * nbOfSpecies];';cr.
	stream nextPutAll: 'string compartmentName[nbOfCompartment * nbOfSpecies];';cr;cr.
	
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
	stream nextPutAll: 'void modelEquations( const state_type &x , state_type &dxdt , double t )';cr.
	stream nextPutAll: '{';cr.
	"bStream nextPutAll: String tab,'double tmp = 0;';cr."
	bStream nextPutAll: String tab,'tmp = 0;';cr.
	stream nextPutAll: 'double tmp = 0;';cr.
	aNode equations do: [:each|
		stream nextPutAll: (self visitNode: each).
		].

	stream nextPutAll: '}';cr.
	"visit the mode of simulation of the model"
	stream nextPutAll: (self visitNode: aNode simulator).
	aNode simulator class = KEDeterministicSimulator ifTrue: [
		stream nextPutAll: 'int main(int argc, char **argv)';cr.
		stream nextPutAll: '{';cr.
		stream nextPutAll: String tab,'initializeCompartments();';cr.
		stream nextPutAll: String tab,'solverDeteministe();';cr.
		stream nextPutAll:  String tab,'cvWaitKey(0);';cr.
		stream nextPutAll: '}';cr.
		].
	"Enregistrer le fichier"
	stream close.