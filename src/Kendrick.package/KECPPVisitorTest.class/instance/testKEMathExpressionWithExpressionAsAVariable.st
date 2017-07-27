as yet unclassified
testKEMathExpressionWithExpressionAsAVariable
	| tmp1 tmp2 tmp3 tmp5 |
	tmp5 := KEMathFunctionExpression new.
	tmp5 functionName: #cos.
	tmp1 := tmp5 functionExpr: (KEVariable new symbol: #t).
	tmp2 := KECPPVisitor new.
	tmp3 := tmp2 visitNode: tmp1.
	self assert: tmp3 = 'cos(t)'