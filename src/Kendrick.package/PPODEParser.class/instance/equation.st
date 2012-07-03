grammar
equation

^ super equation ==> [:nodes |
	(nodes at: 2) ifNotNil: [
		(KEEquationExtended new)
		variable: ((KEVariable new) symbol: (nodes first) value asSymbol);
		tVariable: ((KEVariable new) symbol: (nodes at: 4) value asSymbol);
		idVariable: ((nodes at: 2) at: 2) value asSymbol;
		eqIndex: nil;
		expression: nodes last
		]
	ifNil: [
		(KEEquationExtended new)
		variable: ((KEVariable new) symbol: (nodes first) value asSymbol);
		tVariable: ((KEVariable new) symbol: (nodes at: 4) value asSymbol);
		idVariable: nil;
		eqIndex: nil;
		expression: nodes last
		] 	
	]