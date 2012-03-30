
!PPODEParser methodsFor: 'grammar'!
unary 

^ super unary ==> [:nodes |
	(KEUnaryExpression new)
		op: ((KEOperator new) symbol: (PPToken on: (nodes first) asString))
		; expression: nodes last]! !
