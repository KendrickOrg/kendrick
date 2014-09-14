grammar
cos 

^ super cos  ==> [:nodes|
	(KEExpressionWithMathFunction new)
	functionName: #cos;
	exprInFunction: (nodes at: 5)
	]