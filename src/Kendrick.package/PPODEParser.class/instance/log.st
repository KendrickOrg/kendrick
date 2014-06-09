grammar
log

^ super log  ==> [:nodes|
	(KEExpressionWithMathFunction new)
	functionName: #log;
	exprInFunction: (nodes at: 5)
	]