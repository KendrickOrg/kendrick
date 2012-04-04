grammar
equation

^ super equation ==> [:nodes |
	(KEEquation new)
		variable: ((KEVariable new) symbol: (nodes first) value asSymbol);
		expression: nodes last
	]