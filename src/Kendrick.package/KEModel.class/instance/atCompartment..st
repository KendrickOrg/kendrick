as yet unclassified
atCompartment: anObject
	|key|
	anObject = #empty ifTrue: [ 
		^ self atParameter: #N ].
	anObject isString ifTrue: [ key := STON fromString: anObject ].
	anObject isDictionary ifTrue: [ key := anObject ].
	anObject isArray ifTrue: [ key := Dictionary newFrom: anObject ].
	^ self population sizeOfACompartment: key.
	
	
	
	