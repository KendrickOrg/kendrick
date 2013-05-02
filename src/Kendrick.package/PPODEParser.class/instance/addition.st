grammar
addition

^ super addition foldLeft: [:a :op :b | 
		(KEBinaryExpression new)
		op: op value asSymbol;
		leftHandSide:a;
		rightHandSide:b]