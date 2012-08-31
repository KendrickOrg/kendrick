grammar
sum 

^ super sum  ==> [:nodes|
	(KEMathFunctionSigma new)
	function: #sum;
	idVariable: (nodes at: 5) value asSymbol;
	exprInFunction: (nodes at: 7)
	]