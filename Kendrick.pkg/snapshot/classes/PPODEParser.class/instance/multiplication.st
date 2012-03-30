
!PPODEParser methodsFor: 'grammar'!
multiplication

^ super multiplication foldLeft: [:a :op :b | 
		(KEBinaryExpression new)
		op: ((KEOperator new) symbol:op);
		leftHandSide:a;
		rightHandSide:b
]! !
