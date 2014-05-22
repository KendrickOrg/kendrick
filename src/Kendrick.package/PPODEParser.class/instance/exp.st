grammar
exp

^ super exp  ==> [:nodes|
	(KEExpressionWithMathFunction new)
	functionName: #exp;
	exprInFunction: (nodes at: 5)
	]