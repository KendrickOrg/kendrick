tests
testRemoveAVariableFromAnUnaryExpression
	| tmp1 tmp2 tmp4 tmp6 tmp8 |
	tmp4 := KEUnaryExpression new.
	tmp4 op: #-.
	tmp1 := tmp4 expression: (KEVariable new symbol: #S).
	tmp2 := tmp1 remove: (KEVariable new symbol: #S).
	self
		assert: tmp2 isUnaryExpression equals: true;
		assert: tmp2 expression equals: nil.
	tmp6 := KEUnaryExpression new.
	tmp6 op: #-.
	tmp8 := KEBinaryExpression new.
	tmp8
		op: #*;
		leftHandSide: (KEVariable new symbol: #S).
	tmp1 := tmp6
		expression: (tmp8 rightHandSide: (KEVariable new symbol: #I)).
	tmp2 := tmp1 remove: (KEVariable new symbol: #S).
	self
		assert: tmp2 isUnaryExpression equals: true;
		assert: tmp2 expression equals: (KEVariable new symbol: #I)