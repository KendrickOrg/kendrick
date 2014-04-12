as yet unclassified
atParameter: aSymbol
	|x|
	x := parameters at: aSymbol ifAbsent: [^ nil].
	x ifNil: [ ^ nil ].
	x expression 
	ifNotNil: [ 
		x evaluateWithModel: self withTemporalParameters: temporalParameters
		 ].
	^ x value