adding
addParameter: aSymbol value: aNumericalOrAnExpressionOrABlock
	|expression|
	aNumericalOrAnExpressionOrABlock isNumber 
	ifTrue: [ expression := (KENumerical new number: aNumericalOrAnExpressionOrABlock) ]
	ifFalse: [ 
		aNumericalOrAnExpressionOrABlock isString 
		ifTrue: [ expression := (aNumericalOrAnExpressionOrABlock parseAsAnExpression) ]
		ifFalse: [ expression := aNumericalOrAnExpressionOrABlock ]
	].
	parameters at: aSymbol put: (KEParameter new symbol: aSymbol; expression: expression)