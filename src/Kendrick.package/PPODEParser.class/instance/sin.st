grammar
sin
	^ super sin
		==> [ :nodes | 
			KEMathFunctionExpression new
				functionName: #sin;
				functionExpr: (nodes at: 5) ]