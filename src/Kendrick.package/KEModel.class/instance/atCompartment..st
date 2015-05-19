as yet unclassified
atCompartment: anObject
	|key|
	anObject = #empty ifTrue: [ 
		|s|
		s := (self atParameter: #inProcessingCompartment) copy.
		s ~= #population ifTrue: [ 
			s removeKey: #status. 
			s size = 0 ifTrue: [ s := #population ] ifFalse: [ s := s associations ] ].
		^ self sizeOfPopulation: s ].
	anObject isString ifTrue: [ key := STON fromString: anObject ].
	anObject isDictionary ifTrue: [ key := anObject ].
	^ self sizeOfCompartment: key.
	
	
	
	