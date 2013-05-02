grammar
multiplication

^ super multiplication foldLeft: [:a :op :b | 
		(KEBinaryExpression new)
		op: op value asSymbol;
		leftHandSide:a;
		rightHandSide:b
]