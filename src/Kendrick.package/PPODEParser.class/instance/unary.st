grammar
unary
	^ super unary
		==> [ :arg1 | 
			| tmp2 |
			tmp2 := KEUnaryExpression new.
			tmp2
				op: arg1 first asSymbol;
				expression: arg1 last ]