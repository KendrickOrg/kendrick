tests
testPrintABinaryExpression
	| e a b |
	
	e := KEBinaryExpression new.
	a := KENumerical number:3.
	b := KENumerical number:4.
	e
		op: #+;
		leftHandSide: a;
		rightHandSide: b.

	self assert: '3+4' equals: e asString