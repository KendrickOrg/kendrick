grammar
simpleEquation
	^ super simpleEquation
		==> [ :arg1 | 
			| tmp2 |
			tmp2 := KEEquation new.
			tmp2
				variable: arg1 first parsedValue;
				tVariable: nil;
				expression: arg1 last ]