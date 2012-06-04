grammar
log

^ super log  ==> [:nodes|
	(KEMathFunction new)
	function: #log;
	exprInFunction: (nodes at: 5)
	]