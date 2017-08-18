grammar
addition
	^ super addition
		foldLeft: [ :a :op :b | 
			KEBinaryExpression new
				op: op inputValue asSymbol;
				leftHandSide: a;
				rightHandSide: b ]