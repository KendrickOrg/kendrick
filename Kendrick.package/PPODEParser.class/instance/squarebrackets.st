grammar
squarebrackets

^ super squarebrackets ==> [:nodes |
	(nodes at: 4) 
	ifNotNil: [
		(KEVariableExtended new)
		symbol: (nodes first) value asSymbol;
		index1: (nodes at: 3) value asSymbol; 
		index2: (((nodes at: 4) at: 1) at: 2) value asSymbol] 
	ifNil: [
		(KEVariableExtended new)
		symbol: (nodes first) value asSymbol;
		index1: (nodes at: 3) value asSymbol;
		index2: -1
		]		
	]