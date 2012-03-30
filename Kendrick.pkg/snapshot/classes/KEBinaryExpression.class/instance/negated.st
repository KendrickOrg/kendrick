
!KEBinaryExpression methodsFor: 'as yet unclassified'!
negated

^ (KEUnaryExpression new) op: ((KEOperator new) symbol: (PPToken on:'-'));
		expression:self.! !
