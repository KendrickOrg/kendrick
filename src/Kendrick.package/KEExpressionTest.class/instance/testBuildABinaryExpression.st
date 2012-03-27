as yet unclassified
testBuildABinaryExpression
	| e a b o |
	
	e := KEBinaryExpression new.
	a := KENumerical new.
	a number: 3.
	b := KENumerical new.
	b number: 7.
	o := KEOperator new.
	o symbol: #+.
	e
		op: o;
		leftHandSide: a;
		rightHandSide: b.
	self assert: e op symbol equals: #+