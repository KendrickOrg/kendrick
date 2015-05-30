as yet unclassified
addParameter: aSymbol value: aNumericalOrAnExpressionOrABlock
	|expression|
	(aNumericalOrAnExpressionOrABlock isSymbol and: [ aNumericalOrAnExpressionOrABlock = #sizeOfPopulation ])
	ifTrue: [ 
		^ parameters at: aSymbol put: #sizeOfPopulation ].
	aNumericalOrAnExpressionOrABlock isNumber 
	ifTrue: [ expression := (KENumerical new number: aNumericalOrAnExpressionOrABlock) ]
	ifFalse: [ expression := aNumericalOrAnExpressionOrABlock ].
	parameters at: aSymbol put: (KEParameter new symbol: aSymbol; expression: expression)