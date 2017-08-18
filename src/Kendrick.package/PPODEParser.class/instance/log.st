grammar
log
	^ super log
		==> [ :nodes | 
			KEMathFunctionExpression new
				functionName: #log;
				functionExpr: (nodes at: 5) ]