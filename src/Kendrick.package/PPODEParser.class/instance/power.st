grammar
power
	^ super power
		foldLeft: [ :a :op :b | 
			KEBinaryExpression new
				op: op inputValue asSymbol;
				leftHandSide: a;
				rightHandSide: b ]