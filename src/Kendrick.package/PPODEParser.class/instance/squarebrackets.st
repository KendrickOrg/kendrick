grammar
squarebrackets

^ super squarebrackets ==> [:nodes |
	(nodes at: 4) 
	ifNotNil: [
		(KEIndexedVariable new)
		symbol: (nodes first) inputValue asSymbol;
		idExpression1: (nodes at: 3) inputValue ; 
		idExpression2: (((nodes at: 4) at: 1) at: 2) inputValue] 
	ifNil: [
		(KEIndexedVariable new)
		symbol: (nodes first) inputValue  asSymbol;
		idExpression1: (nodes at: 3) inputValue;
		idExpression2: -1
		]		
	]