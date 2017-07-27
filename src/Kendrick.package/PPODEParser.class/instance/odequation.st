grammar
odequation
	^ super odequation
		==> [ :arg1 | 
			| tmp2 |
			tmp2 := KEEquation new.
			tmp2
				variable: arg1 first parsedValue;
				tVariable: (arg1 at: 3) parsedValue;
				expression: arg1 last ]