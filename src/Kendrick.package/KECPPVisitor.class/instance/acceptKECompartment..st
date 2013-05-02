as yet unclassified
acceptKECompartment: aNode
	|aStream|
	aStream := WriteStream on: (String new: 60).
	compartments at: aNode status put: nbOfCompartments.
	nbOfCompartments := nbOfCompartments + 1.
	
		aStream nextPutAll: 'compartmentName[', (compartments at: aNode status) asString , '] = "', (aNode status  at: 1) asString ,'";';cr.
	aStream nextPutAll: 'initialValue[' , (compartments at: aNode status) asString , '] = ', (aNode numberOfIndividuals at: 1) asString, ';';cr.
	
	^ aStream contents.