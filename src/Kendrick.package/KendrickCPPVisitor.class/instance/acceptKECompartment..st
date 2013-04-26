as yet unclassified
acceptKECompartment: aNode
	|aStream|
	aStream := WriteStream on: (String new: 60).
	compartments at: aNode status put: nbOfCompartments.
	nbOfCompartments := nbOfCompartments + 1.
	aStream nextPutAll: 'initialValue[' , (compartments at: aNode status) asString , '] = ', (aNode numberOfIndividuals at: 1) asString, ';';cr.
	^ aStream contents.