as yet unclassified
acceptKECompartment: aNode
	|aStream|
	aStream := WriteStream on: (String new: 60).
	compartments at: aNode status put: nbOfCompartments.
	nbOfCompartments := nbOfCompartments + 1.	

	aNode numberOfIndividuals isArray 
	ifFalse: [ 
			aStream nextPutAll:String tab, 'initialValue[' , (compartments at: aNode status) asString , '] = ', (aNode initialValue at: 1) asString, ';';cr. ]
	ifTrue: [ 
			1 to: (aNode numberOfSpecies)  do: [ :each|   
			aStream nextPutAll:String tab, 'compartmentName[', ( (compartments at: aNode status)* (aNode numberOfSpecies ) + (each-1) ) asString , '] = "', (aNode status) asString ,'";';cr.
			aStream nextPutAll:String tab, 'initialValue[' , ( (compartments at: aNode status)* (aNode numberOfSpecies ) + (each-1) ) asString , '] = ', (aNode initialValue at: each ) asString, ';';cr. ].
		].
	
	^ aStream contents.