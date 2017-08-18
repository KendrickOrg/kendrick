grammar
cos
	^ super cos
		==> [ :nodes | 
			KEMathFunctionExpression new
				functionName: #cos;
				functionExpr: (nodes at: 5) ]