grammar
power

^ super power foldLeft: [:a :op :b | 
		(KEBinaryExpression new)
		op:op;
		leftHandSide:a;
		rightHandSide:b
]