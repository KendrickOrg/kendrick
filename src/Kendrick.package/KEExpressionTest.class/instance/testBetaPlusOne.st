tests
testBetaPlusOne
	| m e beta b o |
	m := KEModel new.
	m atParameter: #beta put: 2.
	e := KEBinaryExpression new.
	beta := KEVariable new.
	beta symbol: #beta.
	b := KENumerical number: 1.
	o := #+.
	e
		op: o;
		leftHandSide: beta;
		rightHandSide: b.
	self assert: (e evaluateWithModel: m) equals: 3