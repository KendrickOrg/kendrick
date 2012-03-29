
!PPODEParser methodsFor: 'grammar'!
addition

^ super addition foldLeft: [:a :op :b | 
		(KEBinaryExpression new)
		op:op;
		leftHandSide:a;
		rightHandSide:b]! !
