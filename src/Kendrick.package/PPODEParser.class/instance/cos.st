grammar
cos
	^ super cos
		==> [ :arg1 | 
			| tmp2 |
			tmp2 := KEMathFunctionExpression new.
			tmp2
				functionName: #cos;
				functionExpr: (arg1 at: 5) ]