as yet unclassified
unary 

^ super unary ==> [:nodes |
	(KEUnaryExpression new)
		op: nodes first
		; expression: nodes last]