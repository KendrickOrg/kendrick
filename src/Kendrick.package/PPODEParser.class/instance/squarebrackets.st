grammar
squarebrackets
	^ super squarebrackets
		==> [ :nodes | 
			(nodes at: 5)
				ifNil: [ KEIndexedVariable new
						symbol: nodes first inputValue asSymbol;
						addIndex: (nodes at: 3) parsedValue ]
				ifNotNil: [ KEIndexedVariable new
						symbol: nodes first inputValue asSymbol;
						addIndex: (nodes at: 3) parsedValue;
						addAllIndex: (self getObjectArrayOf: (nodes at: 5) at: 2) ] ]