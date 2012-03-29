grammar
equation

^ super equation ==> [:nodes |
	(KEEquation new)
		variable: ((KEVariable new) symbol: (nodes first));
		expression: nodes last
	]