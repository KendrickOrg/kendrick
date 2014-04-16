tests
testSMultiplyByI
	|  m e a b o s i |
	
	m := KEModel new.
	m atCompartment: #S putNumberOfIndividuals: 5.
	m atCompartment: #I putNumberOfIndividuals: 6.
	
	e := KEBinaryExpression new.
	a := KEVariable new.
	b := KEVariable new.
	a symbol: #S.
	b symbol: #I.
	o := #*.
	e
		op: o;
		leftHandSide: a;
		rightHandSide: b.
	self assert: (e evaluateWithModel: m) equals: 30