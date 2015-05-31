as yet unclassified
atCompartment: anObject
	|key|
	anObject = #empty ifTrue: [ 
		|s|
		s := self parameters at: #subPopulation.
		s ifNil: [ ^ self sizeOfPopulation: #population ].
		^ self sizeOfPopulation: s associations ].
	anObject isString ifTrue: [ key := STON fromString: anObject ].
	anObject isDictionary ifTrue: [ key := anObject ].
	key ifNotNil: [ 
		^ compartments at: key ifAbsent: [ 
				|c|
				c := KEDictionary new.
				compartments keysAndValuesDo: [ :k :v|
					(k associations includesAll: (key associations)) ifTrue: [ 
						|temp|
						temp := k copy.
						key keysDo: [ :each| temp removeKey: each ].
						c at: temp put: v
					] 
				].
				c size = 0 ifTrue: [ ^ self error: 'Do not have the compartment named: ', key asString ].
				^ c 
		 ]
	].
	^ self error: 'Argument must be a String of/or a Dictionary'
	
	
	
	