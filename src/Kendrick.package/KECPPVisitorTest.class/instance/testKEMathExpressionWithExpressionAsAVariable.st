as yet unclassified
testKEMathExpressionWithExpressionAsAVariable
	|input visitor result|
	input := KEMathExpression new function: #cos; exprInFunction: (KEVariable new symbol: #t).
	visitor := KECPPVisitor new.
	result := visitor visitNode: input.
	
	self assert: result = 'cos(t)'.
	