grammar
exp
	^ super exp
		==> [ :arg1 | 
			| tmp2 |
			tmp2 := KEMathFunctionExpression new.
			tmp2
				functionName: #exp;
				functionExpr: (arg1 at: 5) ]