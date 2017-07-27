grammar
log
	^ super log
		==> [ :arg1 | 
			| tmp2 |
			tmp2 := KEMathFunctionExpression new.
			tmp2
				functionName: #log;
				functionExpr: (arg1 at: 5) ]