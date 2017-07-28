as yet unclassified
testKEMathExpressionWithExpressionAsAVariable
	|input visitor result|
	input := KEMathFunctionExpression new functionName: #cos; functionExpr: (KEVariable new symbol: #t).
	visitor := KECPPVisitor new.
	result := visitor visitNode: input.
	
	self assert: result = 'cos(t)'.
	