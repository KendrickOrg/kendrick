tests
testRemoveAVariableFromAnUnaryExpression
	|e n|
	e := (KEUnaryExpression new) op:#-; expression: (KEVariable new symbol: #S).
	n := e remove: (KEVariable new symbol: #S).
	self assert: n isUnaryExpression equals: true.
	self assert: n expression equals: nil.
	e := (KEUnaryExpression new) op: #-; expression: (KEBinaryExpression new op:#*;leftHandSide: (KEVariable new symbol: #S);rightHandSide: (KEVariable new symbol: #I)).
	n := e remove: (KEVariable new symbol: #S).
	self assert: n isUnaryExpression equals: true.
	self assert: n expression equals: (KEVariable new symbol: #I).