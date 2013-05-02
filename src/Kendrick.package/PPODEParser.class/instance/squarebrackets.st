grammar
squarebrackets

^ super squarebrackets ==> [:nodes |
	(nodes at: 4) 
	ifNotNil: [
		(KEIndexedVariable new)
		symbol: (nodes first) value asSymbol;
		idExpression1: (nodes at: 3) value; 
		idExpression2: (((nodes at: 4) at: 1) at: 2) value] 
	ifNil: [
		(KEIndexedVariable new)
		symbol: (nodes first) value asSymbol;
		idExpression1: (nodes at: 3) value;
		idExpression2: -1
		]		
	]