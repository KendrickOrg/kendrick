as yet unclassified
addCompartment: keyInput initialValue: number
	|reader|
	initCompartments ifNil: [ initCompartments := Dictionary new ].
	((keyInput isDictionary) | (keyInput isSymbol)) ifTrue: [ ^ initCompartments at: keyInput put: number ].
	reader := (STONReader on: keyInput readStream) allowComplexMapKeys: true.
	initCompartments at: (reader next) put: number.
	population compartments: initCompartments
	