grammar
squarebrackets

"^ super squarebrackets ==> [:nodes |
	(nodes at: 5) 
	ifNotNil: [
		(KEIndexedVariable new)
		symbol: (nodes first) inputValue asSymbol;
		idExpression1: (nodes at: 3) parsedValue; 
		idExpression2: (((nodes at: 5) at: 1) at: 2) parsedValue] 
	ifNil: [
		(KEIndexedVariable new)
		symbol: (nodes first) inputValue  asSymbol;
		idExpression1: (nodes at: 3) parsedValue;
		idExpression2: ((KENumerical new) number: -1).
		]		
	]"
	^ super squarebrackets ==> [ :nodes|
		(nodes at: 5) 
		ifNil: [ 
			(KEIndexedVariable new)
				symbol: (nodes first) inputValue asSymbol;
				addIndex: (nodes at: 3) parsedValue
			 ]
		ifNotNil: [ 
			(KEIndexedVariable new)
				symbol: (nodes first) inputValue asSymbol;
				addIndex: (nodes at: 3) parsedValue;
				addAllIndex: (self getObjectArrayOf: (nodes at: 5) at: 2)
			 ]
		]