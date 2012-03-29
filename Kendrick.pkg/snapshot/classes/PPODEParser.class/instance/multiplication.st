
!PPODEParser methodsFor: 'grammar'!
multiplication

^ super multiplication foldLeft: [:a :op :b | 
		(KEBinaryExpression new)
		op:op;
		leftHandSide:a;
		rightHandSide:b
]! !
