tests
testCheckHasVariableInAnUnaryExpression
	|dictionary ex|
	dictionary := self createADictionaryForTest.
	ex := (KEUnaryExpression new) op: #-; expression: (KEBinaryExpression new op: #*; leftHandSide: (KEVariable new symbol: #beta); rightHandSide: (KEVariable new symbol: #S)).
	self assert: (ex checkHasVariable: dictionary) equals: true.