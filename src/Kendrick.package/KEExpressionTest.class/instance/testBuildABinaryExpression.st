as yet unclassified
testBuildABinaryExpression
	| e a b o |
	
	e := KEBinaryExpression new.
	a := KENumerical new.
	a value: 3.
	b := KENumerical new.
	b value: 7.
	o := KEOperator new.
	o symbol: #+.
	e
		op: o;
		leftHandSide: a;
		rightHandSide: b.
	self assert: e op symbol equals: #+