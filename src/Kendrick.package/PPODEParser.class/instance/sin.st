grammar
sin
	^ super sin
		==> [ :arg1 | 
			| tmp2 |
			tmp2 := KEMathFunctionExpression new.
			tmp2
				functionName: #sin;
				functionExpr: (arg1 at: 5) ]