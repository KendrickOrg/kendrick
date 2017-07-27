grammar
squarebrackets
	^ super squarebrackets
		==> [ :arg1 | 
			(arg1 at: 5)
				ifNil: [ | tmp2 |
					tmp2 := KEIndexedVariable new.
					tmp2
						symbol: arg1 first inputValue asSymbol;
						addIndex: (arg1 at: 3) parsedValue ]
				ifNotNil: [ | tmp4 |
					tmp4 := KEIndexedVariable new.
					tmp4
						symbol: arg1 first inputValue asSymbol;
						addIndex: (arg1 at: 3) parsedValue;
						addAllIndex: (self getObjectArrayOf: (arg1 at: 5) at: 2) ] ]