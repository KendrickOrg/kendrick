grammar
exp

^ super exp  ==> [:nodes|
	(KEMathFunction new)
	function: #exp;
	exprInFunction: (nodes at: 5)
	]