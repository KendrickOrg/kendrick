tests
testSMultiplyByI
	|  m e a b o s i |
	
	m := KEModel new.
	s := (KECompartment new) status: #S; numberOfIndividuals: 5.
     i := (KECompartment new) status: #I; numberOfIndividuals: 6.

	m addCompartment: s; addCompartment: i.
	
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