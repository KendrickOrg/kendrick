grammar
sum 

^ super sum  ==> [:nodes|
	(KEMathExpressionSigma new)
	function: #sum;
	idVariable: (nodes at: 5) value asSymbol;
	exprInFunction: (nodes at: 7)
	]