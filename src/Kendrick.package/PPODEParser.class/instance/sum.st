grammar
sum
	^ super sum
		==> [ :nodes | 
			KESigmaFunctionExpression new
				functionName: #sum;
				idVariable: (nodes at: 5) parsedValue;
				functionExpr: (nodes at: 7) ]