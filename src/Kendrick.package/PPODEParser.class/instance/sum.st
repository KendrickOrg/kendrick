grammar
sum
	^ super sum
		==> [ :arg1 | 
			| tmp2 |
			tmp2 := KESigmaFunctionExpression new.
			tmp2
				functionName: #sum;
				idVariable: (arg1 at: 5) parsedValue;
				functionExpr: (arg1 at: 7) ]