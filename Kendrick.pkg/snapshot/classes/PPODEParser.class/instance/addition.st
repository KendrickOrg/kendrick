
!PPODEParser methodsFor: 'grammar'!
addition

^ super addition foldLeft: [:a :op :b | 
		(KEBinaryExpression new)
		op: ((KEOperator new) symbol:op);
		leftHandSide:a;
		rightHandSide:b]! !
