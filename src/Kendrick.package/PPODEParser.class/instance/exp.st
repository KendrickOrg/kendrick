grammar
exp

^ super exp  ==> [:nodes|
	(KEMathExpression new)
	function: #exp;
	exprInFunction: (nodes at: 5)
	]