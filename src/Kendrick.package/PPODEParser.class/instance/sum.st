grammar
sum 

^ super sum  ==> [:nodes|
	(KEExpressionWithSigmaMathFunction new)
	functionName: #sum;
	idVariable: (nodes at: 5) parsedValue;
	exprInFunction: (nodes at: 7)
	]