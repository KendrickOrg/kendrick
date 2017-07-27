grammar
power
	^ super power
		foldLeft: [ :arg1 :arg2 :arg3 | 
			| tmp2 |
			tmp2 := KEBinaryExpression new.
			tmp2
				op: arg2 inputValue asSymbol;
				leftHandSide: arg1;
				rightHandSide: arg3 ]