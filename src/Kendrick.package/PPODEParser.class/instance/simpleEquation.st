grammar
simpleEquation
	^ super simpleEquation
		==> [ :nodes | 
			KEEquation new
				variable: nodes first parsedValue;
				tVariable: nil;
				expression: nodes last ]