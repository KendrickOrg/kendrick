tests
testCheckHasVariableInABinaryExpression
	|dictionary ex|
	dictionary := self createADictionaryForTest.
	ex := (KEBinaryExpression new) op: #+; leftHandSide: (KEVariable new symbol: #beta); rightHandSide: (KEVariable new symbol: #I).
	self assert: (ex checkHasVariable: dictionary) equals: true.