as yet unclassified
addCompartment: keyInput initialValue: number
	|reader|
	compartments ifNil: [ compartments := Dictionary new ].
	((keyInput isDictionary) | (keyInput isSymbol)) ifTrue: [ ^ compartments at: keyInput put: number ].
	reader := (STONReader on: keyInput readStream) allowComplexMapKeys: true.
	compartments at: (reader next) put: number.
	population compartments: compartments
	