tests
testNegatedABinaryExpression
	| e a b o |
	
	e := KEBinaryExpression new.
	a := KENumerical number: 3.
	b := KENumerical number: 7.
	o := #+.
	e
		op: o;
		leftHandSide: a;
		rightHandSide: b.
	self assert: e negated op equals: #-