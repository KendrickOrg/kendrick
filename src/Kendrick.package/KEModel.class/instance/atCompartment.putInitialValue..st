as yet unclassified
atCompartment: keyInput putInitialValue: number
	|reader|
	initCompartments ifNil: [ initCompartments := Dictionary new ].
	((keyInput isDictionary) | (keyInput isSymbol)) ifTrue: [ ^ initCompartments at: keyInput put: number ].
	reader := (STONReader on: keyInput readStream) allowComplexMapKeys: true.
	initCompartments at: (reader next) put: number.
	population compartments: initCompartments
	