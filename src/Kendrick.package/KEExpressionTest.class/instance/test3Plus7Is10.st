tests
test3Plus7Is10
	| e a b o m |
	m := KEModel new.
	e := KEBinaryExpression new.
	a := KENumerical number:3.
	b := KENumerical number:7.
	o := #+.
	e
		op: o;
		leftHandSide: a;
		rightHandSide: b.
	self assert: (e evaluateWithModel: m) equals: 10