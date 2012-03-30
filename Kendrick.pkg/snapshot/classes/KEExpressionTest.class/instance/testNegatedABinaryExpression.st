
!KEExpressionTest methodsFor: 'as yet unclassified'!
testNegatedABinaryExpression
	| e a b o |
	
	e := KEBinaryExpression new.
	a := KENumerical new.
	a number: 3.
	b := KENumerical new.
	b number: 7.
	o := #+.
	e
		op: o;
		leftHandSide: a;
		rightHandSide: b.
	self assert: e negated op equals: #-! !
