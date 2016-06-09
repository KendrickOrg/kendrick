as yet unclassified
atCompartment: keyInput put: number
	|key|
	((keyInput isDictionary) | (keyInput isSymbol)) ifTrue: [ key := keyInput ].
	keyInput isArray ifTrue: [ key := Dictionary newFrom: keyInput ].
	keyInput isString ifTrue: [ key := ((STONReader on: keyInput readStream) allowComplexMapKeys: true) next ].
	self initCompartments at: key ifAbsent: [ 
		(self compartmentNames include: key) ifFalse: [ ^ self error: 'No compartment names: ', key asString ].
		initCompartments := Dictionary newFrom: (self compartmentNames collect: [:c| c->0]).
		 ].
	(population initialSize < (initCompartments values sum + number)) ifTrue: [ ^ self error: 'Total size of compartments is greater than the population size' ].
	initCompartments at: key put: number.
	population compartments: initCompartments
	