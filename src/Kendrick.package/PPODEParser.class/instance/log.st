grammar
log

^ super log  ==> [:nodes|
	(KEMathExpression new)
	function: #log;
	exprInFunction: (nodes at: 5)
	]