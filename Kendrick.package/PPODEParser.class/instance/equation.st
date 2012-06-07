grammar
equation

^ super equation ==> [:nodes |
	(KEEquation new)
		variable: ((KEVariable new) symbol: (nodes first) value asSymbol);
		tVariable: ((KEVariable new) symbol: (nodes at: 3) value asSymbol);
		expression: nodes last
	]