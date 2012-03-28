grammar
equation

^ super equation ==> [:nodes |
	(KEEquation new)
		variable: nodes first;
		expression: nodes last
	]