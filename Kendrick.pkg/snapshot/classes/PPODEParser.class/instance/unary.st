
!PPODEParser methodsFor: 'grammar'!
unary 

^ super unary ==> [:nodes |
	(KEUnaryExpression new)
		op: (nodes first) asSymbol
		; expression: nodes last]! !
