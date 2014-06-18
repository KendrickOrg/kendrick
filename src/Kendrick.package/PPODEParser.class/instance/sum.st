grammar
sum 

^ super sum  ==> [:nodes|
	(KEMathExpressionSigma new)
	function: #sum;
	idVariable: (nodes at: 5) inputValue asSymbol;
	exprInFunction: (nodes at: 7)
	]