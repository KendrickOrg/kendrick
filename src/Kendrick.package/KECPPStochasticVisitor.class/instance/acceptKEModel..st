as yet unclassified
acceptKEModel: aNode
	|working fileName|
	
	rateOfListEvent  := OrderedCollection new.
	listEvent  := OrderedCollection new.
	
	"Get the name of the model as the name of cpp file"
	fileName := self getFileName: aNode.
	"Initialize a file in which all code cpp generated will be saved"
	working := FileSystem disk workingDirectory.
	stream := (working / fileName) writeStream.
	"Traverse the model and visit each node"
	self prepareCPPFile.
	"visit all compartments"
	stream nextPutAll: '//# stochastic model';cr.
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

	
	"visit all equations"
	stream nextPutAll: 'void modelEquations( const state_type &x , state_type &dxdt , double t )';cr.
	stream nextPutAll: '{';cr.
	aNode equations do: [:each|
		stream nextPutAll: (self visitNode: each).
		].

	stream nextPutAll: '}';cr.
	
	"visit all list event"
	stream nextPutAll: 'void CalculRate()';cr.
	stream nextPutAll: '{';cr.
		aNode eventList  do: [:each|
		stream nextPutAll: (self visitNode: each).
		].
	stream nextPutAll: '}';cr.
	
	stream nextPutAll: (rateOfListEvent asString ) .


	"Enregistrer le fichier"
	stream close.