as yet unclassified
addParameter: keyInput expression: aBlock
	|reader key|
	oldVersion ifTrue: [ ^ parameters at: keyInput put: ((KEParameter new) symbol: keyInput; expression: aBlock) ].
	keyInput isSymbol ifTrue: [ 
		key := keyInput. 
		^ parameters at: key put: aBlock
		].
	reader := (STONReader on: keyInput readStream) allowComplexMapKeys: true.
	^ parameters at: (reader next) put: aBlock
	