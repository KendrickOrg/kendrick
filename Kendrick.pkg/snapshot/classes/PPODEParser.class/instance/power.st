
!PPODEParser methodsFor: 'grammar'!
power

^ super power foldLeft: [:a :op :b | 
		(KEBinaryExpression new)
		op: ((KEOperator new) symbol:op);
		leftHandSide:a;
		rightHandSide:b
]! !
