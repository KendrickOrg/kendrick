
!KEExpressionTest methodsFor: 'as yet unclassified'!
testSMultiplyByI
	|  m e a b o s i |
	
	m := KEModel new.
	s := (KECompartment new) status: #S; initialValue: 5.
     i := (KECompartment new) status: #I; initialValue: 6.

	m add: s; add: i.
	
	e := KEBinaryExpression new.
	a := KEVariable new.
	b := KEVariable new.
	a symbol: #S.
	b symbol: #I.
	o := KEOperator new.
	o symbol: #*.
	e
		op: o;
		leftHandSide: a;
		rightHandSide: b.
	self assert: (e evaluateWithModel: m) equals: 30! !
