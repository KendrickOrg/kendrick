as yet unclassified
addParameter: keyInput expression: aBlock
	|reader|
	((keyInput isDictionary) | (keyInput isSymbol)) ifTrue: [ ^ parameters at: keyInput put: aBlock ].
	reader := (STONReader on: keyInput readStream) allowComplexMapKeys: true.
	^ parameters at: (reader next) put: aBlock
	