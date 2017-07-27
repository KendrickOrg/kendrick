as yet unclassified
testKEMathExpressionWithExpressionAsBinaryExpression
	| tmp1 tmp2 tmp3 tmp4 tmp6 tmp8 |
	tmp6 := KEBinaryExpression new.
	tmp6
		op: #*;
		leftHandSide: (KENumerical new number: 2).
	tmp4 := tmp6 rightHandSide: (KEVariable new symbol: #t).
	tmp8 := KEMathFunctionExpression new.
	tmp8 functionName: #cos.
	tmp1 := tmp8 functionExpr: tmp4.
	tmp2 := KECPPVisitor new.
	tmp3 := tmp2 visitNode: tmp1.
	self assert: tmp3 = 'cos(2*t)'