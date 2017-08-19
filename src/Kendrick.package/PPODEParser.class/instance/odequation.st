grammar
odequation

^ super odequation ==> [:nodes |
	(KEEquation new)
		variable: (nodes first parsedValue);
		tVariable: ((nodes at: 3) parsedValue);
		expression: nodes last
	]