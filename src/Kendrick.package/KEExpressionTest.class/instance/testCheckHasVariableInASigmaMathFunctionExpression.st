tests
testCheckHasVariableInASigmaMathFunctionExpression
	|dictionary ex|
	dictionary := self createADictionaryForTest.
	ex := (KESigmaFunctionExpression new) functionName: #sigma; functionExpr: (KEBinaryExpression new op: #*; leftHandSide: (KEVariable new symbol: #beta); rightHandSide: (KEIndexedVariable new symbol: #S)).
	self assert: (ex checkHasVariable: dictionary) equals: true.