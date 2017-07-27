grammar
exp

^ super exp  ==> [:nodes|
	(KEMathFunctionExpression new)
	functionName: #exp;
	functionExpr: (nodes at: 5)
	]