grammar
sin 

^ super sin  ==> [:nodes|
	(KEExpressionWithMathFunction new)
	functionName: #sin;
	exprInFunction: (nodes at: 5)
	]